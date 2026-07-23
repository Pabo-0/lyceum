from collections import Counter
import json
from typing import Any

from django.conf import settings

from document_processing.neo4j_cypher import graph_to_cypher, split_cypher_statements
from document_processing.phase2_graph_builder import build_phase2_graph


class Neo4jGateway:
    def __init__(self) -> None:
        self.config = settings.NEO4J

    def is_configured(self) -> bool:
        return bool(self.config.get("URI") and self.config.get("USER") and self.config.get("PASSWORD"))

    def is_graph_backend(self) -> bool:
        return getattr(settings, "LYCEUM_GRAPH_BACKEND", "file") == "neo4j" and self.is_configured()

    def sync_on_ingest(self) -> bool:
        return bool(self.config.get("SYNC_ON_INGEST"))

    def sync_graph(self, graph: dict[str, Any]) -> dict[str, Any]:
        if not self.sync_on_ingest() and not self.is_graph_backend():
            return {"enabled": False, "status": "skipped", "reason": "sync_disabled"}
        if not self.is_configured():
            return {"enabled": True, "status": "skipped", "reason": "neo4j_not_configured"}

        return self.upsert_graph(graph, include_schema=True)

    def sync_document(
        self,
        document: dict[str, Any],
        context: dict[str, Any] | None = None,
        *,
        force: bool = False,
    ) -> dict[str, Any]:
        if not force and not self.sync_on_ingest() and not self.is_graph_backend():
            return {"enabled": False, "status": "skipped", "reason": "sync_disabled"}
        if not self.is_configured():
            return {"enabled": True, "status": "skipped", "reason": "neo4j_not_configured"}

        metadata = document.get("metadata") or {}
        document_id = str(metadata.get("document_id") or document.get("document_id") or "")
        if not document_id:
            return {"enabled": True, "status": "failed", "reason": "document_id_missing"}

        graph = build_phase2_graph(document, context)
        result = self.replace_document_graph(document_id, graph)
        return {
            **result,
            "enabled": True,
            "graph_format": "phase2",
            "node_count": graph.get("node_count", 0),
            "relationship_count": graph.get("relationship_count", 0),
            "node_counts_by_label": graph.get("node_counts_by_label", {}),
            "relationship_counts_by_type": graph.get("relationship_counts_by_type", {}),
        }

    def upsert_graph(self, graph: dict[str, Any], include_schema: bool = True) -> dict[str, Any]:
        if not self.is_configured():
            return {"enabled": True, "status": "skipped", "reason": "neo4j_not_configured"}

        cypher = graph_to_cypher(graph, include_schema=include_schema)
        statements = split_cypher_statements(cypher)
        try:
            self._run_statements(statements)
        except Exception as exc:
            return {"enabled": True, "status": "failed", "reason": str(exc)}
        return {
            "enabled": True,
            "status": "synced",
            "statement_count": len(statements),
        }

    def replace_document_graph(self, document_id: str, graph: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}

        statements = [
            *split_cypher_statements(graph_to_cypher({"nodes": [], "relationships": []}, include_schema=True)),
            self._delete_document_graph_statement(),
            *split_cypher_statements(graph_to_cypher(graph)),
        ]
        try:
            self._run_statements(
                statements,
                parameters=self._document_query_parameters(document_id),
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced", "statement_count": len(statements)}

    def delete_document_graph(self, document_id: str) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        if not document_id:
            return {"status": "skipped", "reason": "empty_document_id"}

        try:
            self._run_query(
                self._delete_document_graph_statement(),
                self._document_query_parameters(document_id),
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def clear_all_graph_data(self) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}

        try:
            self._run_query("MATCH (n) DETACH DELETE n", {})
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def graph_counts(self) -> dict[str, int]:
        if not self.is_configured():
            return {"nodes": 0, "relationships": 0}

        node_records = self._run_read_query("MATCH (n) RETURN count(n) AS count", {})
        relationship_records = self._run_read_query(
            "MATCH ()-[r]->() RETURN count(r) AS count",
            {},
        )
        return {
            "nodes": int(node_records[0].get("count") or 0) if node_records else 0,
            "relationships": int(relationship_records[0].get("count") or 0)
            if relationship_records
            else 0,
        }

    def list_documents(self) -> list[dict[str, Any]]:
        if not self.is_configured():
            return []

        records = self._run_read_query(
            (
                "MATCH (d:Document) "
                "RETURN properties(d) AS properties "
                "ORDER BY coalesce(d.title, ''), coalesce(d.document_id, '')"
            ),
            {},
        )
        documents = []
        for record in records:
            properties = dict(record.get("properties") or {})
            document_id = properties.get("document_id") or _document_id_from_node_id(
                str(properties.get("node_id", ""))
            )
            if not document_id:
                continue
            documents.append(_document_index_entry(document_id, properties))
        return documents

    def load_document_metadata(self, document_id: str) -> dict[str, Any]:
        if not self.is_configured():
            raise FileNotFoundError(f"Document not found: {document_id}")

        records = self._run_read_query(
            (
                "MATCH (d:Document {document_id: $document_id}) "
                "RETURN properties(d) AS properties LIMIT 1"
            ),
            {"document_id": document_id},
        )
        if not records:
            raise FileNotFoundError(f"Document not found: {document_id}")

        properties = dict(records[0].get("properties") or {})
        return _document_metadata(document_id, properties)

    def load_document_graph(self, document_id: str) -> dict[str, Any]:
        if not self.is_configured():
            raise FileNotFoundError(f"Document not found: {document_id}")

        node_records = self._run_read_query(
            (
                "MATCH (n) "
                "WHERE n.document_id = $document_id "
                "OR n.node_id = $document_node_id "
                "OR n.node_id STARTS WITH $section_prefix "
                "OR n.node_id STARTS WITH $chunk_prefix "
                "OR n.node_id STARTS WITH $manual_prefix "
                "OR n.node_id STARTS WITH $legacy_manual_prefix "
                "RETURN n.node_id AS node_id, labels(n) AS labels, properties(n) AS properties"
            ),
            self._document_query_parameters(document_id),
        )
        nodes = [_public_node(record) for record in node_records]
        if not nodes:
            raise FileNotFoundError(f"Document not found: {document_id}")

        node_ids = [node["node_id"] for node in nodes]
        relationship_records = self._run_read_query(
            (
                "MATCH (source)-[r:CONTAINS|RELATES|DEPENDS_ON|EVALUATES]->(target) "
                "WHERE source.node_id IN $node_ids AND target.node_id IN $node_ids "
                "RETURN r.relationship_id AS relationship_id, type(r) AS relationship_type, "
                "source.node_id AS source_id, target.node_id AS target_id, "
                "properties(r) AS properties"
            ),
            {"node_ids": node_ids},
        )
        relationships = [_public_relationship(record) for record in relationship_records]
        return _recount_graph({"nodes": nodes, "relationships": relationships})

    def find_document_id_for_node(self, node_id: str) -> str:
        parsed = _document_id_from_node_id(node_id)
        if parsed:
            return parsed

        records = self._run_read_query(
            "MATCH (n {node_id: $node_id}) RETURN n.document_id AS document_id LIMIT 1",
            {"node_id": node_id},
        )
        if records and records[0].get("document_id"):
            return str(records[0]["document_id"])
        raise KeyError(f"Node not found: {node_id}")

    def find_document_id_for_relationship(self, relationship_id: str) -> str:
        records = self._run_read_query(
            (
                "MATCH (source)-[r {relationship_id: $relationship_id}]->(target) "
                "RETURN source.node_id AS source_id, target.node_id AS target_id LIMIT 1"
            ),
            {"relationship_id": relationship_id},
        )
        if not records:
            raise KeyError(f"Relationship not found: {relationship_id}")

        for key in ("source_id", "target_id"):
            parsed = _document_id_from_node_id(str(records[0].get(key, "")))
            if parsed:
                return parsed
        raise KeyError(f"Relationship not found: {relationship_id}")

    def patch_node(self, node_id: str, properties: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                (
                    "MATCH (n {node_id: $node_id}) "
                    "SET n += $properties RETURN n.node_id AS node_id"
                ),
                {"node_id": node_id, "properties": _neo4j_properties(properties)},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def upsert_node(self, node: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        labels = [label for label in node.get("labels", []) if str(label).isidentifier()]
        if not labels:
            return {"status": "failed", "reason": "node_without_labels"}
        labels_cypher = "".join(f":{label}" for label in labels)
        properties = _neo4j_properties(node.get("properties", {}))
        properties["node_id"] = node["node_id"]
        try:
            self._run_query(
                (
                    f"MERGE (n:{labels[0]} {{node_id: $node_id}}) "
                    f"SET n{labels_cypher} "
                    "SET n += $properties RETURN n.node_id AS node_id"
                ),
                {"node_id": node["node_id"], "properties": properties},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def replace_node(self, node: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        labels = [label for label in node.get("labels", []) if str(label).isidentifier()]
        if not labels:
            return {"status": "failed", "reason": "node_without_labels"}

        known_labels = ["Section", "Content", "Chunk", "Concept"]
        labels_cypher = "".join(f":{label}" for label in labels)
        removable_labels = "".join(f":{label}" for label in known_labels)
        properties = _neo4j_properties(node.get("properties", {}))
        properties["node_id"] = node["node_id"]
        try:
            self._run_query(
                (
                    "MATCH (n {node_id: $node_id}) "
                    f"REMOVE n{removable_labels} "
                    f"SET n{labels_cypher} "
                    "SET n += $properties RETURN n.node_id AS node_id"
                ),
                {"node_id": node["node_id"], "properties": properties},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def patch_relationship(
        self,
        relationship_id: str,
        properties: dict[str, Any],
    ) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                (
                    "MATCH ()-[r {relationship_id: $relationship_id}]->() "
                    "SET r += $properties RETURN r.relationship_id AS relationship_id"
                ),
                {"relationship_id": relationship_id, "properties": properties},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def upsert_relationship(self, relationship: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        relationship_type = relationship["relationship_type"]
        if not str(relationship_type).isidentifier():
            return {"status": "failed", "reason": "invalid_relationship_type"}
        properties = dict(relationship.get("properties", {}))
        properties["relationship_id"] = relationship["relationship_id"]
        try:
            self._run_query(
                (
                    "MATCH (source {node_id: $source_id}) "
                    "MATCH (target {node_id: $target_id}) "
                    f"MERGE (source)-[r:{relationship_type} "
                    "{relationship_id: $relationship_id}]->(target) "
                    "SET r += $properties RETURN r.relationship_id AS relationship_id"
                ),
                {
                    "source_id": relationship["source_id"],
                    "target_id": relationship["target_id"],
                    "relationship_id": relationship["relationship_id"],
                    "properties": properties,
                },
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def delete_node(self, node_id: str) -> dict[str, Any]:
        return self.delete_nodes([node_id])

    def delete_nodes(self, node_ids: list[str]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        clean_node_ids = [str(node_id) for node_id in node_ids if node_id]
        if not clean_node_ids:
            return {"status": "skipped", "reason": "empty_node_ids"}
        try:
            self._run_query(
                "MATCH (n) WHERE n.node_id IN $node_ids DETACH DELETE n",
                {"node_ids": clean_node_ids},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced", "deleted_node_count": len(clean_node_ids)}

    def delete_graph(self, graph: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}

        document_id = _document_id_from_graph(graph)
        if document_id:
            return self.delete_document_graph(document_id)

        node_ids = [
            str(node.get("node_id", ""))
            for node in graph.get("nodes", [])
            if node.get("node_id")
        ]
        if not node_ids:
            return {"status": "skipped", "reason": "empty_graph"}

        try:
            self._run_query(
                "MATCH (n) WHERE n.node_id IN $node_ids DETACH DELETE n",
                {"node_ids": node_ids},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced", "deleted_node_count": len(node_ids)}

    def delete_relationship(self, relationship_id: str) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                "MATCH ()-[r {relationship_id: $relationship_id}]->() DELETE r",
                {"relationship_id": relationship_id},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def _run_statements(
        self,
        statements: list[str],
        parameters: dict[str, Any] | None = None,
    ) -> None:
        from neo4j import GraphDatabase

        driver = GraphDatabase.driver(
            self.config["URI"],
            auth=(self.config["USER"], self.config["PASSWORD"]),
        )
        try:
            session_options = self._session_options()
            with driver.session(**session_options) as session:
                for statement in statements:
                    session.run(statement, parameters or {}).consume()
        finally:
            driver.close()

    def _run_query(self, query: str, parameters: dict[str, Any]) -> None:
        from neo4j import GraphDatabase

        driver = GraphDatabase.driver(
            self.config["URI"],
            auth=(self.config["USER"], self.config["PASSWORD"]),
        )
        try:
            session_options = self._session_options()
            with driver.session(**session_options) as session:
                session.run(query, parameters).consume()
        finally:
            driver.close()

    def _run_read_query(self, query: str, parameters: dict[str, Any]) -> list[dict[str, Any]]:
        from neo4j import GraphDatabase

        driver = GraphDatabase.driver(
            self.config["URI"],
            auth=(self.config["USER"], self.config["PASSWORD"]),
        )
        try:
            session_options = self._session_options()
            with driver.session(**session_options) as session:
                result = session.run(query, parameters)
                return [dict(record) for record in result]
        finally:
            driver.close()

    def _session_options(self) -> dict[str, str]:
        database = self.config.get("DATABASE")
        if database:
            return {"database": database}
        return {}

    def _delete_document_graph_statement(self) -> str:
        return (
            "MATCH (n) "
            "WHERE n.document_id = $document_id "
            "OR n.node_id = $document_node_id "
            "OR n.node_id STARTS WITH $section_prefix "
            "OR n.node_id STARTS WITH $content_prefix "
            "OR n.node_id STARTS WITH $chunk_prefix "
            "OR n.node_id STARTS WITH $concept_prefix "
            "OR n.node_id STARTS WITH $manual_prefix "
            "OR n.node_id STARTS WITH $legacy_manual_prefix "
            "DETACH DELETE n"
        )

    def _document_query_parameters(self, document_id: str) -> dict[str, str]:
        return {
            "document_id": document_id,
            "document_node_id": f"document:{document_id}",
            "section_prefix": f"section:{document_id}:",
            "content_prefix": f"content:{document_id}:",
            "chunk_prefix": f"chunk:{document_id}:",
            "concept_prefix": f"concept:{document_id}:",
            "manual_prefix": f"manual-node:{document_id}:",
            "legacy_manual_prefix": f"manual:{document_id}:",
        }


def _document_index_entry(document_id: str, properties: dict[str, Any]) -> dict[str, Any]:
    return {
        "document_id": document_id,
        "title": str(properties.get("title", document_id)),
        "source_path": str(properties.get("source_path", "")),
        "source_extension": str(properties.get("source_extension", "")),
        "processing_status": str(properties.get("processing_status", "neo4j_ready")),
        "document_dir": "",
        "metadata_path": "",
        "structure_path": "",
        "concepts_path": "",
        "concept_mentions_path": "",
        "canonical_concepts_path": "",
        "normalized_concept_mentions_path": "",
        "semantic_relationships_path": "",
        "graph_path": "",
        "neo4j_cypher_path": "",
    }


def _document_metadata(document_id: str, properties: dict[str, Any]) -> dict[str, Any]:
    return {
        "document_id": document_id,
        "title": str(properties.get("title", document_id)),
        "source_path": str(properties.get("source_path", "")),
        "source_extension": str(properties.get("source_extension", "")),
        "created_at": str(properties.get("created_at", "")),
        "processing_status": str(properties.get("processing_status", "neo4j_ready")),
        "character_count": int(properties.get("character_count") or 0),
        "word_count": int(properties.get("word_count") or 0),
        "paragraph_count": int(properties.get("paragraph_count") or 0),
    }


def _public_node(record: dict[str, Any]) -> dict[str, Any]:
    properties = dict(record.get("properties") or {})
    node_id = str(record.get("node_id") or properties.pop("node_id", ""))
    properties.pop("node_id", None)
    if isinstance(properties.get("content_json"), str):
        try:
            properties["content_json"] = json.loads(properties["content_json"])
        except (TypeError, ValueError):
            pass
    return {
        "node_id": node_id,
        "labels": _sort_labels([str(label) for label in record.get("labels", [])]),
        "properties": properties,
    }


def _public_relationship(record: dict[str, Any]) -> dict[str, Any]:
    properties = dict(record.get("properties") or {})
    relationship_id = str(record.get("relationship_id") or properties.pop("relationship_id", ""))
    properties.pop("relationship_id", None)
    return {
        "relationship_id": relationship_id,
        "relationship_type": str(record.get("relationship_type", "")),
        "source_id": str(record.get("source_id", "")),
        "target_id": str(record.get("target_id", "")),
        "properties": properties,
    }


def _sort_labels(labels: list[str]) -> list[str]:
    order = {"Document": 0, "Section": 1, "Chunk": 2, "Content": 3, "Concept": 4}
    return sorted(labels, key=lambda label: (order.get(label, 99), label))


def _recount_graph(graph: dict[str, Any]) -> dict[str, Any]:
    node_counts: Counter[str] = Counter()
    relationship_counts: Counter[str] = Counter()

    for node in graph.get("nodes", []):
        for label in node.get("labels", []):
            node_counts[label] += 1
    for relationship in graph.get("relationships", []):
        relationship_counts[relationship.get("relationship_type", "")] += 1

    graph["node_count"] = len(graph.get("nodes", []))
    graph["relationship_count"] = len(graph.get("relationships", []))
    graph["node_counts_by_label"] = dict(sorted(node_counts.items()))
    graph["relationship_counts_by_type"] = dict(sorted(relationship_counts.items()))
    return graph


def _neo4j_properties(properties: dict[str, Any]) -> dict[str, Any]:
    serialized: dict[str, Any] = {}
    for key, value in properties.items():
        if isinstance(value, dict):
            serialized[key] = json.dumps(value, ensure_ascii=False, sort_keys=True)
        else:
            serialized[key] = value
    return serialized


def _document_id_from_node_id(node_id: str) -> str:
    if node_id.startswith("document:"):
        return node_id.split(":", 1)[1]

    for prefix in ("section:", "content:", "chunk:", "concept:", "manual-node:", "manual:"):
        if node_id.startswith(prefix):
            parts = node_id.split(":")
            if len(parts) >= 3:
                return parts[1]

    return ""


def _document_id_from_graph(graph: dict[str, Any]) -> str:
    for node in graph.get("nodes", []):
        properties = node.get("properties") or {}
        document_id = str(properties.get("document_id") or "")
        if document_id and "Document" in node.get("labels", []):
            return document_id
        parsed = _document_id_from_node_id(str(node.get("node_id") or ""))
        if parsed:
            return parsed
    return ""

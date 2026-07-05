from typing import Any

from django.conf import settings

from document_processing.neo4j_cypher import graph_to_cypher, split_cypher_statements


class Neo4jGateway:
    def __init__(self) -> None:
        self.config = settings.NEO4J

    def is_configured(self) -> bool:
        return bool(self.config.get("URI") and self.config.get("USER") and self.config.get("PASSWORD"))

    def sync_on_ingest(self) -> bool:
        return bool(self.config.get("SYNC_ON_INGEST"))

    def sync_graph(self, graph: dict[str, Any]) -> dict[str, Any]:
        if not self.sync_on_ingest():
            return {"enabled": False, "status": "skipped", "reason": "sync_disabled"}
        if not self.is_configured():
            return {"enabled": True, "status": "skipped", "reason": "neo4j_not_configured"}

        cypher = graph_to_cypher(graph, include_schema=True)
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

    def patch_node(self, node_id: str, properties: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                (
                    "MATCH (n {node_id: $node_id}) "
                    "SET n += $properties RETURN n.node_id AS node_id"
                ),
                {"node_id": node_id, "properties": properties},
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
        properties = dict(node.get("properties", {}))
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

        known_labels = ["Section", "Chunk", "Concept"]
        labels_cypher = "".join(f":{label}" for label in labels)
        removable_labels = "".join(f":{label}" for label in known_labels)
        properties = dict(node.get("properties", {}))
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
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}
        try:
            self._run_query(
                "MATCH (n {node_id: $node_id}) DETACH DELETE n",
                {"node_id": node_id},
            )
        except Exception as exc:
            return {"status": "failed", "reason": str(exc)}
        return {"status": "synced"}

    def delete_graph(self, graph: dict[str, Any]) -> dict[str, Any]:
        if not self.is_configured():
            return {"status": "skipped", "reason": "neo4j_not_configured"}

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

    def _run_statements(self, statements: list[str]) -> None:
        from neo4j import GraphDatabase

        driver = GraphDatabase.driver(
            self.config["URI"],
            auth=(self.config["USER"], self.config["PASSWORD"]),
        )
        try:
            session_options = self._session_options()
            with driver.session(**session_options) as session:
                for statement in statements:
                    session.run(statement).consume()
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

    def _session_options(self) -> dict[str, str]:
        database = self.config.get("DATABASE")
        if database:
            return {"database": database}
        return {}

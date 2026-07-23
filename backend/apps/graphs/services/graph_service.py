from collections import Counter
from datetime import datetime, timezone
from hashlib import sha256
import json
from pathlib import Path
from typing import Any
from uuid import uuid4

from django.conf import settings

from document_processing.neo4j_cypher import NODE_LABELS, RELATIONSHIP_TYPES, graph_to_cypher
from scripts.export_neo4j_cypher import export_neo4j_cypher

from .document_service import build_document_store
from .neo4j_gateway import Neo4jGateway
from .sql_registry import graph_space_for_document, touch_graph_space


class GraphService:
    def __init__(self) -> None:
        self.store = build_document_store()
        self.neo4j = Neo4jGateway()

    def create_node(
        self,
        document_id: str,
        labels: list[str],
        properties: dict[str, Any],
    ) -> dict[str, Any]:
        graph = self._load_graph(document_id)
        clean_labels = _clean_node_labels(labels)
        clean_properties = _sync_text_patch(_clean_patch_properties(properties))
        node = {
            "node_id": _manual_node_id(document_id),
            "labels": clean_labels,
            "properties": {
                "title": _default_node_title(clean_labels),
                "text": "",
                "document_id": document_id,
                "order": _next_node_order(graph),
                "manual": True,
                "created_at": _now_iso(),
                **clean_properties,
            },
        }
        node["properties"] = _with_content_fields(node["properties"])
        graph.setdefault("nodes", []).append(node)
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_graph(document_id, graph)
        return {
            "document_id": document_id,
            "graph": graph,
            "node": node,
            "neo4j_sync": neo4j_sync,
        }

    def create_relationship(
        self,
        document_id: str,
        source_id: str,
        target_id: str,
        relationship_type: str,
        properties: dict[str, Any],
    ) -> dict[str, Any]:
        graph = self._load_graph(document_id)
        _require_node_in_graph(graph, source_id)
        _require_node_in_graph(graph, target_id)
        clean_type = _clean_relationship_type(relationship_type)
        relationship = {
            "relationship_id": _relationship_id(clean_type, source_id, target_id, properties),
            "relationship_type": clean_type,
            "source_id": source_id,
            "target_id": target_id,
            "properties": {
                "manual": True,
                "status": "confirmed",
                "created_at": _now_iso(),
                **_clean_patch_properties(properties),
            },
        }
        graph.setdefault("relationships", []).append(relationship)
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_graph(document_id, graph)
        return {
            "document_id": document_id,
            "graph": graph,
            "relationship": relationship,
            "neo4j_sync": neo4j_sync,
        }

    def patch_node(
        self,
        node_id: str,
        properties: dict[str, Any],
        labels: list[str] | None = None,
    ) -> dict[str, Any]:
        document_id, graph, node = self._find_node(node_id)
        if labels is not None:
            raise ValueError("Node type cannot be changed after creation")
        clean_properties = _sync_text_patch(_clean_patch_properties(properties))
        node["properties"].update(clean_properties)
        node["properties"] = _with_content_fields(node["properties"])
        node["properties"]["updated_at"] = _now_iso()
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_node_patch(node_id, node)
        return {"document_id": document_id, "graph": graph, "node": node, "neo4j_sync": neo4j_sync}

    def patch_relationship(
        self,
        relationship_id: str,
        properties: dict[str, Any],
        relationship_type: str | None = None,
    ) -> dict[str, Any]:
        document_id, graph, relationship = self._find_relationship(relationship_id)
        type_changed = False
        if relationship_type:
            type_changed = relationship_type != relationship.get("relationship_type")
            relationship["relationship_type"] = _clean_relationship_type(relationship_type)
        relationship["properties"].update(_clean_patch_properties(properties))
        relationship["properties"]["updated_at"] = _now_iso()
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_graph(document_id, graph)
        return {
            "document_id": document_id,
            "graph": graph,
            "relationship": relationship,
            "neo4j_sync": neo4j_sync,
        }

    def delete_node(self, node_id: str, workspace_id: str | None = None) -> dict[str, Any]:
        document_id, graph, node = self._find_node(node_id)
        if "Document" in node.get("labels", []):
            raise ValueError("Document nodes cannot be deleted")
        deleted_node_ids = _node_ids_for_delete(graph, node_id)
        deleted_node_id_set = set(deleted_node_ids)
        deleted_nodes = [
            current_node
            for current_node in graph.get("nodes", [])
            if current_node.get("node_id") in deleted_node_id_set
        ]
        removed_relationships = [
            relationship
            for relationship in graph["relationships"]
            if (
                relationship["source_id"] in deleted_node_id_set
                or relationship["target_id"] in deleted_node_id_set
            )
        ]
        graph["nodes"] = [
            current_node
            for current_node in graph["nodes"]
            if current_node["node_id"] not in deleted_node_id_set
        ]
        graph["relationships"] = [
            relationship
            for relationship in graph["relationships"]
            if (
                relationship["source_id"] not in deleted_node_id_set
                and relationship["target_id"] not in deleted_node_id_set
            )
        ]
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_node_delete(deleted_node_ids)
        return {
            "document_id": document_id,
            "graph": graph,
            "deleted_node": node,
            "deleted_nodes": deleted_nodes,
            "deleted_node_count": len(deleted_node_ids),
            "deleted_relationship_count": len(removed_relationships),
            "neo4j_sync": neo4j_sync,
        }

    def delete_relationship(self, relationship_id: str) -> dict[str, Any]:
        document_id, graph, relationship = self._find_relationship(relationship_id)
        graph["relationships"] = [
            current_relationship
            for current_relationship in graph["relationships"]
            if current_relationship["relationship_id"] != relationship_id
        ]
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_graph(document_id, graph)
        return {
            "document_id": document_id,
            "graph": graph,
            "deleted_relationship": relationship,
            "neo4j_sync": neo4j_sync,
        }

    def merge_nodes(
        self,
        document_id: str,
        target_node_id: str,
        source_node_ids: list[str],
        properties: dict[str, Any],
    ) -> dict[str, Any]:
        graph = self._load_graph(document_id)
        target = _require_node_in_graph(graph, target_node_id)
        source_ids = [
            node_id
            for node_id in source_node_ids
            if node_id and node_id != target_node_id
        ]
        if not source_ids:
            raise ValueError("At least one source node must be selected")

        sources = [_require_node_in_graph(graph, source_id) for source_id in source_ids]
        if any("Document" in source.get("labels", []) for source in sources):
            raise ValueError("Document nodes cannot be merged into another node")

        target_properties = target.setdefault("properties", {})
        target_properties.update(_sync_text_patch(_merged_node_properties(target, sources)))
        target_properties.update(_sync_text_patch(_clean_patch_properties(properties)))
        target["properties"] = _with_content_fields(target_properties)
        target_properties = target["properties"]
        target_properties["manual_merged"] = True
        target_properties["updated_at"] = _now_iso()

        for relationship in graph.get("relationships", []):
            if relationship.get("source_id") in source_ids:
                relationship["source_id"] = target_node_id
            if relationship.get("target_id") in source_ids:
                relationship["target_id"] = target_node_id

        graph["nodes"] = [
            node
            for node in graph.get("nodes", [])
            if node.get("node_id") not in source_ids
        ]
        graph["relationships"] = _dedupe_relationships(
            [
                relationship
                for relationship in graph.get("relationships", [])
                if relationship.get("source_id") != relationship.get("target_id")
            ]
        )
        self._persist_graph(document_id, graph)
        touch_graph_space(document_id)
        neo4j_sync = self._sync_neo4j_graph(document_id, graph)
        return {
            "document_id": document_id,
            "graph": graph,
            "node": target,
            "merged_node_ids": source_ids,
            "neo4j_sync": neo4j_sync,
        }

    def _load_graph(self, document_id: str) -> dict[str, Any]:
        try:
            document = self.store.load_document(document_id)
            return document.get("graph", {})
        except FileNotFoundError:
            if self.neo4j.is_graph_backend():
                return self.neo4j.load_document_graph(document_id)
            raise

    def _find_node(self, node_id: str) -> tuple[str, dict[str, Any], dict[str, Any]]:
        for document in self.store.load_all():
            graph = document.get("graph", {})
            for node in graph.get("nodes", []):
                if node.get("node_id") == node_id:
                    return document["metadata"]["document_id"], graph, node

        if self.neo4j.is_graph_backend():
            try:
                document_id = self.neo4j.find_document_id_for_node(node_id)
                graph = self.neo4j.load_document_graph(document_id)
                for node in graph.get("nodes", []):
                    if node.get("node_id") == node_id:
                        return document_id, graph, node
            except Exception:
                pass
        raise KeyError(f"Node not found: {node_id}")

    def _find_relationship(
        self,
        relationship_id: str,
    ) -> tuple[str, dict[str, Any], dict[str, Any]]:
        for document in self.store.load_all():
            graph = document.get("graph", {})
            for relationship in graph.get("relationships", []):
                if relationship.get("relationship_id") == relationship_id:
                    return document["metadata"]["document_id"], graph, relationship

        if self.neo4j.is_graph_backend():
            try:
                document_id = self.neo4j.find_document_id_for_relationship(relationship_id)
                graph = self.neo4j.load_document_graph(document_id)
                for relationship in graph.get("relationships", []):
                    if relationship.get("relationship_id") == relationship_id:
                        return document_id, graph, relationship
            except Exception:
                pass
        raise KeyError(f"Relationship not found: {relationship_id}")

    def _persist_graph(self, document_id: str, graph: dict[str, Any]) -> None:
        _recount_graph(graph)
        document_dir = settings.LYCEUM_DOCUMENTS_DIR / document_id
        if self.neo4j.is_graph_backend() and not (document_dir / "metadata.json").exists():
            return

        _write_json(document_dir / "graph.json", graph)
        (document_dir / "neo4j.cypher").write_text(
            graph_to_cypher(graph),
            encoding="utf-8",
        )
        export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)

    def _sync_neo4j_graph(self, document_id: str, graph: dict[str, Any]) -> dict[str, Any]:
        document = self._document_for_phase2_sync(document_id, graph)
        graph_space = graph_space_for_document(document_id)
        return self.neo4j.sync_document(
            document,
            _phase2_graph_context(graph_space),
        )

    def _should_sync_neo4j_incrementally(self) -> bool:
        return self.neo4j.sync_on_ingest() or self.neo4j.is_graph_backend()

    def _sync_neo4j_node_patch(
        self,
        node_id: str,
        node: dict[str, Any],
    ) -> dict[str, Any]:
        if not self._should_sync_neo4j_incrementally():
            return {"enabled": False, "status": "skipped", "reason": "sync_disabled"}
        return self.neo4j.patch_node(node_id, node.get("properties", {}))

    def _sync_neo4j_node_delete(self, node_ids: list[str]) -> dict[str, Any]:
        if not self._should_sync_neo4j_incrementally():
            return {"enabled": False, "status": "skipped", "reason": "sync_disabled"}
        return self.neo4j.delete_nodes(node_ids)

    def _document_for_phase2_sync(self, document_id: str, graph: dict[str, Any]) -> dict[str, Any]:
        try:
            document = self.store.load_document(document_id)
        except FileNotFoundError:
            graph_space = graph_space_for_document(document_id)
            document = {
                "metadata": {
                    "document_id": document_id,
                    "title": graph_space.title if graph_space else document_id,
                    "language": (
                        graph_space.workspace.default_language
                        if graph_space
                        else "es-MX"
                    ),
                },
                "concept_deduplication": {"concepts": [], "mentions": []},
                "semantic_relationships": {"relationships": []},
                "graph": graph,
            }
        else:
            document["graph"] = graph
        return document


def _clean_patch_properties(properties: dict[str, Any]) -> dict[str, Any]:
    cleaned: dict[str, Any] = {}
    for key, value in properties.items():
        if not isinstance(key, str) or not key:
            raise ValueError("Property names must be non-empty strings")
        if _is_supported_value(value):
            cleaned[key] = value
        else:
            raise ValueError(f"Unsupported property value for '{key}'")
    return cleaned


def _with_content_fields(properties: dict[str, Any]) -> dict[str, Any]:
    content_text = str(
        properties.get("content_text")
        or properties.get("text")
        or properties.get("content")
        or properties.get("body")
        or ""
    )
    content_json = properties.get("content_json")
    if not isinstance(content_json, dict) or content_json.get("type") != "doc":
        content_json = _plain_text_doc(content_text)

    content_markdown = str(properties.get("content_markdown") or content_text)
    normalized = dict(properties)
    normalized["content_json"] = content_json
    normalized["content_markdown"] = content_markdown
    normalized["content_text"] = content_text
    normalized["content_version"] = int(properties.get("content_version") or 1)
    normalized.setdefault("text", content_text)
    return normalized


def _sync_text_patch(properties: dict[str, Any]) -> dict[str, Any]:
    if "text" not in properties:
        return properties
    text = str(properties.get("text") or "")
    synced = dict(properties)
    synced.setdefault("content_json", _plain_text_doc(text))
    synced.setdefault("content_markdown", text)
    synced.setdefault("content_text", text)
    synced.setdefault("content_version", 1)
    return synced


def _plain_text_doc(text: str) -> dict[str, Any]:
    paragraphs = [
        paragraph.strip()
        for paragraph in str(text or "").split("\n\n")
        if paragraph.strip()
    ]
    return {
        "type": "doc",
        "content": [
            {
                "type": "paragraph",
                "content": [{"type": "text", "text": paragraph}],
            }
            for paragraph in paragraphs
        ],
    }


def _clean_node_labels(labels: list[str]) -> list[str]:
    if isinstance(labels, str):
        labels = [labels]
    if not isinstance(labels, list):
        raise ValueError("Node labels must be a list")
    if not labels:
        raise ValueError("At least one node label is required")
    clean_labels = []
    for label in labels:
        if label not in NODE_LABELS:
            raise ValueError(f"Unsupported node label: {label}")
        if label == "Document":
            raise ValueError("Document nodes are created by the ingest pipeline")
        if label == "Section":
            raise ValueError("Section nodes are created by the ingest pipeline")
        if label not in clean_labels:
            clean_labels.append(label)
    return clean_labels


def _clean_relationship_type(relationship_type: str) -> str:
    if not relationship_type:
        raise ValueError("Relationship type is required")
    if relationship_type not in RELATIONSHIP_TYPES:
        raise ValueError(f"Unsupported relationship type: {relationship_type}")
    return relationship_type


def _is_supported_value(value: Any) -> bool:
    if value is None:
        return True
    if isinstance(value, (str, int, float, bool)):
        return True
    if isinstance(value, list):
        return all(item is None or isinstance(item, (str, int, float, bool)) for item in value)
    if isinstance(value, dict):
        try:
            json.dumps(value, ensure_ascii=False)
        except (TypeError, ValueError):
            return False
        return True
    return False


def _recount_graph(graph: dict[str, Any]) -> None:
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


def _write_json(path: Path, data: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as file:
        json.dump(data, file, ensure_ascii=False, indent=2)
        file.write("\n")


def _manual_node_id(document_id: str) -> str:
    return f"manual-node:{document_id}:{uuid4().hex[:12]}"


def _relationship_id(
    relationship_type: str,
    source_id: str,
    target_id: str,
    properties: dict[str, Any],
) -> str:
    seed = json.dumps(
        {
            "type": relationship_type,
            "source": source_id,
            "target": target_id,
            "properties": properties,
            "nonce": uuid4().hex,
        },
        ensure_ascii=False,
        sort_keys=True,
    )
    digest = sha256(seed.encode("utf-8")).hexdigest()[:16]
    return f"relationship:{digest}"


def _default_node_title(labels: list[str]) -> str:
    primary = labels[0]
    if primary == "Section":
        return "Nuevo tema"
    if primary == "Concept":
        return "Nuevo concepto"
    return "Nuevo contenido"


def _next_node_order(graph: dict[str, Any]) -> int:
    orders = [
        node.get("properties", {}).get("order")
        for node in graph.get("nodes", [])
        if isinstance(node.get("properties", {}).get("order"), int)
    ]
    return max(orders, default=0) + 1


def _require_node_in_graph(graph: dict[str, Any], node_id: str) -> dict[str, Any]:
    for node in graph.get("nodes", []):
        if node.get("node_id") == node_id:
            return node
    raise KeyError(f"Node not found in document graph: {node_id}")


def _node_ids_for_delete(graph: dict[str, Any], node_id: str) -> list[str]:
    node = _require_node_in_graph(graph, node_id)
    if "Section" not in node.get("labels", []):
        return [node_id]

    node_by_id = {
        current_node.get("node_id"): current_node
        for current_node in graph.get("nodes", [])
        if current_node.get("node_id")
    }
    deleted_ids: list[str] = []
    queued_ids = [node_id]

    while queued_ids:
        current_id = queued_ids.pop(0)
        if current_id in deleted_ids:
            continue
        deleted_ids.append(current_id)

        for relationship in graph.get("relationships", []):
            if not _is_child_content_relationship(relationship, current_id):
                continue
            child_id = relationship.get("target_id")
            child_node = node_by_id.get(child_id)
            if not _is_section_delete_child(child_node):
                continue
            queued_ids.append(child_id)

    return deleted_ids


def _is_child_content_relationship(relationship: dict[str, Any], source_id: str) -> bool:
    if relationship.get("source_id") != source_id:
        return False
    return relationship.get("relationship_type") == "CONTAINS"


def _is_section_delete_child(node: dict[str, Any] | None) -> bool:
    labels = node.get("labels", []) if node else []
    return "Section" in labels or "Chunk" in labels


def _merged_node_properties(
    target: dict[str, Any],
    sources: list[dict[str, Any]],
) -> dict[str, Any]:
    source_titles = [
        source.get("properties", {}).get("title", source.get("node_id", ""))
        for source in sources
    ]
    source_texts = [
        source.get("properties", {}).get("text")
        or source.get("properties", {}).get("content")
        or ""
        for source in sources
    ]
    existing_text = (
        target.get("properties", {}).get("text")
        or target.get("properties", {}).get("content")
        or ""
    )
    merged_text = "\n\n".join(
        part
        for part in [existing_text, *source_texts]
        if str(part).strip()
    )
    return {
        "text": merged_text,
        "merged_from_node_ids": [
            *target.get("properties", {}).get("merged_from_node_ids", []),
            *[source.get("node_id") for source in sources],
        ],
        "merged_from_titles": [
            *target.get("properties", {}).get("merged_from_titles", []),
            *source_titles,
        ],
    }


def _dedupe_relationships(relationships: list[dict[str, Any]]) -> list[dict[str, Any]]:
    seen: set[tuple[str, str, str]] = set()
    deduped: list[dict[str, Any]] = []
    for relationship in relationships:
        key = (
            relationship.get("relationship_type", ""),
            relationship.get("source_id", ""),
            relationship.get("target_id", ""),
        )
        if key in seen:
            continue
        seen.add(key)
        deduped.append(relationship)
    return deduped


def _now_iso() -> str:
    return datetime.now(timezone.utc).isoformat()


def _phase2_graph_context(graph_space) -> dict[str, str]:
    if graph_space is None:
        return {}
    workspace = graph_space.workspace
    owner_id = getattr(workspace, "owner_id", None)
    return {
        "workspace_id": str(graph_space.workspace_id),
        "graph_space_id": str(graph_space.pk),
        "created_by": str(owner_id) if owner_id else "",
        "updated_by": str(owner_id) if owner_id else "",
        "language": workspace.default_language,
    }

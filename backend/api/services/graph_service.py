from collections import Counter
import json
from pathlib import Path
from typing import Any

from django.conf import settings

from document_processing.neo4j_cypher import graph_to_cypher
from scripts.export_neo4j_cypher import export_neo4j_cypher

from .document_service import build_document_store
from .neo4j_gateway import Neo4jGateway


class GraphService:
    def __init__(self) -> None:
        self.store = build_document_store()
        self.neo4j = Neo4jGateway()

    def patch_node(self, node_id: str, properties: dict[str, Any]) -> dict[str, Any]:
        document_id, graph, node = self._find_node(node_id)
        node["properties"].update(_clean_patch_properties(properties))
        self._persist_graph(document_id, graph)
        neo4j_sync = self.neo4j.patch_node(node_id, node["properties"])
        return {"document_id": document_id, "node": node, "neo4j_sync": neo4j_sync}

    def patch_relationship(
        self,
        relationship_id: str,
        properties: dict[str, Any],
    ) -> dict[str, Any]:
        document_id, graph, relationship = self._find_relationship(relationship_id)
        relationship["properties"].update(_clean_patch_properties(properties))
        self._persist_graph(document_id, graph)
        neo4j_sync = self.neo4j.patch_relationship(
            relationship_id,
            relationship["properties"],
        )
        return {
            "document_id": document_id,
            "relationship": relationship,
            "neo4j_sync": neo4j_sync,
        }

    def delete_node(self, node_id: str) -> dict[str, Any]:
        document_id, graph, node = self._find_node(node_id)
        removed_relationships = [
            relationship
            for relationship in graph["relationships"]
            if relationship["source_id"] == node_id or relationship["target_id"] == node_id
        ]
        graph["nodes"] = [
            current_node
            for current_node in graph["nodes"]
            if current_node["node_id"] != node_id
        ]
        graph["relationships"] = [
            relationship
            for relationship in graph["relationships"]
            if relationship["source_id"] != node_id and relationship["target_id"] != node_id
        ]
        self._persist_graph(document_id, graph)
        neo4j_sync = self.neo4j.delete_node(node_id)
        return {
            "document_id": document_id,
            "deleted_node": node,
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
        neo4j_sync = self.neo4j.delete_relationship(relationship_id)
        return {
            "document_id": document_id,
            "deleted_relationship": relationship,
            "neo4j_sync": neo4j_sync,
        }

    def _find_node(self, node_id: str) -> tuple[str, dict[str, Any], dict[str, Any]]:
        for document in self.store.load_all():
            graph = document.get("graph", {})
            for node in graph.get("nodes", []):
                if node.get("node_id") == node_id:
                    return document["metadata"]["document_id"], graph, node
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
        raise KeyError(f"Relationship not found: {relationship_id}")

    def _persist_graph(self, document_id: str, graph: dict[str, Any]) -> None:
        _recount_graph(graph)
        document_dir = settings.LYCEUM_DOCUMENTS_DIR / document_id
        _write_json(document_dir / "graph.json", graph)
        (document_dir / "neo4j.cypher").write_text(
            graph_to_cypher(graph),
            encoding="utf-8",
        )
        export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)


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


def _is_supported_value(value: Any) -> bool:
    if value is None:
        return True
    if isinstance(value, (str, int, float, bool)):
        return True
    if isinstance(value, list):
        return all(item is None or isinstance(item, (str, int, float, bool)) for item in value)
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

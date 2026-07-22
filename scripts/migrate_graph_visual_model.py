from collections import Counter
from pathlib import Path
import json
import sys


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.config import DEFAULT_DOCUMENTS_DIR
from document_processing.neo4j_cypher import graph_to_cypher


ALLOWED_NODE_LABELS = {"Document", "Section", "Chunk", "Content", "Concept"}

RELATIONSHIP_TYPE_ALIASES = {
    "HAS_SECTION": "CONTAINS",
    "HAS_SUBSECTION": "CONTAINS",
    "HAS_CHUNK": "CONTAINS",
    "MENTIONS": "RELATES",
    "RELATED_TO": "RELATES",
    "PREREQUISITE_CANDIDATE": "DEPENDS_ON",
    "SUPPORTS": "RELATES",
    "CONTRADICTS": "RELATES",
    "EXPLAINS": "RELATES",
    "DEPENDS_ON": "DEPENDS_ON",
    "CUSTOM_RELATION": "RELATES",
    "DIRECTIONAL": "RELATES",
    "BIDIRECTIONAL": "RELATES",
    "SEMANTIC": "RELATES",
}

STRUCTURAL_ROLES = {
    "HAS_SECTION": "section",
    "HAS_SUBSECTION": "subsection",
    "HAS_CHUNK": "chunk",
}


def migrate_graph(graph: dict) -> dict:
    nodes = [_migrate_node(node) for node in graph.get("nodes", [])]
    relationships = [
        _migrate_relationship(relationship)
        for relationship in graph.get("relationships", [])
    ]
    return {
        **graph,
        "nodes": nodes,
        "relationships": relationships,
        "node_count": len(nodes),
        "relationship_count": len(relationships),
        "node_counts_by_label": _count_node_labels(nodes),
        "relationship_counts_by_type": _count_relationship_types(relationships),
    }


def migrate_all_documents(documents_dir: Path | None = None) -> dict[str, int]:
    active_documents_dir = documents_dir or PROJECT_ROOT / DEFAULT_DOCUMENTS_DIR
    migrated_documents = 0
    migrated_relationships = 0

    for graph_path in sorted(active_documents_dir.glob("*/graph.json")):
        graph = _read_json(graph_path)
        migrated_graph = migrate_graph(graph)
        migrated_relationships += _changed_relationship_count(graph, migrated_graph)

        _write_json(graph_path, migrated_graph)
        (graph_path.parent / "neo4j.cypher").write_text(
            graph_to_cypher(migrated_graph),
            encoding="utf-8",
        )
        migrated_documents += 1

    return {
        "document_count": migrated_documents,
        "relationship_count": migrated_relationships,
    }


def _migrate_node(node: dict) -> dict:
    labels = []
    for label in node.get("labels", []):
        next_label = {"Note": "Content"}.get(label, label)
        if next_label in ALLOWED_NODE_LABELS and next_label not in labels:
            labels.append(next_label)

    if not labels:
        labels = ["Concept"]

    return {**node, "labels": labels}


def _migrate_relationship(relationship: dict) -> dict:
    current_type = relationship.get("relationship_type", "RELATES")
    next_type = RELATIONSHIP_TYPE_ALIASES.get(current_type, current_type)
    if next_type not in {"CONTAINS", "RELATES", "DEPENDS_ON", "EVALUATES"}:
        next_type = "RELATES"
    properties = dict(relationship.get("properties", {}))

    structural_role = STRUCTURAL_ROLES.get(current_type)
    if structural_role and not properties.get("role"):
        properties["role"] = structural_role

    return {
        **relationship,
        "relationship_type": next_type,
        "properties": properties,
    }


def _changed_relationship_count(before: dict, after: dict) -> int:
    return sum(
        1
        for old, new in zip(before.get("relationships", []), after["relationships"])
        if old.get("relationship_type") != new.get("relationship_type")
        or old.get("properties", {}).get("role") != new.get("properties", {}).get("role")
    )


def _count_node_labels(nodes: list[dict]) -> dict[str, int]:
    counter: Counter[str] = Counter()
    for node in nodes:
        for label in node.get("labels", []):
            counter[label] += 1
    return dict(sorted(counter.items()))


def _count_relationship_types(relationships: list[dict]) -> dict[str, int]:
    counter = Counter(
        relationship.get("relationship_type", "RELATES")
        for relationship in relationships
    )
    return dict(sorted(counter.items()))


def _read_json(path: Path) -> dict:
    with path.open("r", encoding="utf-8") as file:
        data = json.load(file)
    if not isinstance(data, dict):
        raise ValueError(f"JSON file must contain an object: {path}")
    return data


def _write_json(path: Path, data: dict) -> None:
    with path.open("w", encoding="utf-8") as file:
        json.dump(data, file, ensure_ascii=False, indent=2)
        file.write("\n")


def main() -> int:
    summary = migrate_all_documents()
    print("Graph visual model migration ready.")
    print(f"documents={summary['document_count']}")
    print(f"relationships_changed={summary['relationship_count']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

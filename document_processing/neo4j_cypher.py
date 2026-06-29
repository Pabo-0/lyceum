import json
import re
from typing import Any


NODE_LABELS = {"Document", "Section", "Chunk"}
RELATIONSHIP_TYPES = {
    "HAS_SECTION",
    "HAS_SUBSECTION",
    "HAS_CHUNK",
}
PROPERTY_NAME_PATTERN = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")


def build_neo4j_schema_cypher() -> str:
    statements = [
        "CREATE CONSTRAINT document_node_id IF NOT EXISTS FOR (n:Document) REQUIRE n.node_id IS UNIQUE",
        "CREATE CONSTRAINT section_node_id IF NOT EXISTS FOR (n:Section) REQUIRE n.node_id IS UNIQUE",
        "CREATE CONSTRAINT chunk_node_id IF NOT EXISTS FOR (n:Chunk) REQUIRE n.node_id IS UNIQUE",
        "CREATE INDEX document_title IF NOT EXISTS FOR (n:Document) ON (n.title)",
        "CREATE INDEX section_title IF NOT EXISTS FOR (n:Section) ON (n.title)",
        "CREATE INDEX has_section_relationship_id IF NOT EXISTS FOR ()-[r:HAS_SECTION]-() ON (r.relationship_id)",
        "CREATE INDEX has_subsection_relationship_id IF NOT EXISTS FOR ()-[r:HAS_SUBSECTION]-() ON (r.relationship_id)",
        "CREATE INDEX has_chunk_relationship_id IF NOT EXISTS FOR ()-[r:HAS_CHUNK]-() ON (r.relationship_id)",
    ]
    return _join_statements(statements)


def build_neo4j_verification_cypher() -> str:
    statements = [
        "MATCH (n) RETURN labels(n) AS labels, count(n) AS count ORDER BY labels",
        "MATCH ()-[r]->() RETURN type(r) AS relationship_type, count(r) AS count ORDER BY relationship_type",
        "MATCH (d:Document)-[:HAS_SECTION]->(s:Section) RETURN d.title AS document, count(s) AS sections ORDER BY document",
        "MATCH (:Section)-[:HAS_CHUNK]->(c:Chunk) RETURN count(c) AS chunks",
    ]
    return _join_statements(statements)


def graph_to_cypher(graph: dict[str, Any], include_schema: bool = False) -> str:
    statements: list[str] = []
    if include_schema:
        statements.extend(split_cypher_statements(build_neo4j_schema_cypher()))

    for node in graph.get("nodes", []):
        statements.append(_node_to_cypher(node))

    for relationship in graph.get("relationships", []):
        statements.append(_relationship_to_cypher(relationship))

    return _join_statements(statements)


def _node_to_cypher(node: dict[str, Any]) -> str:
    node_id = node["node_id"]
    labels = _validate_labels(node.get("labels", []))
    primary_label = labels[0]
    properties = _clean_properties(node.get("properties", {}))
    properties["node_id"] = node_id
    labels_cypher = "".join(f":{label}" for label in labels)

    return (
        f"MERGE (n:{primary_label} {{node_id: {_cypher_value(node_id)}}})\n"
        f"SET n{labels_cypher}\n"
        f"SET n += {_cypher_map(properties)}"
    )


def _relationship_to_cypher(relationship: dict[str, Any]) -> str:
    relationship_id = relationship["relationship_id"]
    relationship_type = _validate_relationship_type(relationship["relationship_type"])
    source_id = relationship["source_id"]
    target_id = relationship["target_id"]
    properties = _clean_properties(relationship.get("properties", {}))
    properties["relationship_id"] = relationship_id

    return (
        f"MATCH (source {{node_id: {_cypher_value(source_id)}}})\n"
        f"MATCH (target {{node_id: {_cypher_value(target_id)}}})\n"
        f"MERGE (source)-[r:{relationship_type} {{relationship_id: {_cypher_value(relationship_id)}}}]->(target)\n"
        f"SET r += {_cypher_map(properties)}"
    )


def _validate_labels(labels: list[str]) -> list[str]:
    valid_labels = [label for label in labels if label in NODE_LABELS]
    if not valid_labels:
        raise ValueError(f"Node must have at least one supported label: {labels}")
    return valid_labels


def _validate_relationship_type(relationship_type: str) -> str:
    if relationship_type not in RELATIONSHIP_TYPES:
        raise ValueError(f"Unsupported relationship type: {relationship_type}")
    return relationship_type


def _clean_properties(properties: dict[str, Any]) -> dict[str, Any]:
    return {
        key: value
        for key, value in properties.items()
        if value is not None and _is_supported_property_value(value)
    }


def _is_supported_property_value(value: Any) -> bool:
    if isinstance(value, (str, int, float, bool)):
        return True
    if isinstance(value, list):
        return all(isinstance(item, (str, int, float, bool)) for item in value)
    return False


def _cypher_map(properties: dict[str, Any]) -> str:
    items = []
    for key in sorted(properties):
        if not PROPERTY_NAME_PATTERN.match(key):
            raise ValueError(f"Unsupported property name: {key}")
        items.append(f"{key}: {_cypher_value(properties[key])}")
    return "{" + ", ".join(items) + "}"


def _cypher_value(value: Any) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, list):
        return "[" + ", ".join(_cypher_value(item) for item in value) + "]"
    return json.dumps(str(value), ensure_ascii=False)


def _join_statements(statements: list[str]) -> str:
    return ";\n\n".join(statement.rstrip(";") for statement in statements) + ";\n"


def split_cypher_statements(cypher: str) -> list[str]:
    statements: list[str] = []
    current: list[str] = []
    active_quote: str | None = None
    escaped = False

    for character in cypher:
        if active_quote:
            current.append(character)
            if escaped:
                escaped = False
            elif character == "\\":
                escaped = True
            elif character == active_quote:
                active_quote = None
            continue

        if character in {"'", '"'}:
            active_quote = character
            current.append(character)
            continue

        if character == ";":
            statement = "".join(current).strip()
            if statement:
                statements.append(statement)
            current = []
            continue

        current.append(character)

    statement = "".join(current).strip()
    if statement:
        statements.append(statement)

    return statements

from collections import Counter
from hashlib import sha256
from pathlib import Path
from typing import Any


NODE_TYPE_LABELS = {
    "document": "Document",
    "section": "Section",
    "content": "Content",
    "chunk": "Chunk",
    "concept": "Concept",
}


def build_phase2_graph(
    document: dict[str, Any],
    context: dict[str, Any] | None = None,
) -> dict[str, Any]:
    metadata = document.get("metadata") or {}
    graph = document.get("graph") or {}
    visible_nodes = graph.get("nodes") or []
    visible_relationships = graph.get("relationships") or []
    document_id = str(metadata.get("document_id") or document.get("document_id") or "")
    if not document_id:
        return _recount_graph({"nodes": [], "relationships": []})

    active_context = context or {}
    document_node_id = f"document:{document_id}"
    parent_by_target = _structural_parent_map(visible_relationships)
    desired_node_ids: set[str] = set()
    phase2_nodes: list[dict[str, Any]] = []
    phase2_relationships: list[dict[str, Any]] = []

    for node in sorted(visible_nodes, key=_node_sort_key):
        node_id = str(node.get("node_id") or "")
        if not node_id:
            continue
        node_type = _node_type_from_labels(node.get("labels") or [])
        desired_node_ids.add(node_id)
        phase2_nodes.append(
            {
                "node_id": node_id,
                "labels": [_node_label(node_type)],
                "properties": _node_properties(
                    context=active_context,
                    metadata=metadata,
                    node=node,
                    document_id=document_id,
                    document_node_id=document_node_id,
                    parent_by_target=parent_by_target,
                ),
            }
        )

    for relationship in visible_relationships:
        source_id = str(relationship.get("source_id") or "")
        target_id = str(relationship.get("target_id") or "")
        relationship_id = str(relationship.get("relationship_id") or "")
        relationship_type = _relationship_type(
            relationship.get("relationship_type"),
            (relationship.get("properties") or {}).get("role"),
        )
        if (
            not relationship_id
            or source_id not in desired_node_ids
            or target_id not in desired_node_ids
            or relationship_type not in {"CONTAINS", "RELATES", "DEPENDS_ON", "EVALUATES"}
        ):
            continue
        phase2_relationships.append(
            {
                "relationship_id": relationship_id,
                "relationship_type": relationship_type,
                "source_id": source_id,
                "target_id": target_id,
                "properties": _relationship_properties(
                    context=active_context,
                    document_id=document_id,
                    relationship=relationship,
                ),
            }
        )

    return _recount_graph({"nodes": phase2_nodes, "relationships": phase2_relationships})


def namespaced_graph_id(prefix: str, document_id: str, raw_id: Any) -> str:
    clean_raw_id = str(raw_id or "").strip()
    if not clean_raw_id:
        return ""
    candidate = f"{prefix}:{document_id}:{clean_raw_id}"
    if len(candidate) <= 255:
        return candidate
    return f"{prefix}:{document_id}:{hash_text(clean_raw_id)}"


def hash_text(value: Any) -> str:
    return sha256(str(value or "").encode("utf-8")).hexdigest()


def _node_properties(
    *,
    context: dict[str, Any],
    metadata: dict[str, Any],
    node: dict[str, Any],
    document_id: str,
    document_node_id: str,
    parent_by_target: dict[str, str],
) -> dict[str, Any]:
    properties = node.get("properties") or {}
    node_id = str(node.get("node_id") or "")
    node_type = _node_type_from_labels(node.get("labels") or [])
    content_text = str(properties.get("content_text") or properties.get("text") or "")
    title = _short_text(properties.get("title") or node_id, 64)
    phase2: dict[str, Any] = {
        **_common_node_properties(
            context=context,
            metadata=metadata,
            document_id=document_id,
            node_type=node_type,
            title=title,
            manual=bool(properties.get("manual", False)),
        ),
        "document_node_id": None if node_type == "document" else document_node_id,
        "content_json": properties.get("content_json"),
        "content_markdown": str(properties.get("content_markdown") or content_text),
        "content_text": content_text,
        "content_version": _int_or_none(properties.get("content_version"))
        or (1 if content_text or properties.get("content_json") else None),
        "level": _int_or_none(properties.get("level")),
        "order": _int_or_none(properties.get("order")),
        "start_position": _int_or_none(
            properties.get("start_position") or properties.get("start_line")
        ),
        "end_position": _int_or_none(properties.get("end_position") or properties.get("end_line")),
        "summary": str(properties.get("summary") or "")[:2000],
        "word_count": _int_or_none(properties.get("word_count")),
        "character_count": _int_or_none(properties.get("character_count")),
    }

    if node_type == "document":
        phase2.update(
            {
                "source_type": str(properties.get("source_type") or "upload")[:16],
                "source_path": str(properties.get("source_path") or metadata.get("source_path") or ""),
                "source_url": str(properties.get("source_url") or ""),
                "source_extension": str(
                    properties.get("source_extension") or metadata.get("source_extension") or ""
                )[:16],
                "processing_status": _processing_status(
                    properties.get("processing_status") or metadata.get("processing_status")
                ),
                "chunk_count": _int_or_none(
                    properties.get("chunk_count")
                    or properties.get("visible_chunk_count")
                    or metadata.get("chunk_count")
                ),
                "page_count": _int_or_none(properties.get("page_count")) or 0,
                "mime_type": _mime_type_from_filename(
                    str(properties.get("source_path") or metadata.get("source_path") or title)
                ),
                "document_title_original": _short_text(
                    properties.get("document_title_original") or metadata.get("title") or title,
                    64,
                ),
                "paragraph_count": _int_or_none(
                    properties.get("paragraph_count") or metadata.get("paragraph_count")
                ),
            }
        )
    elif node_type == "section":
        phase2.update(
            {
                "section_source_id": str(properties.get("section_id") or ""),
                "source_section_ids": _list_value(properties.get("source_section_ids")),
                "source_section_titles": _list_value(properties.get("source_section_titles")),
            }
        )
    elif node_type == "chunk":
        content_hash = hash_text(content_text)
        phase2.update(
            {
                "chunk_source_id": str(properties.get("chunk_id") or ""),
                "section_node_id": parent_by_target.get(node_id),
                "chunk_type": _chunk_type(properties.get("chunk_type")),
                "token_count": _int_or_none(properties.get("token_count"))
                or _estimate_token_count(content_text),
                "source_hash": str(properties.get("source_hash") or content_hash),
                "source_chunk_ids": _list_value(properties.get("source_chunk_ids")),
                "source_section_ids": _list_value(properties.get("source_section_ids")),
                "source_section_titles": _list_value(properties.get("source_section_titles")),
            }
        )
    elif node_type == "content":
        phase2.update(
            {
                "node_kind": str(properties.get("node_kind") or "note")[:64],
                "keywords": _list_value(properties.get("keywords")),
                "semantic_hash": str(properties.get("semantic_hash") or hash_text(content_text)),
                "embedding_id": str(properties.get("embedding_id") or ""),
                "embedding_model": str(properties.get("embedding_model") or ""),
                "embedding_updated_at": properties.get("embedding_updated_at"),
            }
        )
    elif node_type == "concept":
        phase2.update(
            {
                "normalized_name": _short_text(
                    properties.get("normalized_name") or properties.get("title") or title,
                    64,
                ),
                "description": str(properties.get("description") or ""),
                "aliases": _list_value(properties.get("aliases")),
                "domain": str(properties.get("domain") or "")[:64],
                "confidence": _float_or_none(properties.get("confidence")),
                "frequency": _int_or_none(properties.get("frequency")),
                "extraction_method": str(properties.get("extraction_method") or "manual")[:32],
                "concept_type": str(properties.get("concept_type") or "term")[:32],
            }
        )

    return _clean_properties(phase2)


def _concept_properties(
    *,
    context: dict[str, Any],
    metadata: dict[str, Any],
    concept: dict[str, Any],
    document_id: str,
    document_node_id: str,
    node_id: str,
) -> dict[str, Any]:
    display_name = concept.get("display_name") or concept.get("canonical_name") or concept.get("concept_id")
    content_text = str(display_name or "")
    return _clean_properties(
        {
            **_common_node_properties(
                context=context,
                metadata=metadata,
                document_id=document_id,
                node_type="concept",
                title=_short_text(display_name, 64),
                manual=False,
            ),
            "document_node_id": document_node_id,
            "raw_concept_id": str(concept.get("concept_id") or ""),
            "normalized_name": _short_text(concept.get("canonical_name") or display_name, 64),
            "description": "",
            "aliases": _list_value(concept.get("variant_terms")),
            "domain": "",
            "confidence": _float_or_none(concept.get("score")),
            "frequency": _int_or_none(concept.get("frequency")),
            "extraction_method": str(concept.get("normalization_method") or "parser")[:32],
            "concept_type": "term",
            "content_text": content_text,
            "content_markdown": content_text,
            "content_version": 1,
            "semantic_hash": hash_text(node_id),
        }
    )


def _common_node_properties(
    *,
    context: dict[str, Any],
    metadata: dict[str, Any],
    document_id: str,
    node_type: str,
    title: str,
    manual: bool,
) -> dict[str, Any]:
    return {
        "workspace_id": context.get("workspace_id"),
        "graph_space_id": context.get("graph_space_id"),
        "document_id": document_id,
        "title": title,
        "created_at": metadata.get("created_at") or context.get("created_at"),
        "updated_at": context.get("updated_at"),
        "created_by": context.get("created_by"),
        "updated_by": context.get("updated_by"),
        "status": context.get("status") or "active",
        "visibility": context.get("visibility") or "private",
        "language": str(context.get("language") or metadata.get("language") or "es-MX")[:16],
        "manual": manual,
        "node_type": node_type,
        "schema_version": _int_or_none(context.get("schema_version")) or 1,
    }


def _relationship_properties(
    *,
    context: dict[str, Any],
    document_id: str,
    relationship: dict[str, Any],
) -> dict[str, Any]:
    properties = relationship.get("properties") or {}
    relationship_type = _relationship_type(
        relationship.get("relationship_type"),
        properties.get("role"),
    )
    phase2 = {
        **_common_relationship_properties(
            context=context,
            document_id=document_id,
            relationship_type=relationship_type,
            manual=bool(properties.get("manual", False)),
            status=_lifecycle_status(properties.get("status")),
            method=_relationship_method(properties.get("method") or "parser"),
            role=_relationship_role(properties.get("role"), relationship_type),
        ),
        "confidence": _float_or_none(properties.get("confidence")),
        "weight": _float_or_none(properties.get("weight")),
        "reason": str(properties.get("reason") or ""),
        "evidence": properties.get("evidence"),
        "order": _int_or_none(properties.get("order")),
        "bidirectional": bool(properties.get("bidirectional", False)),
        "relation_label": str(properties.get("relation_label") or "")[:64],
        "similarity_score": _float_or_none(properties.get("similarity_score")),
        "semantic_distance": _float_or_none(properties.get("semantic_distance")),
        "difficulty_gap": _float_or_none(properties.get("difficulty_gap")),
        "strength": _float_or_none(properties.get("strength")),
        "blocking": bool(properties.get("blocking", False)),
        "coverage": _float_or_none(properties.get("coverage")),
        "difficulty": _int_or_none(properties.get("difficulty")),
    }
    return _clean_properties(phase2)


def _common_relationship_properties(
    *,
    context: dict[str, Any],
    document_id: str,
    relationship_type: str,
    manual: bool,
    status: str,
    method: str,
    role: str,
) -> dict[str, Any]:
    return {
        "workspace_id": context.get("workspace_id"),
        "graph_space_id": context.get("graph_space_id"),
        "document_id": document_id,
        "relationship_type": relationship_type,
        "created_by": context.get("created_by"),
        "updated_by": context.get("updated_by"),
        "status": status,
        "manual": manual,
        "method": method,
        "role": role,
        "schema_version": _int_or_none(context.get("schema_version")) or 1,
    }


def _structural_parent_map(relationships: list[dict[str, Any]]) -> dict[str, str]:
    parent_by_target: dict[str, str] = {}
    for relationship in relationships:
        properties = relationship.get("properties") or {}
        role = str(properties.get("role") or "")
        if role in {"section", "subsection", "chunk"} or role.startswith("contains_"):
            parent_by_target[str(relationship.get("target_id") or "")] = str(
                relationship.get("source_id") or ""
            )
    return parent_by_target


def _node_sort_key(node: dict[str, Any]) -> tuple[int, int, str]:
    order = {"document": 0, "section": 1, "chunk": 2, "content": 3, "concept": 4}
    properties = node.get("properties") or {}
    node_type = _node_type_from_labels(node.get("labels") or [])
    return (order.get(node_type, 99), _int_or_none(properties.get("order")) or 0, str(node.get("node_id") or ""))


def _node_type_from_labels(labels: list[str]) -> str:
    normalized = {str(label).lower() for label in labels}
    if "document" in normalized:
        return "document"
    if "section" in normalized:
        return "section"
    if "chunk" in normalized:
        return "chunk"
    if "concept" in normalized:
        return "concept"
    return "content"


def _node_label(node_type: str) -> str:
    return NODE_TYPE_LABELS.get(node_type, "Content")


def _relationship_type(value: Any, role: Any = "") -> str:
    raw_value = str(value or "").upper()
    if raw_value in {"CONTAINS", "RELATES", "DEPENDS_ON", "EVALUATES"}:
        return raw_value
    return "RELATES"


def _relationship_role(role: Any, relationship_type: str) -> str:
    raw_role = str(role or "").lower()
    role_map = {
        "contains_section": "section",
        "contains_subsection": "subsection",
        "contains_chunk": "chunk",
    }
    if raw_role in role_map:
        return role_map[raw_role]
    if raw_role:
        return _short_text(raw_role, 32)
    defaults = {
        "CONTAINS": "child",
        "RELATES": "similar",
        "DEPENDS_ON": "prerequisite",
        "EVALUATES": "conceptual",
    }
    return defaults.get(relationship_type, "related")


def _relationship_method(value: Any) -> str:
    raw_value = str(value or "").lower()
    if raw_value in {"manual", "parser", "embedding", "llm", "import", "system"}:
        return raw_value
    if raw_value in {
        "chunk_cooccurrence",
        "section_cooccurrence",
        "order_of_appearance",
        "tfidf_frequency_ngram",
        "tfidf_chunk_vector_similarity",
        "title_subtitle_hierarchy",
    }:
        return "parser"
    return "system"


def _lifecycle_status(value: Any) -> str:
    raw_value = str(value or "").lower()
    if raw_value in {"active", "draft", "suggested", "archived", "deleted"}:
        return raw_value
    if raw_value == "confirmed":
        return "active"
    return "active"


def _processing_status(value: Any) -> str:
    raw_value = str(value or "").lower()
    if raw_value in {"pending", "processing", "processed", "failed"}:
        return raw_value
    if raw_value in {"neo4j_export_ready", "ready", "completed", "graph_built"}:
        return "processed"
    return "processed"


def _chunk_type(value: Any) -> str:
    raw_value = str(value or "").lower()
    if raw_value in {"paragraph", "table", "formula", "merged_paragraphs", "code"}:
        return raw_value
    return "paragraph"


def _mime_type_from_filename(filename: str) -> str:
    suffix = Path(filename).suffix.lower().lstrip(".")
    if suffix == "md":
        return "text/markdown"
    if suffix == "txt":
        return "text/plain"
    return suffix or "application/octet-stream"


def _list_value(value: Any) -> list[Any]:
    if isinstance(value, list):
        return value
    if value in (None, ""):
        return []
    return [value]


def _int_or_none(value: Any) -> int | None:
    try:
        if value in (None, ""):
            return None
        return int(value)
    except (TypeError, ValueError):
        return None


def _float_or_none(value: Any) -> float | None:
    try:
        if value in (None, ""):
            return None
        return float(value)
    except (TypeError, ValueError):
        return None


def _short_text(value: Any, max_length: int) -> str:
    clean_value = " ".join(str(value or "").split())
    return clean_value[:max_length] or "Untitled"


def _estimate_token_count(text: str) -> int | None:
    words = len(str(text or "").split())
    if not words:
        return None
    return max(1, int(words * 1.3))


def _clean_properties(properties: dict[str, Any]) -> dict[str, Any]:
    return {
        key: value
        for key, value in properties.items()
        if value not in (None, "")
    }


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

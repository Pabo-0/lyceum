from collections import Counter
from hashlib import sha256

from document_processing.chunk_title_extractor import build_chunk_titles
from document_processing.models import (
    ConceptDeduplicationResult,
    DocumentMetadata,
    GraphNode,
    GraphRelationship,
    KnowledgeGraph,
    SemanticRelationshipResult,
    StructuralAnalysis,
)


def build_initial_graph(
    metadata: DocumentMetadata,
    structure: StructuralAnalysis,
    concept_deduplication: ConceptDeduplicationResult,
    semantic_relationships: SemanticRelationshipResult | None = None,
) -> KnowledgeGraph:
    """Build the MVP reading graph.

    The pipeline still stores concept and semantic-analysis files for later
    developer work. The user-facing graph intentionally shows only the reading
    structure: document, sections and chunks.
    """
    document_id = metadata.document_id
    nodes: list[GraphNode] = []
    relationships: list[GraphRelationship] = []

    document_node_id = _document_node_id(document_id)
    chunk_titles = build_chunk_titles(structure, concept_deduplication)
    nodes.append(
        GraphNode(
            node_id=document_node_id,
            labels=["Document"],
            properties={
                "document_id": document_id,
                "title": metadata.title,
                "source_path": metadata.source_path,
                "source_extension": metadata.source_extension,
                "processing_status": metadata.processing_status,
                "word_count": metadata.word_count,
                "paragraph_count": metadata.paragraph_count,
            },
        )
    )

    section_node_ids: dict[str, str] = {}
    chunk_node_ids: dict[str, str] = {}
    relationships.extend(
        _build_section_and_chunk_graph(
            document_id=document_id,
            document_title=metadata.title,
            document_node_id=document_node_id,
            structure=structure,
            nodes=nodes,
            section_node_ids=section_node_ids,
            chunk_node_ids=chunk_node_ids,
            chunk_titles=chunk_titles,
        )
    )

    return _build_graph_result(nodes, relationships)


def _build_section_and_chunk_graph(
    document_id: str,
    document_title: str,
    document_node_id: str,
    structure: StructuralAnalysis,
    nodes: list[GraphNode],
    section_node_ids: dict[str, str],
    chunk_node_ids: dict[str, str],
    chunk_titles: dict,
) -> list[GraphRelationship]:
    relationships: list[GraphRelationship] = []
    skipped_root_section_ids = _find_skippable_root_section_ids(
        document_title,
        structure,
    )

    for section in structure.sections:
        if section.section_id in skipped_root_section_ids:
            continue

        section_node_id = _section_node_id(document_id, section.section_id)
        section_node_ids[section.section_id] = section_node_id
        nodes.append(
            GraphNode(
                node_id=section_node_id,
                labels=["Section"],
                properties={
                    "section_id": section.section_id,
                    "title": section.title,
                    "level": section.level,
                    "order": section.order,
                    "heading_type": section.heading_type,
                    "numbering": section.numbering,
                    "start_line": section.start_line,
                    "end_line": section.end_line,
                },
            )
        )

        if (
            section.parent_section_id
            and section.parent_section_id not in skipped_root_section_ids
        ):
            relationships.append(
                _relationship(
                    "HAS_SUBSECTION",
                    section_node_ids[section.parent_section_id],
                    section_node_id,
                    {"order": section.order},
                )
            )
        else:
            relationships.append(
                _relationship(
                    "HAS_SECTION",
                    document_node_id,
                    section_node_id,
                    {"order": section.order},
                )
            )

        for chunk in section.chunks:
            chunk_node_id = _chunk_node_id(document_id, chunk.chunk_id)
            chunk_node_ids[chunk.chunk_id] = chunk_node_id
            chunk_title = chunk_titles.get(chunk.chunk_id)
            nodes.append(
                GraphNode(
                    node_id=chunk_node_id,
                    labels=["Chunk"],
                    properties={
                        "chunk_id": chunk.chunk_id,
                        "title": chunk_title.title if chunk_title else chunk.chunk_id,
                        "title_source": chunk_title.source if chunk_title else "chunk_id",
                        "title_reason": chunk_title.reason if chunk_title else "",
                        "title_candidates": chunk_title.candidates if chunk_title else [],
                        "text": chunk.text,
                        "order": chunk.order,
                        "start_line": chunk.start_line,
                        "end_line": chunk.end_line,
                        "word_count": chunk.word_count,
                        "character_count": chunk.character_count,
                        "chunk_type": chunk.chunk_type,
                    },
                )
            )
            relationships.append(
                _relationship(
                    "HAS_CHUNK",
                    section_node_id,
                    chunk_node_id,
                    {"order": chunk.order},
                )
            )

    return relationships


def _build_graph_result(
    nodes: list[GraphNode],
    relationships: list[GraphRelationship],
) -> KnowledgeGraph:
    node_counts: Counter[str] = Counter()
    relationship_counts: Counter[str] = Counter()

    for node in nodes:
        for label in node.labels:
            node_counts[label] += 1
    for relationship in relationships:
        relationship_counts[relationship.relationship_type] += 1

    return KnowledgeGraph(
        nodes=nodes,
        relationships=relationships,
        node_count=len(nodes),
        relationship_count=len(relationships),
        node_counts_by_label=dict(sorted(node_counts.items())),
        relationship_counts_by_type=dict(sorted(relationship_counts.items())),
    )


def _find_skippable_root_section_ids(
    document_title: str,
    structure: StructuralAnalysis,
) -> set[str]:
    root_section_ids: set[str] = set()
    normalized_document_title = _normalize_title(document_title)

    for section in structure.sections:
        if (
            section.level == 1
            and section.parent_section_id is None
            and not section.chunks
            and _normalize_title(section.title) == normalized_document_title
        ):
            root_section_ids.add(section.section_id)

    return root_section_ids


def _document_node_id(document_id: str) -> str:
    return f"document:{document_id}"


def _section_node_id(document_id: str, section_id: str) -> str:
    return f"section:{document_id}:{section_id}"


def _chunk_node_id(document_id: str, chunk_id: str) -> str:
    return f"chunk:{document_id}:{chunk_id}"


def _relationship(
    relationship_type: str,
    source_id: str,
    target_id: str,
    properties: dict,
) -> GraphRelationship:
    relationship_id = _relationship_id(
        relationship_type,
        source_id,
        target_id,
        properties,
    )
    return GraphRelationship(
        relationship_id=relationship_id,
        relationship_type=relationship_type,
        source_id=source_id,
        target_id=target_id,
        properties=properties,
    )


def _relationship_id(
    relationship_type: str,
    source_id: str,
    target_id: str,
    properties: dict,
) -> str:
    stable_properties = "|".join(
        f"{key}={properties[key]}"
        for key in sorted(properties)
    )
    digest = sha256(
        f"{relationship_type}:{source_id}:{target_id}:{stable_properties}".encode("utf-8")
    ).hexdigest()[:16]
    return f"relationship:{digest}"


def _normalize_title(title: str) -> str:
    return " ".join(title.strip().lower().split())

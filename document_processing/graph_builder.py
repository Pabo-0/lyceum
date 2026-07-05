from collections import Counter
from hashlib import sha256

from document_processing.chunk_title_extractor import build_chunk_title_from_text
from document_processing.models import (
    ConceptDeduplicationResult,
    DocumentMetadata,
    GraphNode,
    GraphRelationship,
    KnowledgeGraph,
    SemanticRelationshipResult,
    StructuralAnalysis,
)
from document_processing.reading_graph_compactor import compact_structure_for_reading_graph
from document_processing.term_normalizer import normalize_term


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
    reading_structure = compact_structure_for_reading_graph(
        structure=structure,
        document_title=metadata.title,
        document_word_count=metadata.word_count,
    )
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
                "reading_graph_compaction": reading_structure.compaction_method,
                "visible_section_count": reading_structure.section_count,
                "visible_chunk_count": reading_structure.chunk_count,
                "max_visible_sections": reading_structure.max_visible_sections,
            },
        )
    )

    section_node_ids: dict[str, str] = {}
    chunk_node_ids: dict[str, str] = {}
    relationships.extend(
        _build_section_and_chunk_graph(
            document_id=document_id,
            document_node_id=document_node_id,
            reading_structure=reading_structure,
            nodes=nodes,
            section_node_ids=section_node_ids,
            chunk_node_ids=chunk_node_ids,
        )
    )

    return _build_graph_result(nodes, relationships)


def _build_section_and_chunk_graph(
    document_id: str,
    document_node_id: str,
    reading_structure,
    nodes: list[GraphNode],
    section_node_ids: dict[str, str],
    chunk_node_ids: dict[str, str],
) -> list[GraphRelationship]:
    relationships: list[GraphRelationship] = []
    used_chunk_title_terms: set[str] = set()

    for section in reading_structure.sections:
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
                    "source_section_ids": section.source_section_ids,
                    "source_section_titles": section.source_section_titles,
                    "source_section_count": len(section.source_section_ids),
                    "compaction_method": section.compaction_method,
                },
            )
        )

        if section.parent_section_id:
            relationships.append(
                _relationship(
                    "DIRECTIONAL",
                    section_node_ids[section.parent_section_id],
                    section_node_id,
                    {"order": section.order, "role": "contains_subsection"},
                )
            )
        else:
            relationships.append(
                _relationship(
                    "DIRECTIONAL",
                    document_node_id,
                    section_node_id,
                    {"order": section.order, "role": "contains_section"},
                )
            )

        for chunk in section.chunks:
            chunk_node_id = _chunk_node_id(document_id, chunk.chunk_id)
            chunk_node_ids[chunk.chunk_id] = chunk_node_id
            chunk_title = build_chunk_title_from_text(
                chunk.text,
                section_title=section.title,
                used_terms=used_chunk_title_terms,
            )
            used_chunk_title_terms.add(normalize_term(chunk_title.title))
            nodes.append(
                GraphNode(
                    node_id=chunk_node_id,
                    labels=["Chunk"],
                    properties={
                        "chunk_id": chunk.chunk_id,
                        "title": chunk_title.title,
                        "title_source": chunk_title.source,
                        "title_reason": chunk_title.reason,
                        "title_candidates": chunk_title.candidates,
                        "text": chunk.text,
                        "order": chunk.order,
                        "start_line": chunk.start_line,
                        "end_line": chunk.end_line,
                        "word_count": chunk.word_count,
                        "character_count": chunk.character_count,
                        "chunk_type": chunk.chunk_type,
                        "source_chunk_ids": chunk.source_chunk_ids,
                        "source_chunk_count": len(chunk.source_chunk_ids),
                        "source_section_ids": chunk.source_section_ids,
                        "source_section_titles": chunk.source_section_titles,
                        "source_section_count": len(chunk.source_section_ids),
                    },
                )
            )
            relationships.append(
                _relationship(
                    "DIRECTIONAL",
                    section_node_id,
                    chunk_node_id,
                    {"order": chunk.order, "role": "contains_chunk"},
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

from collections import Counter
from hashlib import sha256

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
    document_id = metadata.document_id
    nodes: list[GraphNode] = []
    relationships: list[GraphRelationship] = []

    document_node_id = _document_node_id(document_id)
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
            document_id,
            document_node_id,
            structure,
            nodes,
            section_node_ids,
            chunk_node_ids,
        )
    )
    concept_node_ids = _build_concept_nodes(concept_deduplication, nodes)
    relationships.extend(
        _build_mentions_relationships(
            concept_deduplication,
            section_node_ids,
            chunk_node_ids,
            concept_node_ids,
        )
    )
    if semantic_relationships:
        relationships.extend(
            _build_semantic_relationships(
                semantic_relationships,
                concept_node_ids,
            )
        )

    return _build_graph_result(nodes, relationships)


def _build_section_and_chunk_graph(
    document_id: str,
    document_node_id: str,
    structure: StructuralAnalysis,
    nodes: list[GraphNode],
    section_node_ids: dict[str, str],
    chunk_node_ids: dict[str, str],
) -> list[GraphRelationship]:
    relationships: list[GraphRelationship] = []

    for section in structure.sections:
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

        if section.parent_section_id:
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
            nodes.append(
                GraphNode(
                    node_id=chunk_node_id,
                    labels=["Chunk"],
                    properties={
                        "chunk_id": chunk.chunk_id,
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


def _build_concept_nodes(
    concept_deduplication: ConceptDeduplicationResult,
    nodes: list[GraphNode],
) -> dict[str, str]:
    concept_node_ids: dict[str, str] = {}

    for concept in concept_deduplication.concepts:
        concept_node_id = _concept_node_id(concept.concept_id)
        concept_node_ids[concept.concept_id] = concept_node_id
        nodes.append(
            GraphNode(
                node_id=concept_node_id,
                labels=["Concept"],
                properties={
                    "concept_id": concept.concept_id,
                    "canonical_name": concept.canonical_name,
                    "display_name": concept.display_name,
                    "variant_terms": concept.variant_terms,
                    "score": concept.score,
                    "frequency": concept.frequency,
                    "mention_count": concept.mention_count,
                    "section_frequency": concept.section_frequency,
                    "chunk_frequency": concept.chunk_frequency,
                    "normalization_method": concept.normalization_method,
                },
            )
        )

    return concept_node_ids


def _build_mentions_relationships(
    concept_deduplication: ConceptDeduplicationResult,
    section_node_ids: dict[str, str],
    chunk_node_ids: dict[str, str],
    concept_node_ids: dict[str, str],
) -> list[GraphRelationship]:
    relationships: list[GraphRelationship] = []
    section_concept_stats: dict[tuple[str, str], Counter[str]] = {}

    for mention in concept_deduplication.mentions:
        chunk_node_id = chunk_node_ids.get(mention.chunk_id)
        concept_node_id = concept_node_ids.get(mention.concept_id)
        if not chunk_node_id or not concept_node_id:
            continue

        relationships.append(
            _relationship(
                "MENTIONS",
                chunk_node_id,
                concept_node_id,
                {
                    "mention_id": mention.mention_id,
                    "score": mention.score,
                    "occurrence_count": mention.occurrence_count,
                    "method": mention.extraction_method,
                    "normalization_method": mention.normalization_method,
                    "source": "chunk",
                },
            )
        )

        if mention.section_id:
            key = (mention.section_id, mention.concept_id)
            if key not in section_concept_stats:
                section_concept_stats[key] = Counter()
            section_concept_stats[key]["occurrence_count"] += mention.occurrence_count
            section_concept_stats[key]["mention_count"] += 1

    for (section_id, concept_id), stats in section_concept_stats.items():
        section_node_id = section_node_ids.get(section_id)
        concept_node_id = concept_node_ids.get(concept_id)
        if not section_node_id or not concept_node_id:
            continue
        relationships.append(
            _relationship(
                "MENTIONS",
                section_node_id,
                concept_node_id,
                {
                    "occurrence_count": stats["occurrence_count"],
                    "mention_count": stats["mention_count"],
                    "source": "section",
                },
            )
        )

    return relationships


def _build_semantic_relationships(
    semantic_relationships: SemanticRelationshipResult,
    concept_node_ids: dict[str, str],
) -> list[GraphRelationship]:
    relationships: list[GraphRelationship] = []

    for semantic_relationship in semantic_relationships.relationships:
        source_node_id = concept_node_ids.get(semantic_relationship.source_concept_id)
        target_node_id = concept_node_ids.get(semantic_relationship.target_concept_id)
        if not source_node_id or not target_node_id:
            continue
        relationships.append(
            _relationship(
                semantic_relationship.relationship_type,
                source_node_id,
                target_node_id,
                {
                    "candidate_id": semantic_relationship.relationship_id,
                    "weight": semantic_relationship.weight,
                    "confidence": semantic_relationship.confidence,
                    "method": semantic_relationship.method,
                    "source": semantic_relationship.source,
                    "reason": semantic_relationship.reason,
                    "evidence": semantic_relationship.evidence,
                    "status": "candidate",
                },
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


def _concept_node_id(concept_id: str) -> str:
    return f"concept:{concept_id}"


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

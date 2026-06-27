from collections import Counter, defaultdict
from dataclasses import dataclass, field
from hashlib import sha256
import math
from itertools import combinations

from document_processing.models import (
    ConceptDeduplicationResult,
    DocumentSection,
    NormalizedConceptMention,
    SemanticRelationship,
    SemanticRelationshipResult,
    StructuralAnalysis,
)
from document_processing.term_normalizer import normalize_term


RELATED_TO = "RELATED_TO"
PREREQUISITE_CANDIDATE = "PREREQUISITE_CANDIDATE"
MAX_RELATED_TO_RELATIONSHIPS = 80
MAX_PREREQUISITE_RELATIONSHIPS = 60


@dataclass
class _RelationshipEvidence:
    relationship_type: str
    source_concept_id: str
    target_concept_id: str
    method: str
    source: str
    reason: str
    weight: float
    confidence: float
    evidence: set[str] = field(default_factory=set)


def build_semantic_relationships(
    structure: StructuralAnalysis,
    concept_deduplication: ConceptDeduplicationResult,
) -> SemanticRelationshipResult:
    context = _build_context(structure, concept_deduplication)
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence] = {}

    _add_chunk_cooccurrence_relationships(context, relationships)
    _add_section_cooccurrence_relationships(context, relationships)
    _add_chunk_vector_similarity_relationships(context, relationships)
    _add_order_prerequisite_relationships(context, relationships)
    _add_title_subtitle_prerequisite_relationships(context, relationships)

    semantic_relationships = _limit_relationships([
        _to_semantic_relationship(evidence)
        for evidence in relationships.values()
    ])
    semantic_relationships.sort(
        key=lambda relationship: (
            relationship.relationship_type,
            -relationship.confidence,
            -relationship.weight,
            relationship.source_concept_id,
            relationship.target_concept_id,
            relationship.method,
        )
    )

    counts_by_type = Counter(
        relationship.relationship_type
        for relationship in semantic_relationships
    )
    methods = sorted({relationship.method for relationship in semantic_relationships})

    return SemanticRelationshipResult(
        relationships=semantic_relationships,
        relationship_count=len(semantic_relationships),
        relationship_counts_by_type=dict(sorted(counts_by_type.items())),
        methods=methods,
    )


def _add_chunk_cooccurrence_relationships(
    context: dict,
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence],
) -> None:
    for chunk_id, concept_ids in context["concept_ids_by_chunk"].items():
        for source_id, target_id in _unordered_pairs(concept_ids):
            _merge_relationship(
                relationships,
                relationship_type=RELATED_TO,
                source_concept_id=source_id,
                target_concept_id=target_id,
                method="chunk_cooccurrence",
                source="chunk",
                reason="Concepts are mentioned in the same chunk.",
                weight=1.0,
                confidence=0.7,
                evidence=f"chunk:{chunk_id}",
            )


def _add_section_cooccurrence_relationships(
    context: dict,
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence],
) -> None:
    for section_id, concept_ids in context["concept_ids_by_section"].items():
        for source_id, target_id in _unordered_pairs(concept_ids):
            _merge_relationship(
                relationships,
                relationship_type=RELATED_TO,
                source_concept_id=source_id,
                target_concept_id=target_id,
                method="section_cooccurrence",
                source="section",
                reason="Concepts are mentioned within the same section.",
                weight=0.5,
                confidence=0.55,
                evidence=f"section:{section_id}",
            )


def _add_chunk_vector_similarity_relationships(
    context: dict,
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence],
) -> None:
    vectors = context["chunk_score_vectors_by_concept"]
    for source_id, target_id in combinations(sorted(vectors), 2):
        similarity = _cosine_similarity(vectors[source_id], vectors[target_id])
        if similarity < 0.45:
            continue
        _merge_relationship(
            relationships,
            relationship_type=RELATED_TO,
            source_concept_id=source_id,
            target_concept_id=target_id,
            method="tfidf_chunk_vector_similarity",
            source="concept_mentions",
            reason="Concepts have similar TF-IDF mention patterns across chunks.",
            weight=round(similarity, 6),
            confidence=round(min(0.8, 0.4 + similarity / 2), 6),
            evidence=f"cosine_similarity:{round(similarity, 6)}",
        )


def _add_order_prerequisite_relationships(
    context: dict,
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence],
) -> None:
    concept_ids = sorted(context["first_chunk_order_by_concept"])
    for source_id, target_id in combinations(concept_ids, 2):
        source_order = context["first_chunk_order_by_concept"][source_id]
        target_order = context["first_chunk_order_by_concept"][target_id]
        if source_order == target_order:
            continue

        earlier_id, later_id = (
            (source_id, target_id)
            if source_order < target_order
            else (target_id, source_id)
        )
        distance = abs(
            context["first_chunk_order_by_concept"][later_id]
            - context["first_chunk_order_by_concept"][earlier_id]
        )
        if distance > 3:
            continue
        if not _looks_more_general(earlier_id, later_id, context):
            continue

        weight = round(1 / (1 + distance), 6)
        confidence = round(max(0.35, 0.6 - (distance * 0.05)), 6)
        _merge_relationship(
            relationships,
            relationship_type=PREREQUISITE_CANDIDATE,
            source_concept_id=earlier_id,
            target_concept_id=later_id,
            method="order_of_appearance",
            source="document_order",
            reason="A more general concept appears before a later concept.",
            weight=weight,
            confidence=confidence,
            evidence=f"chunk_distance:{distance}",
        )


def _add_title_subtitle_prerequisite_relationships(
    context: dict,
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence],
) -> None:
    for section in context["sections"]:
        if not section.parent_section_id:
            continue
        parent_concepts = context["title_concept_ids_by_section"].get(
            section.parent_section_id,
            set(),
        )
        child_concepts = context["title_concept_ids_by_section"].get(
            section.section_id,
            set(),
        )
        if not parent_concepts or not child_concepts:
            continue
        for source_id in parent_concepts:
            for target_id in child_concepts:
                if source_id == target_id:
                    continue
                if not _looks_more_general(source_id, target_id, context):
                    continue
                _merge_relationship(
                    relationships,
                    relationship_type=PREREQUISITE_CANDIDATE,
                    source_concept_id=source_id,
                    target_concept_id=target_id,
                    method="title_subtitle_hierarchy",
                    source="section_hierarchy",
                    reason="A parent-section concept is connected to a child-section concept.",
                    weight=0.75,
                    confidence=0.65,
                    evidence=f"section:{section.parent_section_id}->{section.section_id}",
                )


def _build_context(
    structure: StructuralAnalysis,
    concept_deduplication: ConceptDeduplicationResult,
) -> dict:
    concept_by_id = {
        concept.concept_id: concept
        for concept in concept_deduplication.concepts
    }
    chunk_order_by_id = {
        chunk.chunk_id: chunk.order
        for section in structure.sections
        for chunk in section.chunks
    }
    chunk_order_by_id.update({
        chunk.chunk_id: chunk.order
        for chunk in structure.orphan_chunks
    })

    concept_ids_by_chunk: defaultdict[str, set[str]] = defaultdict(set)
    concept_ids_by_section: defaultdict[str, set[str]] = defaultdict(set)
    chunk_score_vectors_by_concept: defaultdict[str, dict[str, float]] = defaultdict(dict)
    first_chunk_order_by_concept: dict[str, int] = {}
    title_concept_ids_by_section: defaultdict[str, set[str]] = defaultdict(set)

    for mention in concept_deduplication.mentions:
        concept_ids_by_chunk[mention.chunk_id].add(mention.concept_id)
        if mention.section_id:
            concept_ids_by_section[mention.section_id].add(mention.concept_id)
        chunk_score_vectors_by_concept[mention.concept_id][mention.chunk_id] = max(
            mention.score,
            chunk_score_vectors_by_concept[mention.concept_id].get(mention.chunk_id, 0),
        )
        chunk_order = chunk_order_by_id.get(mention.chunk_id)
        if chunk_order is not None:
            current_first = first_chunk_order_by_concept.get(mention.concept_id)
            if current_first is None or chunk_order < current_first:
                first_chunk_order_by_concept[mention.concept_id] = chunk_order

    for section in structure.sections:
        normalized_title = normalize_term(section.title)
        for concept in concept_deduplication.concepts:
            if _concept_appears_in_text(concept.canonical_name, normalized_title):
                title_concept_ids_by_section[section.section_id].add(concept.concept_id)

    return {
        "concept_by_id": concept_by_id,
        "concept_ids_by_chunk": concept_ids_by_chunk,
        "concept_ids_by_section": concept_ids_by_section,
        "chunk_score_vectors_by_concept": chunk_score_vectors_by_concept,
        "first_chunk_order_by_concept": first_chunk_order_by_concept,
        "title_concept_ids_by_section": title_concept_ids_by_section,
        "sections": structure.sections,
    }


def _merge_relationship(
    relationships: dict[tuple[str, str, str, str], _RelationshipEvidence],
    relationship_type: str,
    source_concept_id: str,
    target_concept_id: str,
    method: str,
    source: str,
    reason: str,
    weight: float,
    confidence: float,
    evidence: str,
) -> None:
    if source_concept_id == target_concept_id:
        return
    if relationship_type == RELATED_TO:
        source_concept_id, target_concept_id = sorted([source_concept_id, target_concept_id])

    key = (relationship_type, source_concept_id, target_concept_id, method)
    if key not in relationships:
        relationships[key] = _RelationshipEvidence(
            relationship_type=relationship_type,
            source_concept_id=source_concept_id,
            target_concept_id=target_concept_id,
            method=method,
            source=source,
            reason=reason,
            weight=0,
            confidence=confidence,
        )

    existing = relationships[key]
    existing.weight += weight
    existing.confidence = max(existing.confidence, confidence)
    existing.evidence.add(evidence)


def _to_semantic_relationship(evidence: _RelationshipEvidence) -> SemanticRelationship:
    evidence_items = sorted(evidence.evidence)
    capped_weight = round(min(evidence.weight, 10), 6)
    confidence = round(min(evidence.confidence, 0.95), 6)
    relationship_id = _relationship_id(
        evidence.relationship_type,
        evidence.source_concept_id,
        evidence.target_concept_id,
        evidence.method,
    )
    return SemanticRelationship(
        relationship_id=relationship_id,
        relationship_type=evidence.relationship_type,
        source_concept_id=evidence.source_concept_id,
        target_concept_id=evidence.target_concept_id,
        weight=capped_weight,
        confidence=confidence,
        method=evidence.method,
        source=evidence.source,
        reason=evidence.reason,
        evidence=evidence_items,
    )


def _unordered_pairs(concept_ids: set[str]) -> list[tuple[str, str]]:
    return list(combinations(sorted(concept_ids), 2))


def _cosine_similarity(
    source_vector: dict[str, float],
    target_vector: dict[str, float],
) -> float:
    shared_keys = set(source_vector) & set(target_vector)
    if not shared_keys:
        return 0
    dot_product = sum(source_vector[key] * target_vector[key] for key in shared_keys)
    source_norm = math.sqrt(sum(value * value for value in source_vector.values()))
    target_norm = math.sqrt(sum(value * value for value in target_vector.values()))
    if not source_norm or not target_norm:
        return 0
    return dot_product / (source_norm * target_norm)


def _looks_more_general(source_id: str, target_id: str, context: dict) -> bool:
    source = context["concept_by_id"].get(source_id)
    target = context["concept_by_id"].get(target_id)
    if not source or not target:
        return False
    source_tokens = source.canonical_name.split()
    target_tokens = target.canonical_name.split()
    if len(source_tokens) < len(target_tokens):
        return True
    return (
        len(source_tokens) == len(target_tokens)
        and source.chunk_frequency > target.chunk_frequency
    )


def _concept_appears_in_text(concept_name: str, normalized_text: str) -> bool:
    concept_tokens = concept_name.split()
    text_tokens = normalized_text.split()
    if not concept_tokens or not text_tokens:
        return False
    token_count = len(concept_tokens)
    for index in range(0, len(text_tokens) - token_count + 1):
        if text_tokens[index : index + token_count] == concept_tokens:
            return True
    return False


def _limit_relationships(
    relationships: list[SemanticRelationship],
) -> list[SemanticRelationship]:
    grouped: defaultdict[str, list[SemanticRelationship]] = defaultdict(list)
    for relationship in relationships:
        grouped[relationship.relationship_type].append(relationship)

    limited: list[SemanticRelationship] = []
    for relationship_type, type_relationships in grouped.items():
        limit = (
            MAX_RELATED_TO_RELATIONSHIPS
            if relationship_type == RELATED_TO
            else MAX_PREREQUISITE_RELATIONSHIPS
        )
        limited.extend(
            sorted(
                type_relationships,
                key=lambda relationship: (
                    -relationship.confidence,
                    -relationship.weight,
                    relationship.method,
                    relationship.source_concept_id,
                    relationship.target_concept_id,
                ),
            )[:limit]
        )
    return limited


def _relationship_id(
    relationship_type: str,
    source_concept_id: str,
    target_concept_id: str,
    method: str,
) -> str:
    digest = sha256(
        f"{relationship_type}:{source_concept_id}:{target_concept_id}:{method}".encode("utf-8")
    ).hexdigest()[:16]
    return f"semantic-relationship:{digest}"

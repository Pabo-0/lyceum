from dataclasses import asdict, dataclass
from typing import Any


@dataclass(frozen=True)
class SemanticRelationship:
    relationship_id: str
    relationship_type: str
    source_concept_id: str
    target_concept_id: str
    weight: float
    confidence: float
    method: str
    source: str
    reason: str
    evidence: list[str]

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class SemanticRelationshipResult:
    relationships: list[SemanticRelationship]
    relationship_count: int
    relationship_counts_by_type: dict[str, int]
    methods: list[str]

    def to_dict(self) -> dict[str, Any]:
        return {
            "relationships": [
                relationship.to_dict()
                for relationship in self.relationships
            ],
            "relationship_count": self.relationship_count,
            "relationship_counts_by_type": self.relationship_counts_by_type,
            "methods": self.methods,
        }


@dataclass(frozen=True)
class GraphNode:
    node_id: str
    labels: list[str]
    properties: dict[str, Any]

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class GraphRelationship:
    relationship_id: str
    relationship_type: str
    source_id: str
    target_id: str
    properties: dict[str, Any]

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class KnowledgeGraph:
    nodes: list[GraphNode]
    relationships: list[GraphRelationship]
    node_count: int
    relationship_count: int
    node_counts_by_label: dict[str, int]
    relationship_counts_by_type: dict[str, int]

    def to_dict(self) -> dict[str, Any]:
        return {
            "nodes": [node.to_dict() for node in self.nodes],
            "relationships": [
                relationship.to_dict()
                for relationship in self.relationships
            ],
            "node_count": self.node_count,
            "relationship_count": self.relationship_count,
            "node_counts_by_label": self.node_counts_by_label,
            "relationship_counts_by_type": self.relationship_counts_by_type,
        }


@dataclass(frozen=True)
class Concept:
    concept_id: str
    name: str
    normalized_name: str
    score: float
    frequency: int
    document_frequency: int
    section_frequency: int
    chunk_frequency: int
    extraction_method: str

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class ConceptMention:
    mention_id: str
    concept_id: str
    normalized_name: str
    text: str
    section_id: str | None
    chunk_id: str
    score: float
    occurrence_count: int
    extraction_method: str

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class ConceptExtractionResult:
    concepts: list[Concept]
    mentions: list[ConceptMention]
    concept_count: int
    mention_count: int
    extraction_methods: list[str]

    def to_dict(self) -> dict[str, Any]:
        return {
            "concepts": [concept.to_dict() for concept in self.concepts],
            "mentions": [mention.to_dict() for mention in self.mentions],
            "concept_count": self.concept_count,
            "mention_count": self.mention_count,
            "extraction_methods": self.extraction_methods,
        }


@dataclass(frozen=True)
class CanonicalConcept:
    concept_id: str
    canonical_name: str
    display_name: str
    variant_terms: list[str]
    raw_concept_ids: list[str]
    score: float
    frequency: int
    mention_count: int
    section_frequency: int
    chunk_frequency: int
    normalization_method: str

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class NormalizedConceptMention:
    mention_id: str
    concept_id: str
    raw_concept_id: str
    raw_normalized_name: str
    text: str
    section_id: str | None
    chunk_id: str
    score: float
    occurrence_count: int
    extraction_method: str
    normalization_method: str

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class ConceptDeduplicationResult:
    concepts: list[CanonicalConcept]
    mentions: list[NormalizedConceptMention]
    concept_count: int
    mention_count: int
    variant_count: int
    normalization_methods: list[str]

    def to_dict(self) -> dict[str, Any]:
        return {
            "concepts": [concept.to_dict() for concept in self.concepts],
            "mentions": [mention.to_dict() for mention in self.mentions],
            "concept_count": self.concept_count,
            "mention_count": self.mention_count,
            "variant_count": self.variant_count,
            "normalization_methods": self.normalization_methods,
        }


@dataclass(frozen=True)
class ParagraphChunk:
    chunk_id: str
    parent_section_id: str | None
    text: str
    markdown: str
    order: int
    start_line: int
    end_line: int
    word_count: int
    character_count: int
    chunk_type: str

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class DocumentSection:
    section_id: str
    parent_section_id: str | None
    title: str
    markdown: str
    level: int
    order: int
    heading_type: str
    numbering: str | None
    start_line: int
    end_line: int
    chunks: list[ParagraphChunk]

    def to_dict(self) -> dict[str, Any]:
        return {
            "section_id": self.section_id,
            "parent_section_id": self.parent_section_id,
            "title": self.title,
            "markdown": self.markdown,
            "level": self.level,
            "order": self.order,
            "heading_type": self.heading_type,
            "numbering": self.numbering,
            "start_line": self.start_line,
            "end_line": self.end_line,
            "chunks": [chunk.to_dict() for chunk in self.chunks],
        }


@dataclass(frozen=True)
class StructuralAnalysis:
    sections: list[DocumentSection]
    orphan_chunks: list[ParagraphChunk]
    section_count: int
    subsection_count: int
    chunk_count: int

    def to_dict(self) -> dict[str, Any]:
        return {
            "sections": [section.to_dict() for section in self.sections],
            "orphan_chunks": [chunk.to_dict() for chunk in self.orphan_chunks],
            "section_count": self.section_count,
            "subsection_count": self.subsection_count,
            "chunk_count": self.chunk_count,
        }


@dataclass(frozen=True)
class NormalizationReport:
    original_character_count: int
    normalized_character_count: int
    original_paragraph_count: int
    normalized_paragraph_count: int
    removed_character_count: int

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class DocumentMetadata:
    document_id: str
    title: str
    source_path: str
    source_extension: str
    created_at: str
    processing_status: str
    character_count: int
    word_count: int
    paragraph_count: int

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class StoredDocument:
    metadata: DocumentMetadata
    original_content: str
    normalized_content: str
    normalization_report: NormalizationReport
    structure: StructuralAnalysis
    concept_extraction: ConceptExtractionResult
    concept_deduplication: ConceptDeduplicationResult
    semantic_relationships: SemanticRelationshipResult
    graph: KnowledgeGraph

    def to_dict(self) -> dict[str, Any]:
        return {
            "metadata": self.metadata.to_dict(),
            "original_content": self.original_content,
            "normalized_content": self.normalized_content,
            "normalization_report": self.normalization_report.to_dict(),
            "structure": self.structure.to_dict(),
            "concept_extraction": self.concept_extraction.to_dict(),
            "concept_deduplication": self.concept_deduplication.to_dict(),
            "semantic_relationships": self.semantic_relationships.to_dict(),
            "graph": self.graph.to_dict(),
        }

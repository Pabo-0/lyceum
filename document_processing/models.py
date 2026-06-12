from dataclasses import asdict, dataclass
from typing import Any


@dataclass(frozen=True)
class ParagraphChunk:
    chunk_id: str
    parent_section_id: str | None
    text: str
    order: int
    start_line: int
    end_line: int

    def to_dict(self) -> dict[str, Any]:
        return asdict(self)


@dataclass(frozen=True)
class DocumentSection:
    section_id: str
    parent_section_id: str | None
    title: str
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

    def to_dict(self) -> dict[str, Any]:
        return {
            "metadata": self.metadata.to_dict(),
            "original_content": self.original_content,
            "normalized_content": self.normalized_content,
            "normalization_report": self.normalization_report.to_dict(),
            "structure": self.structure.to_dict(),
        }

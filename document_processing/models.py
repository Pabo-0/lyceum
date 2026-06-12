from dataclasses import asdict, dataclass
from typing import Any


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

    def to_dict(self) -> dict[str, Any]:
        return {
            "metadata": self.metadata.to_dict(),
            "original_content": self.original_content,
        }


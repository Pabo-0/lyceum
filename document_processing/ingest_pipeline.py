from pathlib import Path

from document_processing.config import SUPPORTED_EXTENSIONS
from document_processing.metadata import build_metadata
from document_processing.models import StoredDocument
from document_processing.reader import read_text_document
from document_processing.storage import DocumentStore
from document_processing.structural_segmenter import segment_structure
from document_processing.text_normalizer import (
    build_normalization_report,
    normalize_text,
)


def discover_documents(directory: Path) -> list[Path]:
    if not directory.exists():
        raise FileNotFoundError(f"Directory not found: {directory}")

    return sorted(
        path
        for path in directory.iterdir()
        if path.is_file() and path.suffix.lower() in SUPPORTED_EXTENSIONS
    )


def ingest_file(path: Path, store: DocumentStore | None = None) -> StoredDocument:
    active_store = store or DocumentStore()
    original_content = read_text_document(path)
    normalized_content = normalize_text(original_content)
    structure = segment_structure(normalized_content)
    metadata = build_metadata(
        path,
        original_content,
        normalized_content,
        processing_status="structured",
    )
    normalization_report = build_normalization_report(
        original_content,
        normalized_content,
    )
    document = StoredDocument(
        metadata=metadata,
        original_content=original_content,
        normalized_content=normalized_content,
        normalization_report=normalization_report,
        structure=structure,
    )
    active_store.upsert(document)
    return document


def ingest_directory(directory: Path, store: DocumentStore | None = None) -> list[StoredDocument]:
    active_store = store or DocumentStore()
    return [ingest_file(path, active_store) for path in discover_documents(directory)]

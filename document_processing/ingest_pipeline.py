from pathlib import Path

from document_processing.config import SUPPORTED_EXTENSIONS
from document_processing.metadata import build_metadata
from document_processing.models import StoredDocument
from document_processing.reader import read_text_document
from document_processing.storage import DocumentStore


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
    content = read_text_document(path)
    metadata = build_metadata(path, content)
    document = StoredDocument(metadata=metadata, original_content=content)
    active_store.upsert(document)
    return document


def ingest_directory(directory: Path, store: DocumentStore | None = None) -> list[StoredDocument]:
    active_store = store or DocumentStore()
    return [ingest_file(path, active_store) for path in discover_documents(directory)]


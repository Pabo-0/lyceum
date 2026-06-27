from pathlib import Path

from document_processing.concept_deduplicator import deduplicate_concepts
from document_processing.config import SUPPORTED_EXTENSIONS
from document_processing.concept_extractor import extract_concepts
from document_processing.graph_builder import build_initial_graph
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
    concept_extraction = extract_concepts(structure)
    concept_deduplication = deduplicate_concepts(concept_extraction)
    metadata = build_metadata(
        path,
        original_content,
        normalized_content,
        processing_status="graph_built",
    )
    graph = build_initial_graph(metadata, structure, concept_deduplication)
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
        concept_extraction=concept_extraction,
        concept_deduplication=concept_deduplication,
        graph=graph,
    )
    active_store.upsert(document)
    return document


def ingest_directory(directory: Path, store: DocumentStore | None = None) -> list[StoredDocument]:
    active_store = store or DocumentStore()
    return [ingest_file(path, active_store) for path in discover_documents(directory)]

from datetime import datetime, timezone
from hashlib import sha256
from pathlib import Path

from document_processing.models import DocumentMetadata
from document_processing.paragraph_splitter import split_paragraphs
from document_processing.title_extractor import extract_title
from document_processing.tokenizer import tokenize


def build_document_id(path: Path, content: str) -> str:
    source = f"{normalize_source_path(path)}::{content}".encode("utf-8")
    return sha256(source).hexdigest()[:16]


def normalize_source_path(path: Path) -> str:
    return path.resolve().as_posix()


def build_metadata(
    path: Path,
    original_content: str,
    normalized_content: str,
    processing_status: str = "normalized",
) -> DocumentMetadata:
    title = extract_title(normalized_content, fallback=path.stem.replace("_", " ").title())
    paragraphs = split_paragraphs(normalized_content)
    tokens = tokenize(normalized_content)

    return DocumentMetadata(
        document_id=build_document_id(path, original_content),
        title=title,
        source_path=normalize_source_path(path),
        source_extension=path.suffix.lower(),
        created_at=datetime.now(timezone.utc).isoformat(),
        processing_status=processing_status,
        character_count=len(normalized_content),
        word_count=len(tokens),
        paragraph_count=len(paragraphs),
        page_count=page_count_for_extension(path.suffix),
    )


def page_count_for_extension(extension: str) -> int:
    return 1 if extension.lower() in {".md", ".txt"} else 0

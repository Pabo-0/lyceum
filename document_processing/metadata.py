from datetime import datetime, timezone
from hashlib import sha256
from pathlib import Path

from document_processing.models import DocumentMetadata
from document_processing.paragraph_splitter import split_paragraphs
from document_processing.title_extractor import extract_title
from document_processing.tokenizer import tokenize


def build_document_id(path: Path, content: str) -> str:
    source = f"{path.as_posix()}::{content}".encode("utf-8")
    return sha256(source).hexdigest()[:16]


def build_metadata(path: Path, content: str) -> DocumentMetadata:
    title = extract_title(content, fallback=path.stem.replace("_", " ").title())
    paragraphs = split_paragraphs(content)
    tokens = tokenize(content)

    return DocumentMetadata(
        document_id=build_document_id(path, content),
        title=title,
        source_path=path.as_posix(),
        source_extension=path.suffix.lower(),
        created_at=datetime.now(timezone.utc).isoformat(),
        processing_status="ingested",
        character_count=len(content),
        word_count=len(tokens),
        paragraph_count=len(paragraphs),
    )


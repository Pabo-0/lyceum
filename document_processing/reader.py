from pathlib import Path

from document_processing.config import SUPPORTED_EXTENSIONS


def validate_supported_file(path: Path) -> None:
    if not path.exists():
        raise FileNotFoundError(f"Document not found: {path}")
    if not path.is_file():
        raise ValueError(f"Expected a file, got: {path}")
    if path.suffix.lower() not in SUPPORTED_EXTENSIONS:
        supported = ", ".join(sorted(SUPPORTED_EXTENSIONS))
        raise ValueError(f"Unsupported file type {path.suffix!r}. Supported: {supported}")


def read_text_document(path: Path) -> str:
    validate_supported_file(path)
    return path.read_text(encoding="utf-8")


from pathlib import Path
import sys


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.ingest_pipeline import ingest_directory
from document_processing.storage import DocumentStore


def main() -> int:
    documents_dir = PROJECT_ROOT / "test_documents"
    store = DocumentStore(
        storage_path=PROJECT_ROOT / "data/storage/documents.json",
        originals_dir=PROJECT_ROOT / "data/storage/originals",
    )
    documents = ingest_directory(documents_dir, store)

    print(f"Ingested {len(documents)} document(s).")
    for document in documents:
        metadata = document.metadata
        print(
            f"- {metadata.title} "
            f"({metadata.source_extension}, {metadata.word_count} words, "
            f"{metadata.paragraph_count} paragraphs)"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

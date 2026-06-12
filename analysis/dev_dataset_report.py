from pathlib import Path
import sys


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.storage import DocumentStore


def main() -> int:
    store = DocumentStore(
        storage_path=PROJECT_ROOT / "data/storage/documents.json",
        documents_dir=PROJECT_ROOT / "data/storage/documents",
    )
    documents = store.load_all()

    print(f"Stored documents: {len(documents)}")
    for item in documents:
        metadata = item["metadata"]
        report = item.get("normalization_report", {})
        structure = item.get("structure", {})
        print(
            f"- {metadata['title']} | "
            f"id={metadata['document_id']} | "
            f"words={metadata['word_count']} | "
            f"paragraphs={metadata['paragraph_count']} | "
            f"status={metadata['processing_status']} | "
            f"normalized_chars={report.get('normalized_character_count', 'n/a')} | "
            f"sections={structure.get('section_count', 'n/a')} | "
            f"chunks={structure.get('chunk_count', 'n/a')}"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

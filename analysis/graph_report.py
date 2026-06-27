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

    for item in documents:
        metadata = item["metadata"]
        graph = item.get("graph", {})

        print(f"\n{metadata['title']}")
        print(f"nodes={graph.get('node_count', 0)} relationships={graph.get('relationship_count', 0)}")
        print(f"node_counts={graph.get('node_counts_by_label', {})}")
        print(f"relationship_counts={graph.get('relationship_counts_by_type', {})}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

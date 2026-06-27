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
        concept_by_id = {
            concept["concept_id"]: concept["canonical_name"]
            for concept in item.get("concept_deduplication", {}).get("concepts", [])
        }
        semantic = item.get("semantic_relationships", {})
        relationships = semantic.get("relationships", [])

        print(f"\n{metadata['title']}")
        print(
            f"relationships={semantic.get('relationship_count', 0)} "
            f"counts={semantic.get('relationship_counts_by_type', {})}"
        )
        for relationship in relationships[:20]:
            source = concept_by_id.get(
                relationship["source_concept_id"],
                relationship["source_concept_id"],
            )
            target = concept_by_id.get(
                relationship["target_concept_id"],
                relationship["target_concept_id"],
            )
            print(
                f"- {source} {relationship['relationship_type']} {target} | "
                f"weight={relationship['weight']} | "
                f"confidence={relationship['confidence']} | "
                f"method={relationship['method']}"
            )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

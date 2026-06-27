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
        concept_extraction = item.get("concept_extraction", {})
        concept_deduplication = item.get("concept_deduplication", {})
        concepts = concept_deduplication.get("concepts") or concept_extraction.get("concepts", [])
        mentions = concept_deduplication.get("mentions") or concept_extraction.get("mentions", [])

        print(f"\n{metadata['title']}")
        print(f"concepts={len(concepts)} mentions={len(mentions)}")

        for concept in concepts[:15]:
            name = concept.get("canonical_name", concept.get("normalized_name"))
            variants = concept.get("variant_terms", [])
            variant_suffix = f" | variants={variants}" if len(variants) > 1 else ""
            print(
                f"- {name} | "
                f"score={concept['score']} | "
                f"freq={concept['frequency']} | "
                f"chunks={concept['chunk_frequency']}"
                f"{variant_suffix}"
            )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

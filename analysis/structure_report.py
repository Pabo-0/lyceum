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
        structure = item.get("structure", {})
        sections = structure.get("sections", [])

        print(f"\n{metadata['title']}")
        print(f"sections={structure.get('section_count', 0)} chunks={structure.get('chunk_count', 0)}")

        section_by_id = {section["section_id"]: section for section in sections}
        for section in sections:
            depth = _section_depth(section, section_by_id)
            indent = "  " * depth
            print(
                f"{indent}- {section['title']} "
                f"[{section['section_id']}, level={section['level']}, "
                f"type={section['heading_type']}, chunks={len(section['chunks'])}]"
            )
            for chunk in section["chunks"]:
                preview = chunk["text"][:70]
                suffix = "..." if len(chunk["text"]) > 70 else ""
                print(f"{indent}  * {chunk['chunk_id']}: {preview}{suffix}")

    return 0


def _section_depth(section: dict, section_by_id: dict[str, dict]) -> int:
    depth = 0
    parent_id = section.get("parent_section_id")
    while parent_id and parent_id in section_by_id:
        depth += 1
        parent_id = section_by_id[parent_id].get("parent_section_id")
    return depth


if __name__ == "__main__":
    raise SystemExit(main())

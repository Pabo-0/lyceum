from pathlib import Path
import sys


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.config import DEFAULT_NEO4J_EXPORT_DIR
from document_processing.neo4j_cypher import (
    build_neo4j_schema_cypher,
    build_neo4j_verification_cypher,
    graph_to_cypher,
)
from document_processing.storage import DocumentStore


def export_neo4j_cypher(
    store: DocumentStore | None = None,
    export_dir: Path | None = None,
) -> dict[str, int]:
    active_store = store or DocumentStore(
        storage_path=PROJECT_ROOT / "data/storage/documents.json",
        documents_dir=PROJECT_ROOT / "data/storage/documents",
    )
    active_export_dir = export_dir or PROJECT_ROOT / DEFAULT_NEO4J_EXPORT_DIR
    active_export_dir.mkdir(parents=True, exist_ok=True)

    documents = active_store.load_all()
    schema_cypher = build_neo4j_schema_cypher()
    verification_cypher = build_neo4j_verification_cypher()

    node_count = 0
    relationship_count = 0
    graph_exports: list[str] = []

    for document in documents:
        metadata = document["metadata"]
        graph = document.get("graph", {})
        node_count += graph.get("node_count", 0)
        relationship_count += graph.get("relationship_count", 0)
        graph_exports.append(
            "\n".join(
                [
                    f"// Document: {metadata['title']}",
                    f"// Document ID: {metadata['document_id']}",
                    graph_to_cypher(graph).rstrip(),
                ]
            )
        )

    (active_export_dir / "schema.cypher").write_text(schema_cypher, encoding="utf-8")
    (active_export_dir / "verification_queries.cypher").write_text(
        verification_cypher,
        encoding="utf-8",
    )
    (active_export_dir / "all_documents.cypher").write_text(
        "\n\n".join([schema_cypher.rstrip(), *graph_exports]) + "\n",
        encoding="utf-8",
    )

    return {
        "document_count": len(documents),
        "node_count": node_count,
        "relationship_count": relationship_count,
    }


def main() -> int:
    summary = export_neo4j_cypher()
    print("Neo4j Cypher export ready.")
    print(f"documents={summary['document_count']}")
    print(f"nodes={summary['node_count']}")
    print(f"relationships={summary['relationship_count']}")
    print(f"output_dir={(PROJECT_ROOT / DEFAULT_NEO4J_EXPORT_DIR).as_posix()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

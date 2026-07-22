from pathlib import Path
import os
import sys


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
BACKEND_DIR = PROJECT_ROOT / "backend"
for path in (BACKEND_DIR, PROJECT_ROOT):
    path_string = str(path)
    if path_string not in sys.path:
        sys.path.insert(0, path_string)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")

import django


django.setup()

from apps.graphs.services.document_service import build_document_store
from apps.graphs.services.neo4j_gateway import Neo4jGateway
from document_processing.phase2_graph_builder import build_phase2_graph
from scripts.export_neo4j_cypher import export_neo4j_cypher


def main() -> int:
    store = build_document_store()
    gateway = Neo4jGateway()

    if not gateway.is_configured():
        print("Neo4j is not configured. Set NEO4J_URI, NEO4J_USER and NEO4J_PASSWORD.")
        return 1

    documents = _load_documents_with_orphans(store)
    if not documents:
        print("No local documents found to migrate.")
        return 0

    export_summary = export_neo4j_cypher(store)
    migrated = 0
    node_count = 0
    relationship_count = 0

    for document in documents:
        metadata = document["metadata"]
        graph = build_phase2_graph(document)
        result = gateway.replace_document_graph(metadata["document_id"], graph)
        if result.get("status") != "synced":
            print(f"Failed to migrate {metadata['document_id']}: {result.get('reason')}")
            return 1
        migrated += 1
        node_count += graph.get("node_count", len(graph.get("nodes", [])))
        relationship_count += graph.get(
            "relationship_count",
            len(graph.get("relationships", [])),
        )

    print("Neo4j AuraDB migration complete.")
    print(f"documents={migrated}")
    print(f"nodes={node_count}")
    print(f"relationships={relationship_count}")
    print(f"cypher_documents={export_summary['document_count']}")
    return 0


def _load_documents_with_orphans(store) -> list[dict]:
    documents = store.load_all()
    indexed_ids = {
        document.get("metadata", {}).get("document_id")
        for document in documents
    }

    orphan_documents = []
    if store.documents_dir.exists():
        for document_dir in sorted(path for path in store.documents_dir.iterdir() if path.is_dir()):
            if document_dir.name in indexed_ids:
                continue
            if not (document_dir / "metadata.json").exists():
                continue
            if not (document_dir / "graph.json").exists():
                continue
            orphan_documents.append(store.load_document(document_dir.name))

    if orphan_documents:
        documents = [*documents, *orphan_documents]
        store.save_all([_index_entry(store, document) for document in documents])

    return documents


def _index_entry(store, document: dict) -> dict:
    metadata = document["metadata"]
    document_id = metadata["document_id"]
    document_dir = store.documents_dir / document_id
    return {
        "document_id": document_id,
        "title": metadata.get("title", document_id),
        "source_path": metadata.get("source_path", ""),
        "source_extension": metadata.get("source_extension", ""),
        "processing_status": metadata.get("processing_status", "neo4j_export_ready"),
        "document_dir": document_dir.as_posix(),
        "metadata_path": (document_dir / "metadata.json").as_posix(),
        "structure_path": (document_dir / "structure.json").as_posix(),
        "concepts_path": (document_dir / "concepts.json").as_posix(),
        "concept_mentions_path": (document_dir / "concept_mentions.json").as_posix(),
        "canonical_concepts_path": (document_dir / "canonical_concepts.json").as_posix(),
        "normalized_concept_mentions_path": (
            document_dir / "normalized_concept_mentions.json"
        ).as_posix(),
        "semantic_relationships_path": (document_dir / "semantic_relationships.json").as_posix(),
        "graph_path": (document_dir / "graph.json").as_posix(),
        "neo4j_cypher_path": (document_dir / "neo4j.cypher").as_posix(),
    }


if __name__ == "__main__":
    raise SystemExit(main())

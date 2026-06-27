from pathlib import Path
from typing import Any
from uuid import uuid4

from django.conf import settings

from document_processing.config import SUPPORTED_EXTENSIONS
from document_processing.ingest_pipeline import ingest_file
from document_processing.storage import DocumentStore
from scripts.export_neo4j_cypher import export_neo4j_cypher

from .neo4j_gateway import Neo4jGateway


class DocumentService:
    def __init__(self) -> None:
        self.store = build_document_store()
        self.neo4j = Neo4jGateway()

    def list_documents(self) -> list[dict[str, Any]]:
        return self.store.load_index()

    def get_document(self, document_id: str) -> dict[str, Any]:
        return self.store.load_document(document_id)

    def get_document_graph(self, document_id: str) -> dict[str, Any]:
        document = self.get_document(document_id)
        return document["graph"]

    def create_document(
        self,
        *,
        content: str,
        filename: str,
    ) -> dict[str, Any]:
        source_path = self._save_uploaded_content(content, filename)
        document = ingest_file(source_path, self.store)
        export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)
        neo4j_sync = self.neo4j.sync_graph(document.graph.to_dict())

        return {
            "document": document.to_dict(),
            "neo4j_sync": neo4j_sync,
        }

    def _save_uploaded_content(self, content: str, filename: str) -> Path:
        safe_name = Path(filename).name
        extension = Path(safe_name).suffix.lower()
        if extension not in SUPPORTED_EXTENSIONS:
            supported = ", ".join(sorted(SUPPORTED_EXTENSIONS))
            raise ValueError(f"Unsupported file extension. Supported: {supported}")

        settings.LYCEUM_UPLOADS_DIR.mkdir(parents=True, exist_ok=True)
        target = settings.LYCEUM_UPLOADS_DIR / f"{uuid4().hex}_{safe_name}"
        target.write_text(content, encoding="utf-8")
        return target


def build_document_store() -> DocumentStore:
    return DocumentStore(
        storage_path=settings.LYCEUM_STORAGE_PATH,
        documents_dir=settings.LYCEUM_DOCUMENTS_DIR,
        originals_dir=settings.LYCEUM_ORIGINALS_DIR,
        normalized_dir=settings.LYCEUM_NORMALIZED_DIR,
    )

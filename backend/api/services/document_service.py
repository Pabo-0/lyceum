import shutil
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

    def delete_document(self, document_id: str) -> dict[str, Any]:
        document = self.get_document(document_id)
        metadata = document.get("metadata", {})
        graph = document.get("graph", {})
        storage_delete = self.store.delete(document_id)
        upload_delete = self._delete_uploaded_source(str(metadata.get("source_path", "")))
        export_summary = export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)
        neo4j_sync = self.neo4j.delete_graph(graph)

        return {
            "document_id": document_id,
            "deleted_document": {
                "document_id": document_id,
                "title": metadata.get("title", ""),
            },
            "storage_delete": storage_delete,
            "upload_delete": upload_delete,
            "neo4j_export": export_summary,
            "neo4j_sync": neo4j_sync,
        }

    def rename_document(self, document_id: str, title: str) -> dict[str, Any]:
        renamed = self.store.rename(document_id, title)
        export_summary = export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)
        neo4j_sync = self.neo4j.patch_node(
            f"document:{document_id}",
            {"title": renamed["title"]},
        )
        document = self.get_document(document_id)

        return {
            "document_id": document_id,
            "document": document,
            "old_title": renamed["old_title"],
            "title": renamed["title"],
            "neo4j_export": export_summary,
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

    def _delete_uploaded_source(self, source_path: str) -> dict[str, Any]:
        if not source_path:
            return {"deleted": False, "reason": "empty_source_path"}

        source = Path(source_path)
        uploads_dir = settings.LYCEUM_UPLOADS_DIR.resolve()
        try:
            resolved_source = source.resolve()
        except OSError as exc:
            return {"deleted": False, "reason": str(exc), "path": source_path}

        if not _is_relative_to(resolved_source, uploads_dir):
            return {
                "deleted": False,
                "reason": "source_outside_uploads_dir",
                "path": source_path,
            }

        if not resolved_source.exists():
            return {"deleted": False, "reason": "source_not_found", "path": source_path}

        resolved_source.unlink()
        return {"deleted": True, "path": resolved_source.as_posix()}


def build_document_store() -> DocumentStore:
    store = DocumentStore(
        storage_path=settings.LYCEUM_STORAGE_PATH,
        documents_dir=settings.LYCEUM_DOCUMENTS_DIR,
        originals_dir=settings.LYCEUM_ORIGINALS_DIR,
        normalized_dir=settings.LYCEUM_NORMALIZED_DIR,
    )
    seed_runtime_storage(store)
    return store


def seed_runtime_storage(store: DocumentStore) -> None:
    if not getattr(settings, "LYCEUM_SEED_RUNTIME_STORAGE", False):
        return
    if store.storage_path.exists():
        return

    seed_dir = Path(settings.LYCEUM_SEED_STORAGE_DIR)
    if not seed_dir.exists():
        return

    target_dir = store.storage_path.parent
    target_dir.mkdir(parents=True, exist_ok=True)
    shutil.copytree(seed_dir, target_dir, dirs_exist_ok=True)


def _is_relative_to(path: Path, base: Path) -> bool:
    try:
        path.relative_to(base)
        return True
    except ValueError:
        return False

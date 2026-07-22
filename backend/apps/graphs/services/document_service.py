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
from .sql_registry import (
    attach_sql_metadata,
    clear_node_positions_for_document,
    graph_space_for_document,
    mark_document_deleted,
    node_positions_for_document,
    register_document,
    rename_graph_space,
    save_node_position,
    with_graph_space_metadata,
)


class DocumentService:
    def __init__(self) -> None:
        self.store = build_document_store()
        self.neo4j = Neo4jGateway()

    def list_documents(self, workspace_id: str | None = None) -> list[dict[str, Any]]:
        if self.neo4j.is_graph_backend():
            try:
                return attach_sql_metadata(self.neo4j.list_documents(), workspace_id)
            except Exception:
                return attach_sql_metadata(self.store.load_index(), workspace_id)
        return attach_sql_metadata(self.store.load_index(), workspace_id)

    def get_document(self, document_id: str, workspace_id: str | None = None) -> dict[str, Any]:
        graph_space = graph_space_for_document(document_id, workspace_id)
        if not self.neo4j.is_graph_backend():
            return with_graph_space_metadata(self.store.load_document(document_id), graph_space)

        try:
            graph = self.neo4j.load_document_graph(document_id)
        except Exception:
            return with_graph_space_metadata(self.store.load_document(document_id), graph_space)

        try:
            document = self.store.load_document(document_id)
        except FileNotFoundError:
            metadata = self.neo4j.load_document_metadata(document_id)
            return with_graph_space_metadata(
                _document_from_neo4j(metadata, graph),
                graph_space,
            )

        document["graph"] = graph
        document["metadata"].update(self.neo4j.load_document_metadata(document_id))
        return with_graph_space_metadata(document, graph_space)

    def get_document_graph(
        self,
        document_id: str,
        workspace_id: str | None = None,
    ) -> dict[str, Any]:
        if workspace_id and graph_space_for_document(document_id, workspace_id) is None:
            self.ensure_sql_document(document_id, workspace_id)
        if self.neo4j.is_graph_backend():
            try:
                return self.neo4j.load_document_graph(document_id)
            except Exception:
                pass
        document = self.get_document(document_id)
        return document["graph"]

    def get_document_node_positions(
        self,
        document_id: str,
        workspace_id: str | None = None,
    ) -> dict[str, dict[str, float]]:
        return node_positions_for_document(document_id, workspace_id)

    def create_document(
        self,
        *,
        content: str,
        filename: str,
        workspace_id: str | None = None,
    ) -> dict[str, Any]:
        source_path = self._save_uploaded_content(content, filename)
        document = ingest_file(source_path, self.store)
        document_dict = document.to_dict()
        graph_space = register_document(
            document=document_dict,
            filename=filename,
            source_path=source_path,
            workspace_id=workspace_id,
        )
        export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)
        neo4j_sync = self.neo4j.sync_document(
            document_dict,
            _phase2_graph_context(graph_space),
        )

        return {
            "document": with_graph_space_metadata(document_dict, graph_space),
            "neo4j_sync": neo4j_sync,
        }

    def delete_document(self, document_id: str, workspace_id: str | None = None) -> dict[str, Any]:
        document = self.get_document(document_id, workspace_id)
        metadata = document.get("metadata", {})
        try:
            storage_delete = self.store.delete(document_id)
        except FileNotFoundError:
            storage_delete = {
                "document_id": document_id,
                "deleted_paths": [],
                "deleted_index_entry": None,
                "index_removed": False,
                "reason": "local_snapshot_not_found",
            }
        upload_delete = self._delete_uploaded_source(str(metadata.get("source_path", "")))
        export_summary = export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)
        neo4j_sync = self.neo4j.delete_document_graph(document_id)
        mark_document_deleted(document_id, workspace_id)

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

    def rename_document(
        self,
        document_id: str,
        title: str,
        workspace_id: str | None = None,
    ) -> dict[str, Any]:
        clean_title = " ".join(str(title).split())
        if not clean_title:
            raise ValueError("Document title is required")

        try:
            renamed = self.store.rename(document_id, clean_title)
            export_summary = export_neo4j_cypher(self.store, settings.LYCEUM_NEO4J_EXPORT_DIR)
        except FileNotFoundError:
            renamed = {
                "document_id": document_id,
                "old_title": "",
                "title": clean_title,
            }
            export_summary = {
                "document_count": len(self.store.load_index()),
                "node_count": 0,
                "relationship_count": 0,
            }

        rename_graph_space(document_id, clean_title, workspace_id)
        graph_space = graph_space_for_document(document_id, workspace_id)
        try:
            document = self.store.load_document(document_id)
        except FileNotFoundError:
            document = self.get_document(document_id, workspace_id)
        neo4j_sync = self.neo4j.sync_document(
            document,
            _phase2_graph_context(graph_space),
        )

        return {
            "document_id": document_id,
            "document": document,
            "old_title": renamed["old_title"],
            "title": clean_title,
            "neo4j_export": export_summary,
            "neo4j_sync": neo4j_sync,
        }

    def save_node_position(
        self,
        *,
        document_id: str,
        node_id: str,
        x: float,
        y: float,
        workspace_id: str | None = None,
    ) -> dict[str, Any]:
        position = save_node_position(
            document_id=document_id,
            node_id=node_id,
            x=x,
            y=y,
            workspace_id=workspace_id,
        )
        return {
            "document_id": document_id,
            "node_id": node_id,
            "position": {
                "id": str(position.pk),
                "x": position.x,
                "y": position.y,
                "graph_view_id": str(position.graph_view_id),
            },
        }

    def clear_node_positions(
        self,
        *,
        document_id: str,
        workspace_id: str | None = None,
    ) -> dict[str, Any]:
        deleted_count = clear_node_positions_for_document(document_id, workspace_id)
        return {
            "document_id": document_id,
            "deleted_position_count": deleted_count,
            "node_positions": {},
        }

    def ensure_sql_document(self, document_id: str, workspace_id: str | None) -> None:
        if not workspace_id:
            return

        try:
            document = self.store.load_document(document_id)
        except FileNotFoundError:
            return

        metadata = document.get("metadata", {})
        source_path = Path(str(metadata.get("source_path") or ""))
        filename = source_path.name or f"{metadata.get('title') or document_id}.md"
        register_document(
            document=document,
            filename=filename,
            source_path=source_path,
            workspace_id=workspace_id,
        )

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


def _phase2_graph_context(graph_space) -> dict[str, str]:
    if graph_space is None:
        return {}
    workspace = graph_space.workspace
    owner_id = getattr(workspace, "owner_id", None)
    return {
        "workspace_id": str(graph_space.workspace_id),
        "graph_space_id": str(graph_space.pk),
        "created_by": str(owner_id) if owner_id else "",
        "updated_by": str(owner_id) if owner_id else "",
        "language": workspace.default_language,
    }


def _document_from_neo4j(metadata: dict[str, Any], graph: dict[str, Any]) -> dict[str, Any]:
    return {
        "metadata": metadata,
        "original_content": "",
        "normalized_content": "",
        "normalization_report": {
            "original_character_count": 0,
            "normalized_character_count": 0,
            "original_paragraph_count": 0,
            "normalized_paragraph_count": 0,
            "removed_character_count": 0,
        },
            "structure": {
                "sections": [],
                "orphan_chunks": [],
                "section_count": graph.get("node_counts_by_label", {}).get("Section", 0),
                "subsection_count": 0,
                "chunk_count": graph.get("node_counts_by_label", {}).get("Chunk", 0),
            },
        "concept_extraction": {
            "concepts": [],
            "mentions": [],
            "concept_count": 0,
            "mention_count": 0,
            "extraction_methods": [],
        },
        "concept_deduplication": {
            "concepts": [],
            "mentions": [],
            "concept_count": 0,
            "mention_count": 0,
            "variant_count": 0,
            "normalization_methods": [],
        },
        "semantic_relationships": {
            "relationships": [],
            "relationship_count": 0,
            "relationship_counts_by_type": {},
            "methods": [],
        },
        "graph": graph,
    }

from pathlib import Path
from typing import Any
from uuid import UUID

from django.utils import timezone

from apps.choices import LifecycleStatus
from apps.graphs.models import (
    GraphBackend,
    GraphSpace,
    GraphView,
    GraphViewNodePosition,
)
from apps.workspaces.models import AssetStatus, UploadedAsset, Workspace


def get_workspace(workspace_id: str | None) -> Workspace | None:
    if not workspace_id:
        return None
    try:
        UUID(str(workspace_id))
    except (TypeError, ValueError):
        raise ValueError("Workspace invalido.")

    try:
        return Workspace.objects.get(pk=workspace_id, status=LifecycleStatus.ACTIVE)
    except Workspace.DoesNotExist as exc:
        raise ValueError("Workspace no encontrado.") from exc


def attach_sql_metadata(
    documents: list[dict[str, Any]],
    workspace_id: str | None = None,
) -> list[dict[str, Any]]:
    active_graph_spaces = GraphSpace.objects.select_related("workspace").filter(
        status=LifecycleStatus.ACTIVE,
    )
    registered_refs = set(active_graph_spaces.values_list("graph_ref", flat=True))
    graph_spaces = active_graph_spaces
    if workspace_id:
        graph_spaces = graph_spaces.filter(workspace_id=workspace_id)

    by_ref = {graph_space.graph_ref: graph_space for graph_space in graph_spaces}
    enriched_documents = []
    for document in documents:
        document_id = document_identifier(document)
        graph_space = by_ref.get(document_id)
        if workspace_id and not graph_space and document_id in registered_refs:
            continue
        enriched_documents.append(with_graph_space_metadata(document, graph_space))
    return enriched_documents


def register_document(
    *,
    document: dict[str, Any],
    filename: str,
    source_path: Path,
    workspace_id: str | None,
) -> GraphSpace | None:
    workspace = get_workspace(workspace_id)
    if workspace is None:
        return None

    metadata = document.get("metadata", {})
    document_id = str(metadata.get("document_id") or "")
    if not document_id:
        return None

    title = unique_graph_title(
        workspace=workspace,
        title=str(metadata.get("title") or Path(filename).stem or "Grafo"),
        graph_ref=document_id,
    )
    graph_space, _ = GraphSpace.objects.update_or_create(
        graph_ref=document_id,
        defaults={
            "workspace": workspace,
            "title": title,
            "status": LifecycleStatus.ACTIVE,
            "graph_backend": graph_backend_value(),
        },
    )
    GraphView.objects.get_or_create(
        graph_space=graph_space,
        is_default=True,
        defaults={"title": "Vista principal"},
    )
    UploadedAsset.objects.update_or_create(
        workspace=workspace,
        graph_space=graph_space,
        file_path=str(source_path),
        defaults={
            "file_name": Path(filename).name,
            "mime_type": mime_type_from_filename(filename),
            "size_bytes": source_path.stat().st_size if source_path.exists() else None,
            "status": AssetStatus.READY,
        },
    )
    return graph_space


def rename_graph_space(document_id: str, title: str, workspace_id: str | None = None) -> None:
    graph_space = graph_space_for_document(document_id, workspace_id)
    if graph_space is None:
        return

    graph_space.title = unique_graph_title(
        workspace=graph_space.workspace,
        title=title,
        graph_ref=document_id,
    )
    graph_space.save(update_fields=["title", "updated_at"])


def mark_document_deleted(document_id: str, workspace_id: str | None = None) -> None:
    graph_space = graph_space_for_document(document_id, workspace_id)
    if graph_space is None:
        return

    graph_space.uploaded_assets.all().delete()
    graph_space.delete()


def touch_graph_space(document_id: str) -> None:
    GraphSpace.objects.filter(graph_ref=document_id).update(updated_at=timezone.now())


def save_node_position(
    *,
    document_id: str,
    node_id: str,
    x: float,
    y: float,
    workspace_id: str | None,
) -> GraphViewNodePosition:
    graph_space = graph_space_for_document(document_id, workspace_id)
    if graph_space is None:
        raise ValueError("Grafo no registrado en SQL para este workspace.")

    graph_view, _ = GraphView.objects.get_or_create(
        graph_space=graph_space,
        is_default=True,
        defaults={"title": "Vista principal"},
    )
    position, _ = GraphViewNodePosition.objects.update_or_create(
        graph_view=graph_view,
        node_id=node_id,
        defaults={"x": x, "y": y},
    )
    return position


def node_positions_for_document(
    document_id: str,
    workspace_id: str | None,
) -> dict[str, dict[str, float]]:
    graph_space = graph_space_for_document(document_id, workspace_id)
    if graph_space is None:
        return {}

    graph_view = (
        GraphView.objects.filter(graph_space=graph_space, is_default=True)
        .prefetch_related("node_positions")
        .first()
    )
    if graph_view is None:
        return {}

    return {
        position.node_id: {
            "x": position.x,
            "y": position.y,
        }
        for position in graph_view.node_positions.all()
        if not position.hidden
    }


def clear_node_positions_for_document(
    document_id: str,
    workspace_id: str | None,
) -> int:
    graph_space = graph_space_for_document(document_id, workspace_id)
    if graph_space is None:
        return 0

    graph_view = GraphView.objects.filter(
        graph_space=graph_space,
        is_default=True,
    ).first()
    if graph_view is None:
        return 0

    deleted_count, _ = GraphViewNodePosition.objects.filter(graph_view=graph_view).delete()
    return deleted_count


def graph_space_for_document(document_id: str, workspace_id: str | None = None) -> GraphSpace | None:
    query = GraphSpace.objects.filter(graph_ref=document_id)
    if workspace_id:
        query = query.filter(workspace_id=workspace_id)
    return query.select_related("workspace").first()


def with_graph_space_metadata(
    document: dict[str, Any],
    graph_space: GraphSpace | None,
) -> dict[str, Any]:
    if graph_space is None:
        return document

    enriched = dict(document)
    enriched["workspace_id"] = str(graph_space.workspace_id)
    enriched["graph_space_id"] = str(graph_space.pk)
    metadata = dict(enriched.get("metadata") or {})
    metadata["workspace_id"] = str(graph_space.workspace_id)
    metadata["graph_space_id"] = str(graph_space.pk)
    enriched["metadata"] = metadata
    return enriched


def document_identifier(document: dict[str, Any]) -> str:
    metadata = document.get("metadata") or {}
    return str(
        document.get("document_id")
        or document.get("id")
        or metadata.get("document_id")
        or metadata.get("id")
        or ""
    )


def unique_graph_title(*, workspace: Workspace, title: str, graph_ref: str) -> str:
    clean_title = " ".join(str(title or "Grafo").split())[:160] or "Grafo"
    candidate = clean_title
    suffix = 2
    while GraphSpace.objects.filter(
        workspace=workspace,
        title=candidate,
    ).exclude(graph_ref=graph_ref).exists():
        suffix_text = f" ({suffix})"
        candidate = f"{clean_title[:160 - len(suffix_text)]}{suffix_text}"
        suffix += 1
    return candidate


def graph_backend_value() -> str:
    return GraphBackend.NEO4J


def mime_type_from_filename(filename: str) -> str:
    suffix = Path(filename).suffix.lower().lstrip(".")
    if suffix == "md":
        return "text/markdown"
    if suffix == "txt":
        return "text/plain"
    return suffix or "application/octet-stream"


import json
from json import JSONDecodeError
from typing import Any
from urllib.parse import unquote

from django.http import HttpRequest, HttpResponseNotAllowed, JsonResponse
from django.views.decorators.csrf import csrf_exempt

from .services.document_service import DocumentService
from .services.graph_service import GraphService


@csrf_exempt
def documents_collection(request: HttpRequest) -> JsonResponse:
    service = DocumentService()
    if request.method == "GET":
        try:
            return json_response({"documents": service.list_documents(workspace_id_from_request(request))})
        except ValueError as exc:
            return error_response(str(exc), status=400)

    if request.method == "POST":
        try:
            content, filename = _document_payload(request)
            result = service.create_document(
                content=content,
                filename=filename,
                workspace_id=workspace_id_from_request(request),
            )
            return json_response(result, status=201)
        except (JSONDecodeError, ValueError, UnicodeDecodeError) as exc:
            return error_response(str(exc), status=400)
        except Exception as exc:
            return error_response(str(exc), status=500)

    return method_not_allowed(["GET", "POST"])


@csrf_exempt
def document_detail(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method == "GET":
        try:
            document = DocumentService().get_document(document_id, workspace_id_from_request(request))
        except FileNotFoundError:
            return error_response(f"Document not found: {document_id}", status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

        return json_response({"document": document})

    if request.method == "PATCH":
        try:
            payload = parse_json_body(request)
            title = str(payload.get("title", ""))
            result = DocumentService().rename_document(
                document_id,
                title,
                workspace_id_from_request(request),
            )
            return json_response(result)
        except JSONDecodeError as exc:
            return error_response(str(exc), status=400)
        except FileNotFoundError:
            return error_response(f"Document not found: {document_id}", status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    if request.method == "DELETE":
        try:
            result = DocumentService().delete_document(document_id, workspace_id_from_request(request))
            return json_response(result)
        except FileNotFoundError:
            return error_response(f"Document not found: {document_id}", status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    return method_not_allowed(["GET", "PATCH", "DELETE"])


def document_graph(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method != "GET":
        return method_not_allowed(["GET"])

    try:
        workspace_id = workspace_id_from_request(request)
        service = DocumentService()
        graph = service.get_document_graph(
            document_id,
            workspace_id,
        )
        node_positions = service.get_document_node_positions(document_id, workspace_id)
    except FileNotFoundError:
        return error_response(f"Document not found: {document_id}", status=404)

    return json_response({
        "document_id": document_id,
        "graph": graph,
        "node_positions": node_positions,
    })


@csrf_exempt
def document_nodes(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method != "POST":
        return method_not_allowed(["POST"])

    try:
        payload = parse_json_body(request)
        labels = payload.get("labels") or [payload.get("label", "Concept")]
        properties = payload.get("properties", {})
        result = GraphService().create_node(document_id, labels, properties)
        return json_response(result, status=201)
    except JSONDecodeError as exc:
        return error_response(str(exc), status=400)
    except FileNotFoundError:
        return error_response(f"Document not found: {document_id}", status=404)
    except (KeyError, ValueError) as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def document_relationships(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method != "POST":
        return method_not_allowed(["POST"])

    try:
        payload = parse_json_body(request)
        result = GraphService().create_relationship(
            document_id=document_id,
            source_id=str(payload.get("source_id", "")),
            target_id=str(payload.get("target_id", "")),
            relationship_type=str(payload.get("relationship_type", "RELATES")),
            properties=payload.get("properties", {}),
        )
        return json_response(result, status=201)
    except JSONDecodeError as exc:
        return error_response(str(exc), status=400)
    except FileNotFoundError:
        return error_response(f"Document not found: {document_id}", status=404)
    except KeyError as exc:
        return error_response(str(exc), status=404)
    except ValueError as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def document_node_merge(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method != "POST":
        return method_not_allowed(["POST"])

    try:
        payload = parse_json_body(request)
        result = GraphService().merge_nodes(
            document_id=document_id,
            target_node_id=str(payload.get("target_node_id", "")),
            source_node_ids=payload.get("source_node_ids", []),
            properties=payload.get("properties", {}),
        )
        return json_response(result)
    except JSONDecodeError as exc:
        return error_response(str(exc), status=400)
    except FileNotFoundError:
        return error_response(f"Document not found: {document_id}", status=404)
    except KeyError as exc:
        return error_response(str(exc), status=404)
    except ValueError as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def document_node_positions(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method == "DELETE":
        try:
            result = DocumentService().clear_node_positions(
                document_id=document_id,
                workspace_id=workspace_id_from_request(request),
            )
            return json_response(result)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    if request.method != "POST":
        return method_not_allowed(["POST", "DELETE"])

    try:
        payload = parse_json_body(request)
        result = DocumentService().save_node_position(
            document_id=document_id,
            node_id=str(payload.get("node_id") or ""),
            x=float(payload.get("x")),
            y=float(payload.get("y")),
            workspace_id=workspace_id_from_request(request),
        )
        return json_response(result)
    except (TypeError, JSONDecodeError, ValueError) as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def node_detail(request: HttpRequest, node_id: str) -> JsonResponse:
    service = GraphService()
    node_id = unquote(node_id)

    if request.method == "PATCH":
        try:
            payload = parse_json_body(request)
            properties = payload.get("properties", payload)
            result = service.patch_node(
                node_id,
                properties,
                labels=payload.get("labels"),
            )
            return json_response(result)
        except JSONDecodeError as exc:
            return error_response(str(exc), status=400)
        except (KeyError, FileNotFoundError) as exc:
            return error_response(str(exc), status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    if request.method == "DELETE":
        try:
            result = service.delete_node(node_id, workspace_id_from_request(request))
            return json_response(result)
        except (KeyError, FileNotFoundError) as exc:
            return error_response(str(exc), status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    return method_not_allowed(["PATCH", "DELETE"])


@csrf_exempt
def relationship_detail(request: HttpRequest, relationship_id: str) -> JsonResponse:
    service = GraphService()
    relationship_id = unquote(relationship_id)

    if request.method == "PATCH":
        try:
            payload = parse_json_body(request)
            properties = payload.get("properties", payload)
            result = service.patch_relationship(
                relationship_id,
                properties,
                relationship_type=payload.get("relationship_type"),
            )
            return json_response(result)
        except JSONDecodeError as exc:
            return error_response(str(exc), status=400)
        except (KeyError, FileNotFoundError) as exc:
            return error_response(str(exc), status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    if request.method == "DELETE":
        try:
            result = service.delete_relationship(relationship_id)
            return json_response(result)
        except (KeyError, FileNotFoundError) as exc:
            return error_response(str(exc), status=404)

    return method_not_allowed(["PATCH", "DELETE"])


def _document_payload(request: HttpRequest) -> tuple[str, str]:
    uploaded_file = request.FILES.get("file")
    if uploaded_file:
        content = uploaded_file.read().decode("utf-8")
        return content, uploaded_file.name

    if request.content_type.startswith("application/json"):
        payload = parse_json_body(request)
    else:
        payload = request.POST

    content = payload.get("content", "")
    filename = payload.get("filename", "document.md")
    if not content:
        raise ValueError("Document content is required")
    return str(content), str(filename)


def parse_json_body(request: HttpRequest) -> dict[str, Any]:
    body = request.body.decode("utf-8") if request.body else "{}"
    payload = json.loads(body)
    if not isinstance(payload, dict):
        raise ValueError("JSON body must be an object")
    return payload


def json_response(data: dict[str, Any], status: int = 200) -> JsonResponse:
    return JsonResponse(
        data,
        status=status,
        json_dumps_params={"ensure_ascii": False},
    )


def error_response(message: str, status: int) -> JsonResponse:
    return json_response({"error": message}, status=status)


def method_not_allowed(allowed: list[str]) -> HttpResponseNotAllowed:
    return HttpResponseNotAllowed(allowed)


def workspace_id_from_request(request: HttpRequest) -> str:
    return request.headers.get("X-Lyceum-Workspace-Id", "").strip()

import json
from json import JSONDecodeError
from typing import Any

from django.http import HttpRequest, HttpResponseNotAllowed, JsonResponse
from django.views.decorators.csrf import csrf_exempt

from .services.document_service import DocumentService
from .services.graph_service import GraphService


@csrf_exempt
def documents_collection(request: HttpRequest) -> JsonResponse:
    service = DocumentService()
    if request.method == "GET":
        return json_response({"documents": service.list_documents()})

    if request.method == "POST":
        try:
            content, filename = _document_payload(request)
            result = service.create_document(content=content, filename=filename)
            return json_response(result, status=201)
        except (JSONDecodeError, ValueError, UnicodeDecodeError) as exc:
            return error_response(str(exc), status=400)
        except Exception as exc:
            return error_response(str(exc), status=500)

    return method_not_allowed(["GET", "POST"])


def document_detail(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method != "GET":
        return method_not_allowed(["GET"])

    try:
        document = DocumentService().get_document(document_id)
    except FileNotFoundError:
        return error_response(f"Document not found: {document_id}", status=404)

    return json_response({"document": document})


def document_graph(request: HttpRequest, document_id: str) -> JsonResponse:
    if request.method != "GET":
        return method_not_allowed(["GET"])

    try:
        graph = DocumentService().get_document_graph(document_id)
    except FileNotFoundError:
        return error_response(f"Document not found: {document_id}", status=404)

    return json_response({"document_id": document_id, "graph": graph})


@csrf_exempt
def node_detail(request: HttpRequest, node_id: str) -> JsonResponse:
    service = GraphService()

    if request.method == "PATCH":
        try:
            payload = parse_json_body(request)
            properties = payload.get("properties", payload)
            result = service.patch_node(node_id, properties)
            return json_response(result)
        except JSONDecodeError as exc:
            return error_response(str(exc), status=400)
        except (KeyError, FileNotFoundError) as exc:
            return error_response(str(exc), status=404)
        except ValueError as exc:
            return error_response(str(exc), status=400)

    if request.method == "DELETE":
        try:
            result = service.delete_node(node_id)
            return json_response(result)
        except (KeyError, FileNotFoundError) as exc:
            return error_response(str(exc), status=404)

    return method_not_allowed(["PATCH", "DELETE"])


@csrf_exempt
def relationship_detail(request: HttpRequest, relationship_id: str) -> JsonResponse:
    service = GraphService()

    if request.method == "PATCH":
        try:
            payload = parse_json_body(request)
            properties = payload.get("properties", payload)
            result = service.patch_relationship(relationship_id, properties)
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

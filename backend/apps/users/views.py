import json
from json import JSONDecodeError
from typing import Any

from django.contrib.auth import authenticate, get_user_model
from django.contrib.auth.hashers import make_password
from django.db import IntegrityError, transaction
from django.http import HttpRequest, HttpResponseNotAllowed, JsonResponse
from django.utils import timezone
from django.utils.text import slugify
from django.views.decorators.csrf import csrf_exempt

from apps.choices import LifecycleStatus
from apps.graphs.models import GraphSpace
from apps.graphs.services.document_service import DocumentService
from apps.workspaces.models import Workspace


@csrf_exempt
def signup(request: HttpRequest) -> JsonResponse:
    if request.method != "POST":
        return HttpResponseNotAllowed(["POST"])

    try:
        payload = parse_json_body(request)
        username = clean_required(payload.get("username"), "Usuario")
        email = clean_required(payload.get("email"), "Email").lower()
        password = clean_required(payload.get("password"), "Contrasena")
        if len(password) < 6:
            raise ValueError("La contrasena debe tener al menos 6 caracteres.")

        user_model = get_user_model()
        if user_model.objects.filter(email__iexact=email).exists():
            raise ValueError("Ya existe una cuenta con ese usuario o email.")

        with transaction.atomic():
            user = user_model.objects.create_user(
                username=username,
                email=email,
                password=password,
                locale=str(payload.get("locale") or "es-MX"),
            )
        return json_response({"session": session_payload(user)}, status=201)
    except IntegrityError:
        return error_response("Ya existe una cuenta con ese usuario o email.", status=400)
    except (JSONDecodeError, ValueError) as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def login(request: HttpRequest) -> JsonResponse:
    if request.method != "POST":
        return HttpResponseNotAllowed(["POST"])

    try:
        payload = parse_json_body(request)
        identifier = clean_required(payload.get("username"), "Usuario").lower()
        password = clean_required(payload.get("password"), "Contrasena")
        user = find_user(identifier)
        authenticated = authenticate(
            request,
            username=user.get_username() if user else identifier,
            password=password,
        )
        if authenticated is None:
            raise ValueError("Usuario o contrasena incorrectos.")

        authenticated.last_login = timezone.now()
        authenticated.save(update_fields=["last_login"])
        return json_response({"session": session_payload(authenticated)})
    except (JSONDecodeError, ValueError) as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def sync_session(request: HttpRequest) -> JsonResponse:
    if request.method != "POST":
        return HttpResponseNotAllowed(["POST"])

    try:
        payload = parse_json_body(request)
        user_payload = payload.get("user") or {}
        if not isinstance(user_payload, dict):
            raise ValueError("User payload must be an object.")

        username = clean_required(user_payload.get("username"), "Usuario")
        email = str(user_payload.get("email") or "").strip().lower()
        password = str(payload.get("password") or "").strip()

        user = find_user(username.lower()) or (find_user(email) if email else None)
        if user is None:
            if not password:
                raise ValueError("No se pudo sincronizar la cuenta sin contrasena.")
            user = get_user_model().objects.create(
                username=username,
                email=email,
                password=make_password(password),
                locale=str(user_payload.get("locale") or "es-MX"),
            )
        elif password and not user.check_password(password):
            if is_guest_identity(username, email):
                user.password = make_password(password)
                user.save(update_fields=["password"])
            else:
                raise ValueError("Usuario o contrasena incorrectos.")

        return json_response({"session": session_payload(user)})
    except IntegrityError:
        return error_response("Ya existe una cuenta con ese usuario o email.", status=400)
    except (JSONDecodeError, ValueError) as exc:
        return error_response(str(exc), status=400)


@csrf_exempt
def account(request: HttpRequest) -> JsonResponse:
    if request.method != "DELETE":
        return HttpResponseNotAllowed(["DELETE"])

    try:
        user_id = str(request.headers.get("X-Lyceum-User-Id") or "").strip()
        workspace_id = str(request.headers.get("X-Lyceum-Workspace-Id") or "").strip()
        if not user_id or not workspace_id:
            raise ValueError("La cuenta y el workspace son requeridos.")

        user = get_user_model().objects.select_related("workspace").get(pk=user_id)
        if is_guest_identity(user.get_username(), user.email):
            raise ValueError("La cuenta huesped no se puede borrar.")

        workspace = user.workspace
        if str(workspace.pk) != workspace_id:
            raise ValueError("El workspace no corresponde a esta cuenta.")

        graph_refs = list(
            GraphSpace.objects.filter(
                workspace=workspace,
                status=LifecycleStatus.ACTIVE,
            ).values_list("graph_ref", flat=True),
        )
        service = DocumentService()
        deleted_documents = []
        for graph_ref in graph_refs:
            result = service.delete_document(graph_ref, workspace_id)
            deleted_documents.append(result.get("document_id", graph_ref))

        username = user.get_username()
        with transaction.atomic():
            user.delete()

        return json_response({
            "deleted": True,
            "deletedDocuments": deleted_documents,
            "username": username,
        })
    except get_user_model().DoesNotExist:
        return error_response("La cuenta no existe.", status=404)
    except ValueError as exc:
        return error_response(str(exc), status=400)


def find_user(identifier: str):
    if not identifier:
        return None
    user_model = get_user_model()
    return (
        user_model.objects.filter(username__iexact=identifier).first()
        or user_model.objects.filter(email__iexact=identifier).first()
    )


def session_payload(user) -> dict[str, Any]:
    workspace = ensure_workspace(user)
    return {
        "user": {
            "id": str(user.pk),
            "email": user.email,
            "firstName": user.first_name,
            "lastName": user.last_name,
            "locale": user.locale,
            "username": user.get_username(),
        },
        "workspace": {
            "id": str(workspace.pk),
            "createdAt": workspace.created_at.isoformat(),
            "defaultLanguage": workspace.default_language,
            "name": workspace.name,
            "ownerId": str(user.pk),
            "slug": workspace.slug,
            "status": workspace.status,
            "updatedAt": workspace.updated_at.isoformat(),
        },
    }


def ensure_workspace(user) -> Workspace:
    try:
        workspace = user.workspace
        if is_guest_identity(user.get_username(), user.email) and workspace.name != "Workspace huesped":
            workspace.name = "Workspace huesped"
            workspace.save(update_fields=["name", "updated_at"])
        return workspace
    except Workspace.DoesNotExist:
        base_slug = slugify(user.get_username() or user.email or str(user.pk)) or "workspace"
        slug = base_slug
        suffix = 2
        while Workspace.objects.filter(slug=slug).exists():
            slug = f"{base_slug}-{suffix}"
            suffix += 1
        username = user.get_username()
        display_name = user.get_full_name() or username or user.email or "Usuario"
        workspace_name = "Workspace huesped" if username.lower() == "huesped" else f"Workspace de {display_name}"
        return Workspace.objects.create(
            owner=user,
            name=workspace_name,
            slug=slug,
            default_language=getattr(user, "locale", "") or "es-MX",
        )


def is_guest_identity(username: str, email: str = "") -> bool:
    return username.strip().lower() == "huesped" or email.strip().lower() == "huesped@lyceum.local"


def parse_json_body(request: HttpRequest) -> dict[str, Any]:
    body = request.body.decode("utf-8") if request.body else "{}"
    payload = json.loads(body)
    if not isinstance(payload, dict):
        raise ValueError("JSON body must be an object.")
    return payload


def clean_required(value: Any, label: str) -> str:
    clean_value = str(value or "").strip()
    if not clean_value:
        raise ValueError(f"{label} es requerido.")
    return clean_value


def json_response(data: dict[str, Any], status: int = 200) -> JsonResponse:
    return JsonResponse(data, status=status, json_dumps_params={"ensure_ascii": False})


def error_response(message: str, status: int) -> JsonResponse:
    return json_response({"error": message}, status=status)

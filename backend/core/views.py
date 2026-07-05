from django.conf import settings
from django.http import FileResponse, Http404, HttpRequest


def frontend_app(_request: HttpRequest) -> FileResponse:
    index_path = settings.PROJECT_ROOT / "frontend" / "dist" / "index.html"
    if not index_path.exists():
        raise Http404("Frontend build not found")
    return FileResponse(index_path.open("rb"), content_type="text/html")

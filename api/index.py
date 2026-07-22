import os
import sys
from pathlib import Path

from django.conf import settings
from django.core.wsgi import get_wsgi_application
from django.core.management import call_command


PROJECT_ROOT = Path(__file__).resolve().parent.parent
BACKEND_DIR = PROJECT_ROOT / "backend"
for path in (BACKEND_DIR, PROJECT_ROOT):
    path_string = str(path)
    if path_string not in sys.path:
        sys.path.insert(0, path_string)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")

app = get_wsgi_application()


def prepare_vercel_sqlite_database() -> None:
    if not getattr(settings, "IS_VERCEL", False):
        return

    database_config = settings.DATABASES["default"]
    if "sqlite3" not in database_config.get("ENGINE", ""):
        return

    database_path = Path(database_config["NAME"])
    database_path.parent.mkdir(parents=True, exist_ok=True)
    marker_path = database_path.parent / ".migrated"
    if marker_path.exists():
        return

    call_command("migrate", interactive=False, verbosity=0)
    marker_path.write_text("ok\n", encoding="utf-8")


prepare_vercel_sqlite_database()
application = app

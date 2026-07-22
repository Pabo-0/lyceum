import os
import sys
from pathlib import Path

from django.core.wsgi import get_wsgi_application


PROJECT_ROOT = Path(__file__).resolve().parent.parent
BACKEND_DIR = PROJECT_ROOT / "backend"
for path in (BACKEND_DIR, PROJECT_ROOT):
    path_string = str(path)
    if path_string not in sys.path:
        sys.path.insert(0, path_string)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")

app = get_wsgi_application()
application = app

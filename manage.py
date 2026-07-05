#!/usr/bin/env python
import os
import sys
from pathlib import Path


def main() -> None:
    project_root = Path(__file__).resolve().parent
    backend_dir = project_root / "backend"
    for path in (backend_dir, project_root):
        path_string = str(path)
        if path_string not in sys.path:
            sys.path.insert(0, path_string)

    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)


if __name__ == "__main__":
    main()

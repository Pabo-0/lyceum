# Lyceum Backend

Django backend for the Lyceum MVP.

## Setup

From the project root:

```powershell
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements/dev.txt
```

## Environment

Local secrets live in:

```text
backend/.env
```

This file is ignored by Git. Use this versionable template when setting up another machine:

```text
backend/.env.example
```

## Commands

From `backend/`:

```powershell
python manage.py check
python manage.py migrate
python manage.py runserver
```

If running from the project root:

```powershell
python backend/manage.py check
python backend/manage.py migrate
python backend/manage.py runserver
```

## Current database

Django uses local SQLite for framework tables:

```text
backend/db.sqlite3
```

The knowledge graph is exported separately to Neo4j using the scripts in `scripts/`.

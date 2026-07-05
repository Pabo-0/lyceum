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
python manage.py test api
python manage.py runserver
```

If running from the project root:

```powershell
python backend/manage.py check
python backend/manage.py migrate
python backend/manage.py test api
python backend/manage.py runserver
```

## API endpoints

```text
POST   /documents/
GET    /documents/
GET    /documents/<document_id>/
PATCH  /documents/<document_id>/
DELETE /documents/<document_id>/
GET    /documents/<document_id>/graph/
POST   /documents/<document_id>/nodes/
POST   /documents/<document_id>/relationships/
POST   /documents/<document_id>/nodes/merge/
PATCH  /nodes/<node_id>/
PATCH  /relationships/<relationship_id>/
DELETE /nodes/<node_id>/
DELETE /relationships/<relationship_id>/
```

Example JSON document upload:

```json
{
  "filename": "calculo.md",
  "content": "# Calculo\n\n## Derivadas\n\nLa derivada mide la tasa de cambio."
}
```

## Current database

Django uses local SQLite for framework tables:

```text
backend/db.sqlite3
```

The knowledge graph is exported separately to Neo4j using the scripts in `scripts/`.

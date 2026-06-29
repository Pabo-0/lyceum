# Lyceum Frontend

React frontend for the Lyceum MVP.

## Setup

This project uses `pnpm` because it is available in the current development environment.

```powershell
cd frontend
pnpm install
```

## Environment

Local frontend settings live in:

```text
frontend/.env
```

This file is ignored by Git. Use this template for other machines:

```text
frontend/.env.example
```

Current variables:

```text
VITE_APP_NAME=Lyceum
VITE_API_BASE_URL=/api
VITE_BACKEND_URL=http://127.0.0.1:8000
VITE_DEV_PORT=5173
```

## Run

Start Django first from the project root:

```powershell
.\.venv\Scripts\Activate.ps1
python backend/manage.py runserver
```

Then start React:

```powershell
cd frontend
pnpm dev
```

Open:

```text
http://localhost:5173
```

The Vite dev server proxies `/api/*` to Django, so the frontend can call `/api/documents/` without CORS setup during local development.

## Features

- Document list from Django.
- Upload `.txt` or `.md` files into the processing pipeline.
- SVG graph visualization.
- Node colors and shapes by type.
- Relationship colors and line styles by type.
- Toggle paragraph/chunk visibility.
- Node and relationship detail panel.
- Centering on sections or paragraphs.

## Build

In an automated terminal without TTY:

```powershell
$env:CI = "true"
pnpm build
```

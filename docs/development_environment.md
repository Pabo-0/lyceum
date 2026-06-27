# Development environment

## Decision

Use one Python virtual environment at the project root:

```text
.venv/
```

This environment is for:

- `document_processing/`
- `analysis/`
- `scripts/`
- future Django backend code in `backend/`
- Python tests in `tests/`

The React frontend should keep its own Node environment inside `frontend/` when it is created:

```text
frontend/package.json
frontend/node_modules/
```

## Why one Python venv

The current Python modules are part of the same pipeline. The backend will call the same processing and graph modules, so a single Python environment keeps imports, testing and dependency versions consistent.

Separate Python environments can be added later if the backend and data analysis become independent deployable services.

## Create the venv

From the project root:

```powershell
python -m venv .venv
```

If Windows does not recognize `python`, use the Python runtime already available in this workspace:

```powershell
& 'C:\Users\PABLO\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' -m venv .venv
```

## Activate it

PowerShell:

```powershell
.\.venv\Scripts\Activate.ps1
```

After activation, `python` should point to:

```text
.venv\Scripts\python.exe
```

## Install dependencies

Current development dependencies:

```powershell
python -m pip install -r requirements/dev.txt
```

This installs the current Python pipeline and backend dependencies.

Optional Neo4j loader dependency:

```powershell
python -m pip install -r requirements/neo4j.txt
```

Future Django backend dependencies will be added to:

```text
requirements/backend.txt
```

## VS Code

Select this interpreter:

```text
.\.venv\Scripts\python.exe
```

Then the Run button should execute scripts and tests with the same environment used by the terminal.

## Verify

```powershell
python -B -m unittest tests.test_text_normalizer tests.test_structural_segmenter tests.test_document_store tests.test_text_chunker tests.test_concept_extractor tests.test_concept_deduplicator tests.test_semantic_relationship_builder tests.test_graph_builder tests.test_neo4j_cypher
```

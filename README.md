# Lyceum

MVP inicial para convertir documentos educativos de texto en una estructura lista para analisis y, mas adelante, grafos de conocimiento.

## Entorno Python

El proyecto usa un solo entorno virtual de Python en la raiz:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements/dev.txt
```

En VS Code selecciona el interprete:

```text
.\.venv\Scripts\python.exe
```

El frontend de React se mantiene separado con su propio entorno Node dentro de `frontend/` cuando se active.

Mas detalles: `docs/development_environment.md`.

## Fases actuales

- Fase 1: alcance inicial limitado a `.txt` y `.md`.
- Fase 2: ingesta local con preservacion del contenido original.
- Fase 3: normalizacion del texto.
- Fase 4: segmentacion estructural en secciones, subsecciones y chunks.
- Fase 5: chunking con limite de palabras por fragmento.
- Fase 6: extraccion de conceptos con NLP clasico.
- Fase 7: normalizacion y deduplicacion de conceptos.
- Fase 8: construccion del grafo inicial.
- Fase 9: relaciones semanticas candidatas.
- Fase 10: persistencia en Neo4j via Cypher.
- Fase 11: API Django para documentos, grafo y edicion basica.

## Comandos utiles

```powershell
python scripts/ingest_test_documents.py
python analysis/dev_dataset_report.py
python analysis/structure_report.py
python analysis/concept_report.py
python analysis/semantic_relationship_report.py
python analysis/graph_report.py
python scripts/export_neo4j_cypher.py
python -B -m unittest tests.test_text_normalizer tests.test_structural_segmenter tests.test_document_store tests.test_text_chunker tests.test_concept_extractor tests.test_concept_deduplicator tests.test_semantic_relationship_builder tests.test_graph_builder tests.test_neo4j_cypher
python backend/manage.py test api
```

Si Windows no reconoce `python`, puedes usar el Python incluido por Codex:

```powershell
& 'C:\Users\PABLO\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' scripts/ingest_test_documents.py
```

## Persistencia local

El indice de documentos vive en `data/storage/documents.json`.

Los atributos completos de cada documento se guardan por separado en:

```text
data/storage/documents/<document_id>/
```

## Neo4j

El grafo local se traduce a Cypher sin requerir una base Neo4j activa:

```powershell
python scripts/export_neo4j_cypher.py
```

La salida agregada queda en:

```text
data/storage/neo4j/all_documents.cypher
```

Para cargarlo en Neo4j:

```powershell
$env:NEO4J_URI = "bolt://localhost:7687"
$env:NEO4J_USER = "neo4j"
$env:NEO4J_PASSWORD = "tu_password"
python scripts/load_neo4j.py
```

## Backend Django

El backend vive en `backend/` y usa `core` como proyecto principal.

```powershell
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements/dev.txt
python backend/manage.py check
python backend/manage.py migrate
python backend/manage.py runserver
```

Los secretos locales estan en `backend/.env`, que esta ignorado por Git. La plantilla versionable es `backend/.env.example`.

Endpoints MVP:

```text
POST   /documents/
GET    /documents/
GET    /documents/<document_id>/
GET    /documents/<document_id>/graph/
PATCH  /nodes/<node_id>/
PATCH  /relationships/<relationship_id>/
DELETE /nodes/<node_id>/
DELETE /relationships/<relationship_id>/
```

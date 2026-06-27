# Fase 11: API con Django

## Objetivo

Exponer el procesamiento y consulta del grafo mediante una API JSON.

Django funciona como capa de negocio:

- recibe documentos `.txt` o `.md`
- ejecuta el pipeline de procesamiento
- guarda resultados en `data/storage`
- regenera Cypher para Neo4j
- sincroniza con Neo4j si esta configurado
- expone datos para el futuro frontend de React

## Endpoints

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

## Crear documento

JSON:

```http
POST /documents/
Content-Type: application/json
```

```json
{
  "filename": "calculo.md",
  "content": "# Calculo\n\n## Derivadas\n\nLa derivada mide la tasa de cambio."
}
```

Tambien acepta `multipart/form-data` con un archivo en el campo `file`.

## Consultar documentos

```http
GET /documents/
```

Devuelve el indice liviano de documentos.

```http
GET /documents/<document_id>/
```

Devuelve el documento procesado completo desde los JSON locales.

```http
GET /documents/<document_id>/graph/
```

Devuelve solo el grafo serializable:

- `nodes`
- `relationships`
- conteos por label
- conteos por tipo de relacion

## Editar grafo

Los endpoints de edicion modifican `graph.json`, regeneran `neo4j.cypher` y actualizan el export global en `data/storage/neo4j`.

```http
PATCH /nodes/<node_id>/
```

```json
{
  "properties": {
    "frontend_label": "Concepto principal"
  }
}
```

```http
PATCH /relationships/<relationship_id>/
```

```json
{
  "properties": {
    "confidence": 0.91,
    "status": "reviewed"
  }
}
```

## Eliminar del grafo

```http
DELETE /nodes/<node_id>/
DELETE /relationships/<relationship_id>/
```

Eliminar un nodo tambien elimina sus relaciones conectadas dentro del `graph.json` local.

## Neo4j

La API usa:

```text
backend/api/services/neo4j_gateway.py
```

Por defecto no intenta sincronizar automaticamente para que el backend funcione aunque Neo4j no este prendido.

Para activar sincronizacion durante `POST /documents/`:

```env
NEO4J_SYNC_ON_INGEST=True
NEO4J_PASSWORD=tu_password_local
```

Si Neo4j no esta disponible, la API conserva el resultado local y devuelve un estado `neo4j_sync` con el error.

## Archivos principales

```text
backend/api/views.py
backend/api/urls.py
backend/api/services/document_service.py
backend/api/services/graph_service.py
backend/api/services/neo4j_gateway.py
backend/api/tests.py
```

## Decision clave

El grafo editable de esta fase vive en `graph.json`. Los archivos previos del pipeline, como `concepts.json`, `structure.json` y `semantic_relationships.json`, se conservan como evidencia del procesamiento original.

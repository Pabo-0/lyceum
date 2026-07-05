# Fase 13: Edicion manual del grafo

## Objetivo

Permitir que el usuario corrija y refine el grafo generado automaticamente.

El MVP no necesita inferir todo correctamente. Necesita producir una primera version util y editable.

## Funciones implementadas

- Alternar desde el canvas entre:
  - `Lectura`: seleccionar y leer nodos.
  - `Estilo`: arrastrar nodos para acomodar visualmente el grafo sin modificar la estructura original.
  - `Edicion`: crear, modificar y borrar elementos desde popups sobre el grafo.
- Renombrar nodos.
- Cambiar tipo de nodo entre `Section`, `Chunk` y `Concept`.
- Editar el contenido textual de nodos.
- Crear nodos manuales:
  - `Section`
  - `Chunk`
  - `Concept`
- Eliminar nodos manuales o incorrectos.
- Fusionar un nodo dentro de otro.
- Crear relaciones manuales entre nodos existentes arrastrando desde un nodo hacia otro.
- Crear nodos conectados arrastrando desde un nodo hacia un espacio vacio.
- Crear nodos sueltos con click en un espacio vacio.
- Cambiar tipo de relacion.
- Confirmar, marcar como candidata o rechazar una relacion.
- Eliminar relaciones falsas.

## Endpoints nuevos

```text
POST /documents/<document_id>/nodes/
POST /documents/<document_id>/relationships/
POST /documents/<document_id>/nodes/merge/
```

Endpoints existentes que ahora tambien soportan la fase:

```text
PATCH  /nodes/<node_id>/
DELETE /nodes/<node_id>/
PATCH  /relationships/<relationship_id>/
DELETE /relationships/<relationship_id>/
```

## Tipos manuales

Nodos persistibles:

```text
Document
Section
Chunk
Concept
```

Relaciones persistibles:

```text
DIRECTIONAL
BIDIRECTIONAL
SEMANTIC
```

`DIRECTIONAL` se dibuja con una flecha simple, `BIDIRECTIONAL` con doble flecha y `SEMANTIC` con linea punteada. Las relaciones estructurales del pipeline conservan su funcion en `properties.role`, por ejemplo `contains_section` o `contains_chunk`, pero el usuario no ve una lista larga de etiquetas tecnicas.

## Decision clave

El modo lectura conserva una experiencia limpia para leer el grafo. El modo estilo permite acomodar visualmente nodos como preferencia local del usuario. El modo edicion usa popups pequeños para acciones inmediatas y un dialogo grande para modificar datos, evitando un panel lateral permanente.

Las ediciones se guardan en `graph.json`, regeneran `neo4j.cypher` y actualizan el export global de Neo4j. Los archivos de analisis originales, como `structure.json`, `concepts.json` y `semantic_relationships.json`, se conservan como evidencia del pipeline automatico.

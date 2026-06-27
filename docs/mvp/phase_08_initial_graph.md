# Fase 8: Construccion del grafo inicial

## Objetivo

Transformar la estructura procesada en nodos y relaciones listas para persistirse mas adelante en Neo4j.

## Nodos

- `Document`
- `Section`
- `Chunk`
- `Concept`

## Relaciones

- `Document HAS_SECTION Section`
- `Section HAS_SUBSECTION Section`
- `Section HAS_CHUNK Chunk`
- `Chunk MENTIONS Concept`
- `Section MENTIONS Concept`

## Salida

Cada documento guarda:

```text
data/storage/documents/<document_id>/graph.json
```

El archivo contiene:

- `nodes`
- `relationships`
- `node_count`
- `relationship_count`
- `node_counts_by_label`
- `relationship_counts_by_type`

## Decision clave

Esta fase no escribe todavia en Neo4j. Construye una representacion serializable y verificable del grafo para que la persistencia en base de datos sea una fase separada.

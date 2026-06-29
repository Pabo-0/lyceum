# Fase 8: Construccion del grafo inicial

## Objetivo

Transformar la estructura procesada en nodos y relaciones listas para persistirse mas adelante en Neo4j.

## Nodos

- `Document`
- `Section`
- `Chunk`

## Relaciones

- `Document HAS_SECTION Section`
- `Section HAS_SUBSECTION Section`
- `Section HAS_CHUNK Chunk`

Los conceptos extraidos se guardan en archivos separados de analisis, pero no entran en el `graph.json` visible del MVP.

Los nodos `Chunk` si incluyen un `title` breve extraido de senales locales del texto. Ese titulo sirve solo para orientar al usuario en el grafo; no convierte la palabra clave en nodo ni crea relaciones semanticas visibles.

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

En cada nodo `Chunk`, las propiedades principales para la interfaz son:

- `title`
- `title_source`
- `title_reason`
- `title_candidates`
- `text`
- `word_count`

## Decision clave

Esta fase no escribe todavia en Neo4j. Construye una representacion serializable y verificable del grafo para que la persistencia en base de datos sea una fase separada.

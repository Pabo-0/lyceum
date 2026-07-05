# Fase 8: Construccion del grafo inicial

## Objetivo

Transformar la estructura procesada en nodos y relaciones listas para persistirse mas adelante en Neo4j.

## Nodos

- `Document`
- `Section`
- `Chunk`

## Relaciones

- `Document DIRECTIONAL Section`, con `role: contains_section`
- `Section DIRECTIONAL Section`, con `role: contains_subsection`
- `Section DIRECTIONAL Chunk`, con `role: contains_chunk`

Los conceptos extraidos se guardan en archivos separados de analisis, pero no entran en el `graph.json` visible del MVP.

Los nodos `Chunk` si incluyen un `title` breve extraido de senales locales del texto. Ese titulo sirve solo para orientar al usuario en el grafo; no convierte la palabra clave en nodo ni crea relaciones semanticas visibles.

## Compactacion del grafo visible

El `structure.json` conserva la segmentacion detallada detectada en el documento. El `graph.json`, en cambio, es una vista compacta para lectura.

Reglas actuales:

- Si el documento tiene demasiados encabezados para su tamano, se agrupan secciones cercanas en bloques visibles.
- Las subsecciones profundas se conservan como metadatos (`source_section_ids`, `source_section_titles`), pero no siempre se convierten en nodos.
- Los parrafos pequenos se agrupan en chunks de lectura mas grandes, con objetivo aproximado de `DEFAULT_GRAPH_CHUNK_TARGET_WORDS`.
- Cada nodo visible conserva trazabilidad hacia los chunks y secciones originales.
- El crecimiento del grafo debe ser proporcional al texto: en documentos largos crecen principalmente los chunks de contenido, no los nodos de tema.

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
- `source_chunk_ids`
- `source_chunk_count`
- `source_section_ids`
- `source_section_titles`

## Decision clave

Esta fase no escribe todavia en Neo4j. Construye una representacion serializable y verificable del grafo para que la persistencia en base de datos sea una fase separada.

La decision de producto es que el grafo del MVP debe ayudar a leer, no reproducir cada detalle estructural. El detalle completo queda disponible en los JSON de analisis.

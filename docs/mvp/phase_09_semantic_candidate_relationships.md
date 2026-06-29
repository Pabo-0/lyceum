# Fase 9: Relaciones semanticas candidatas

## Objetivo

Crear conexiones automaticas iniciales entre conceptos relacionados.

## Relaciones

- `RELATED_TO`
- `PREREQUISITE_CANDIDATE`

## Metodos actuales

- `chunk_cooccurrence`: conceptos mencionados en el mismo chunk.
- `section_cooccurrence`: conceptos mencionados en la misma seccion.
- `tfidf_chunk_vector_similarity`: conceptos con patrones de menciones similares entre chunks.
- `order_of_appearance`: un concepto mas general aparece antes que otro concepto.
- `title_subtitle_hierarchy`: conceptos de una seccion padre conectados con conceptos de una subseccion.

## Propiedades

Cada relacion candidata guarda:

- `weight`
- `confidence`
- `method`
- `source`
- `reason`
- `evidence`

## Salida

Cada documento guarda:

```text
data/storage/documents/<document_id>/semantic_relationships.json
```

Estas relaciones ya no se incorporan al `graph.json` visible del MVP. Se conservan como salida de analisis para futuras capas semanticas.

## Decision clave

Estas relaciones no son definitivas. Para evitar sobrecargar al usuario, quedan fuera de la visualizacion principal hasta que exista una experiencia clara para revisarlas, confirmarlas o eliminarlas.

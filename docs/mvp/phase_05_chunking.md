# Fase 5: Chunking

## Objetivo

Dividir contenido largo en fragmentos moderados para que las fases de analisis puedan trabajar por unidades pequenas y trazables.

## Incluido

- Cada parrafo corto se conserva como un chunk.
- Cada parrafo largo se divide en chunks con limite de palabras.
- La division intenta respetar oraciones cuando hay puntuacion.
- Si una oracion es demasiado larga, se divide por palabras.
- Cuando se divide un parrafo largo, se balancea la ultima parte para evitar fragmentos desproporcionados, por ejemplo un chunk grande seguido de una cola minima.
- Cada chunk conserva:
  - `chunk_id`
  - `parent_section_id`
  - `order`
  - `start_line`
  - `end_line`
  - `word_count`
  - `character_count`
  - `chunk_type`

## Configuracion

El limite por defecto vive en `document_processing/config.py`:

```python
DEFAULT_CHUNK_MAX_WORDS = 120
```

## Decision clave

El chunking ocurre despues de la normalizacion y durante la segmentacion estructural. Asi cada chunk ya queda asociado a su seccion de origen y listo para extraccion de conceptos.

Los nombres visibles de los chunks no se guardan aqui como nodos nuevos. Se generan despues, durante la construccion del grafo, como metadatos de presentacion del nodo `Chunk`.

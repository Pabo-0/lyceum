# Fase 4: Segmentacion estructural

## Objetivo

Detectar la estructura basica del documento normalizado para obtener `Section`, `Subsection` y `ParagraphChunk`.

## Incluido

- Encabezados Markdown: `#`, `##`, `###`.
- Encabezados numerados: `1.`, `1.1`, `2.3`.
- Numeracion dentro de encabezados Markdown, por ejemplo `## 1.1 Tema`, para inferir subsecciones aunque el nivel Markdown no cambie.
- Encabezados por palabras clave como `Introduccion`, `Resumen`, `Conclusion`.
- Primera linea corta como titulo del documento cuando no hay Markdown.
- Parrafos asociados a la seccion activa.
- Chunks huerfanos si aparecen parrafos antes de cualquier seccion.

## Salida

Cada documento ingerido guarda un bloque `structure` dentro de `data/storage/documents.json`:

- `sections`
- `orphan_chunks`
- `section_count`
- `subsection_count`
- `chunk_count`

Cada seccion contiene:

- `section_id`
- `parent_section_id`
- `title`
- `level`
- `heading_type`
- `numbering`
- `chunks`

## Decision clave

Esta fase todavia no interpreta conceptos. Solo prepara unidades estructurales limpias para que las siguientes fases puedan extraer conceptos por seccion o chunk.

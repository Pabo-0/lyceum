# Fase 3: Normalizacion del texto

## Objetivo

Crear una version estable del contenido para que las siguientes fases puedan analizar documentos con menos ruido, sin perder nunca el texto original.

## Incluido

- Normalizacion de saltos de linea Windows, Unix y antiguos Mac.
- Normalizacion Unicode con `NFKC`.
- Eliminacion de caracteres de control problematicos.
- Limpieza de espacios y tabulaciones repetidas.
- Conservacion de saltos dobles entre parrafos.
- Guardado de `original_content` y `normalized_content`.
- Reporte basico de normalizacion.

## Salidas

- `data/storage/documents.json`
- `data/storage/originals/<document_id>.txt`
- `data/storage/normalized/<document_id>.txt`

## Decision clave

Los metadatos de conteo se calculan sobre `normalized_content`, porque ese sera el texto usado por segmentacion, chunking y extraccion de conceptos. El contenido original se conserva como evidencia y para futuras revisiones manuales.

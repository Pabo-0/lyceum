# Fase 7: Normalizacion y deduplicacion de conceptos

## Objetivo

Agrupar conceptos extraidos que representan la misma idea con pequenas variaciones.

## Incluido

- Conversion a minusculas.
- Limpieza de acentos, puntuacion y espacios.
- Eliminacion de stopwords y terminos genericos.
- Limpieza de prefijos como `concepto de`, `tema de` o `idea de`.
- Singularizacion simple de plurales frecuentes.
- Agrupacion por clave canonica.
- Preservacion de variantes y conceptos crudos originales.
- Remapeo de menciones hacia conceptos canonicos.

## Salidas

Cada documento guarda:

```text
data/storage/documents/<document_id>/
  canonical_concepts.json
  normalized_concept_mentions.json
  concept_deduplication_summary.json
```

`concepts.json` y `concept_mentions.json` siguen existiendo como salida cruda de fase 6.

## Decision clave

La deduplicacion es conservadora. No fusiona conceptos por similitud difusa todavia, porque eso podria unir conceptos distintos antes de tener revision manual.

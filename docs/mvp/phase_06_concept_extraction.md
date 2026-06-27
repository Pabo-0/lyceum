# Fase 6: Extraccion de conceptos

## Objetivo

Extraer conceptos candidatos desde secciones y chunks usando NLP clasico, sin LLMs.

## Tecnicas incluidas

- Stopwords en espanol.
- Limpieza y normalizacion de terminos.
- N-gramas de 1 a 3 palabras.
- Frecuencia por chunk.
- TF-IDF usando chunks como documentos internos.
- Filtros para terminos demasiado genericos.
- Menciones por chunk.

## Salidas

Cada documento guarda:

```text
data/storage/documents/<document_id>/
  concepts.json
  concept_mentions.json
  concept_extraction_summary.json
```

`concepts.json` contiene conceptos agregados por documento.

`concept_mentions.json` contiene relaciones candidatas entre chunks y conceptos:

```text
Chunk MENTIONS Concept
```

## Estado del pipeline

Despues de esta fase, `processing_status` queda como:

```text
concepts_extracted
```

## Decision clave

Esta fase no crea relaciones entre conceptos todavia. Solo detecta conceptos y menciones. Las relaciones semanticas candidatas se construiran mejor cuando los conceptos ya esten deduplicados y normalizados.

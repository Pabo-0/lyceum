# Storage layout

La persistencia local usa un indice liviano y una carpeta por documento.

## Indice

`data/storage/documents.json` contiene solo datos minimos para listar documentos:

- `document_id`
- `title`
- `source_path`
- `source_extension`
- `processing_status`
- rutas a archivos del documento

## Carpeta por documento

Cada documento vive en:

```text
data/storage/documents/<document_id>/
  manifest.json
  metadata.json
  normalization_report.json
  structure.json
  concepts.json
  concept_mentions.json
  concept_extraction_summary.json
  canonical_concepts.json
  normalized_concept_mentions.json
  concept_deduplication_summary.json
  semantic_relationships.json
  graph.json
  original.txt
  normalized.txt
```

Esta separacion evita que un solo JSON crezca demasiado cuando los documentos sean largos.

## Compatibilidad

Durante el desarrollo se siguen guardando copias de texto en:

- `data/storage/originals/`
- `data/storage/normalized/`

Estas carpetas son convenientes para inspeccion rapida, pero la fuente organizada por documento es `data/storage/documents/<document_id>/`.

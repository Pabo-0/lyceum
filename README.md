# Lyceum

MVP inicial para convertir documentos educativos de texto en una estructura lista para analisis y, mas adelante, grafos de conocimiento.

## Fases actuales

- Fase 1: alcance inicial limitado a `.txt` y `.md`.
- Fase 2: ingesta local con preservacion del contenido original.
- Fase 3: normalizacion del texto.
- Fase 4: segmentacion estructural en secciones, subsecciones y chunks.
- Fase 5: chunking con limite de palabras por fragmento.
- Fase 6: extraccion de conceptos con NLP clasico.
- Fase 7: normalizacion y deduplicacion de conceptos.
- Fase 8: construccion del grafo inicial.
- Fase 9: relaciones semanticas candidatas.

## Comandos utiles

```powershell
python scripts/ingest_test_documents.py
python analysis/dev_dataset_report.py
python analysis/structure_report.py
python analysis/concept_report.py
python analysis/semantic_relationship_report.py
python analysis/graph_report.py
python -B -m unittest tests.test_text_normalizer tests.test_structural_segmenter tests.test_document_store tests.test_text_chunker tests.test_concept_extractor tests.test_concept_deduplicator tests.test_semantic_relationship_builder tests.test_graph_builder
```

Si Windows no reconoce `python`, puedes usar el Python incluido por Codex:

```powershell
& 'C:\Users\PABLO\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe' scripts/ingest_test_documents.py
```

## Persistencia local

El indice de documentos vive en `data/storage/documents.json`.

Los atributos completos de cada documento se guardan por separado en:

```text
data/storage/documents/<document_id>/
```

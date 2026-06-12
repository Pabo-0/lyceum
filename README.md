# Lyceum

MVP inicial para convertir documentos educativos de texto en una estructura lista para analisis y, mas adelante, grafos de conocimiento.

## Fases actuales

- Fase 1: alcance inicial limitado a `.txt` y `.md`.
- Fase 2: ingesta local con preservacion del contenido original.
- Fase 3: normalizacion del texto.
- Fase 4: segmentacion estructural en secciones, subsecciones y chunks.

## Comandos utiles

```powershell
python scripts/ingest_test_documents.py
python analysis/dev_dataset_report.py
python analysis/structure_report.py
python -B -m unittest tests.test_text_normalizer tests.test_structural_segmenter
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

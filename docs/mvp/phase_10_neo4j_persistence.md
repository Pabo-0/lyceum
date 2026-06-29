# Fase 10: Persistencia en Neo4j

## Objetivo

Traducir el `graph.json` local a Cypher para poder guardar el grafo en Neo4j.

Esta fase no cambia la fuente de verdad del MVP: por ahora el documento sigue procesandose localmente y se guarda como JSON modular. Neo4j aparece como una salida persistible y consultable para Django y React.

## Modelo guardado

Nodos:

- `Document`
- `Section`
- `Chunk`

Relaciones estructurales:

- `Document` - `HAS_SECTION` -> `Section`
- `Section` - `HAS_SUBSECTION` -> `Section`
- `Section` - `HAS_CHUNK` -> `Chunk`

Los conceptos y relaciones semanticas se conservan como archivos de analisis, pero no se persisten en el grafo MVP de Neo4j porque generan ruido visual antes de tener una capa semantica confiable.

## Archivos principales

```text
document_processing/neo4j_cypher.py
```

Genera Cypher desde el grafo serializable. Sus funciones principales son:

- `build_neo4j_schema_cypher()`: crea constraints e indices basicos.
- `build_neo4j_verification_cypher()`: crea consultas de verificacion.
- `graph_to_cypher()`: convierte nodos y relaciones de `graph.json` en sentencias `MERGE`.
- `split_cypher_statements()`: separa sentencias Cypher sin romper textos que tengan punto y coma.

```text
scripts/export_neo4j_cypher.py
```

Lee todos los documentos almacenados y genera:

```text
data/storage/neo4j/schema.cypher
data/storage/neo4j/all_documents.cypher
data/storage/neo4j/verification_queries.cypher
```

```text
scripts/load_neo4j.py
```

Carga `all_documents.cypher` en una base Neo4j real usando el driver oficial de Python.

## Salida por documento

Cada documento ahora guarda tambien:

```text
data/storage/documents/<document_id>/neo4j.cypher
```

Este archivo contiene solo el grafo de ese documento. Sirve para inspeccion, debug o cargas selectivas.

## Configuracion para cargar Neo4j

Variables de entorno:

```powershell
$env:NEO4J_URI = "bolt://localhost:7687"
$env:NEO4J_USER = "neo4j"
$env:NEO4J_PASSWORD = "tu_password"
```

Comandos:

```powershell
python scripts/export_neo4j_cypher.py
python scripts/load_neo4j.py
```

Si falta el driver:

```powershell
pip install neo4j
```

## Consultas utiles

Plantillas Cypher para Django/React:

```text
database/neo4j/frontend_queries.cypher
database/neo4j/verification_queries.cypher
```

## Decision clave

La persistencia en Neo4j se mantiene como una capa separada. Esto evita acoplar el procesamiento de documentos a una base externa y permite seguir probando el MVP aunque Neo4j no este instalado.

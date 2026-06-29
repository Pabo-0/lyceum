MERGE (n:Document {node_id: "document:e17459b81e02abbb"})
SET n:Document
SET n += {document_id: "e17459b81e02abbb", node_id: "document:e17459b81e02abbb", paragraph_count: 5, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/chunking_texto_largo.md", title: "Estrategias de aprendizaje autorregulado", word_count: 177};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-2", numbering: "1", order: 2, section_id: "section-2", start_line: 3, title: "1. Planificacion"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:chunk-1"})
SET n:Chunk
SET n += {character_count: 339, chunk_id: "chunk-1", chunk_type: "split_paragraph", end_line: 5, node_id: "chunk:e17459b81e02abbb:chunk-1", order: 1, start_line: 5, text: "La planificacion del aprendizaje comienza cuando el estudiante identifica una meta concreta, revisa los recursos disponibles y decide una secuencia de acciones para avanzar. Esta etapa incluye reconocer conocimientos previos, anticipar dificultades, estimar el tiempo necesario y seleccionar estrategias de lectura, practica o explicacion.", title: "Planificacion del aprendizaje", title_candidates: ["planificacion aprendizaje", "identifica meta concreta", "meta concreta revisa", "concreta revisa recursos", "revisa recursos disponibles"], title_reason: "Selected as the clearest local cue for a paragraph fragment created by the chunk size limit.", title_source: "local_ngram", word_count: 44};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:chunk-2"})
SET n:Chunk
SET n += {character_count: 629, chunk_id: "chunk-2", chunk_type: "split_paragraph", end_line: 5, node_id: "chunk:e17459b81e02abbb:chunk-2", order: 2, start_line: 5, text: "Cuando la planificacion es clara, el estudiante puede comparar su progreso con una intencion inicial y ajustar el esfuerzo antes de llegar al final de la actividad. En materiales educativos extensos, esta habilidad ayuda a dividir un tema grande en partes manejables, relacionar conceptos nuevos con conceptos conocidos y evitar que toda la informacion se procese como un bloque unico. La planificacion tambien permite detectar prerequisitos, ordenar actividades y construir una ruta de estudio mas estable. Si el texto es demasiado largo, conviene partirlo en fragmentos pequenos para conservar contexto sin saturar el analisis.", title: "Planificacion clara", title_candidates: ["planificacion clara", "comparar progreso intencion", "progreso intencion inicial", "intencion inicial ajustar", "inicial ajustar esfuerzo"], title_reason: "Selected as the clearest local cue for a paragraph fragment created by the chunk size limit.", title_source: "local_ngram", word_count: 94};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-3", numbering: "2", order: 3, section_id: "section-3", start_line: 7, title: "2. Monitoreo"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:chunk-3"})
SET n:Chunk
SET n += {character_count: 208, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 9, node_id: "chunk:e17459b81e02abbb:chunk-3", order: 3, start_line: 9, text: "El monitoreo ocurre durante la actividad. El estudiante observa si entiende, si puede explicar una idea con sus propias palabras y si los ejemplos resueltos realmente coinciden con el procedimiento estudiado.", title: "Explicar propias palabras", title_candidates: ["explicar propias palabras", "explicar propias", "propias palabras", "ejemplos resueltos", "procedimiento estudiado"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 31};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-2"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:c4f82c22d81696b3"}]->(target)
SET r += {order: 2, relationship_id: "relationship:c4f82c22d81696b3"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:2dafac2274a28252"}]->(target)
SET r += {order: 1, relationship_id: "relationship:2dafac2274a28252"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:b8901fbcd299209c"}]->(target)
SET r += {order: 2, relationship_id: "relationship:b8901fbcd299209c"};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-3"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:350ead94be5aa24e"}]->(target)
SET r += {order: 3, relationship_id: "relationship:350ead94be5aa24e"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:21a09faa98cf3bd3"}]->(target)
SET r += {order: 3, relationship_id: "relationship:21a09faa98cf3bd3"};

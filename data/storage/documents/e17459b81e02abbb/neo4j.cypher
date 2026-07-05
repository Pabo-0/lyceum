MERGE (n:Document {node_id: "document:e17459b81e02abbb"})
SET n:Document
SET n += {document_id: "e17459b81e02abbb", max_visible_sections: 2, node_id: "document:e17459b81e02abbb", paragraph_count: 5, processing_status: "neo4j_export_ready", reading_graph_compaction: "preserve_detected_sections", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/chunking_texto_largo.md", title: "Prueba 1", visible_chunk_count: 2, visible_section_count: 2, word_count: 177};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-2"})
SET n:Section
SET n += {compaction_method: "preserved_section", end_line: 5, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-2", numbering: "1", order: 2, section_id: "section-2", source_section_count: 1, source_section_ids: ["section-2"], source_section_titles: ["1. Planificacion"], start_line: 3, title: "1. Planificacion"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:graph-chunk-1"})
SET n:Chunk
SET n += {character_count: 970, chunk_id: "graph-chunk-1", chunk_type: "merged_paragraphs", end_line: 5, node_id: "chunk:e17459b81e02abbb:graph-chunk-1", order: 1, source_chunk_count: 2, source_chunk_ids: ["chunk-1", "chunk-2"], source_section_count: 1, source_section_ids: ["section-2"], source_section_titles: ["1. Planificacion"], start_line: 5, text: "La planificacion del aprendizaje comienza cuando el estudiante identifica una meta concreta, revisa los recursos disponibles y decide una secuencia de acciones para avanzar. Esta etapa incluye reconocer conocimientos previos, anticipar dificultades, estimar el tiempo necesario y seleccionar estrategias de lectura, practica o explicacion.\n\nCuando la planificacion es clara, el estudiante puede comparar su progreso con una intencion inicial y ajustar el esfuerzo antes de llegar al final de la actividad. En materiales educativos extensos, esta habilidad ayuda a dividir un tema grande en partes manejables, relacionar conceptos nuevos con conceptos conocidos y evitar que toda la informacion se procese como un bloque unico. La planificacion tambien permite detectar prerequisitos, ordenar actividades y construir una ruta de estudio mas estable. Si el texto es demasiado largo, conviene partirlo en fragmentos pequenos para conservar contexto sin saturar el analisis.", title: "Planificacion del aprendizaje", title_candidates: ["planificacion aprendizaje", "identifica meta concreta", "meta concreta revisa", "concreta revisa recursos", "revisa recursos disponibles"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 138};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-3"})
SET n:Section
SET n += {compaction_method: "preserved_section", end_line: 9, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-3", numbering: "2", order: 3, section_id: "section-3", source_section_count: 1, source_section_ids: ["section-3"], source_section_titles: ["2. Monitoreo"], start_line: 7, title: "2. Monitoreo"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:graph-chunk-2"})
SET n:Chunk
SET n += {character_count: 208, chunk_id: "graph-chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:e17459b81e02abbb:graph-chunk-2", order: 2, source_chunk_count: 1, source_chunk_ids: ["chunk-3"], source_section_count: 1, source_section_ids: ["section-3"], source_section_titles: ["2. Monitoreo"], start_line: 9, text: "El monitoreo ocurre durante la actividad. El estudiante observa si entiende, si puede explicar una idea con sus propias palabras y si los ejemplos resueltos realmente coinciden con el procedimiento estudiado.", title: "Explicar propias palabras", title_candidates: ["explicar propias palabras", "explicar propias", "propias palabras", "ejemplos resueltos", "procedimiento estudiado"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 31};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c4f82c22d81696b3"}]->(target)
SET r += {order: 2, relationship_id: "relationship:c4f82c22d81696b3", role: "contains_section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:graph-chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d9ad2f149b6369d2"}]->(target)
SET r += {order: 1, relationship_id: "relationship:d9ad2f149b6369d2", role: "contains_chunk"};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:350ead94be5aa24e"}]->(target)
SET r += {order: 3, relationship_id: "relationship:350ead94be5aa24e", role: "contains_section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:graph-chunk-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b95fa2c83bed9641"}]->(target)
SET r += {order: 2, relationship_id: "relationship:b95fa2c83bed9641", role: "contains_chunk"};

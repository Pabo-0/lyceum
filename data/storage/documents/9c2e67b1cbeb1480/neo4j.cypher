MERGE (n:Document {node_id: "document:9c2e67b1cbeb1480"})
SET n:Document
SET n += {document_id: "9c2e67b1cbeb1480", node_id: "document:9c2e67b1cbeb1480", paragraph_count: 11, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/algebra_lineal.md", title: "Algebra lineal para vectores", word_count: 117};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "markdown", level: 2, node_id: "section:9c2e67b1cbeb1480:section-2", numbering: "1", order: 2, section_id: "section-2", start_line: 3, title: "1. Introduccion"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
SET n:Chunk
SET n += {character_count: 162, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:9c2e67b1cbeb1480:chunk-1", order: 1, start_line: 5, text: "El algebra lineal estudia vectores, matrices y transformaciones lineales. Un vector puede representar una posicion, una direccion o una lista ordenada de valores.", title: "Algebra lineal estudia", title_candidates: ["algebra lineal estudia", "algebra lineal", "lineal estudia vectores", "estudia vectores matrices", "vectores matrices transformaciones"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 3, node_id: "section:9c2e67b1cbeb1480:section-3", numbering: "1.1", order: 3, section_id: "section-3", start_line: 7, title: "1.1 Vectores"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
SET n:Chunk
SET n += {character_count: 151, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:9c2e67b1cbeb1480:chunk-2", order: 2, start_line: 9, text: "Un vector tiene magnitud y direccion. En aprendizaje automatico, los vectores tambien pueden representar caracteristicas de objetos, textos o usuarios.", title: "Vector tiene magnitud", title_candidates: ["vector tiene magnitud", "vector tiene", "tiene magnitud direccion", "magnitud direccion aprendizaje", "direccion aprendizaje automatico"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 20};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-4"})
SET n:Section
SET n += {end_line: 13, heading_type: "markdown", level: 3, node_id: "section:9c2e67b1cbeb1480:section-4", numbering: "1.2", order: 4, section_id: "section-4", start_line: 11, title: "1.2 Matrices"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
SET n:Chunk
SET n += {character_count: 148, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:9c2e67b1cbeb1480:chunk-3", order: 3, start_line: 13, text: "Una matriz organiza numeros en filas y columnas. Las matrices permiten describir sistemas de ecuaciones y transformar vectores de un espacio a otro.", title: "Matriz organiza numeros", title_candidates: ["matriz organiza numeros", "matriz organiza", "organiza numeros filas", "numeros filas columnas", "filas columnas matrices"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-5"})
SET n:Section
SET n += {end_line: 17, heading_type: "markdown", level: 2, node_id: "section:9c2e67b1cbeb1480:section-5", numbering: "2", order: 5, section_id: "section-5", start_line: 15, title: "2. Idea importante"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
SET n:Chunk
SET n += {character_count: 154, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 17, node_id: "chunk:9c2e67b1cbeb1480:chunk-4", order: 4, start_line: 17, text: "Los espacios vectoriales permiten estudiar relaciones entre objetos mediante operaciones como suma, multiplicacion por escalares y combinaciones lineales.", title: "Espacios vectoriales permiten", title_candidates: ["espacios vectoriales permiten", "espacios vectoriales", "vectoriales permiten estudiar", "permiten estudiar relaciones", "estudiar relaciones objetos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 18};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-6"})
SET n:Section
SET n += {end_line: 21, heading_type: "markdown", level: 2, node_id: "section:9c2e67b1cbeb1480:section-6", order: 6, section_id: "section-6", start_line: 19, title: "Conclusion"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
SET n:Chunk
SET n += {character_count: 111, chunk_id: "chunk-5", chunk_type: "paragraph", end_line: 21, node_id: "chunk:9c2e67b1cbeb1480:chunk-5", order: 5, start_line: 21, text: "El tema central es que vectores y matrices funcionan como lenguaje comun para modelar datos y transformaciones.", title: "Central vectores matrices", title_candidates: ["central vectores matrices", "central vectores", "vectores matrices funcionan", "matrices funcionan lenguaje", "funcionan lenguaje comun"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 17};

MATCH (source {node_id: "document:9c2e67b1cbeb1480"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-2"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:8260ad47f4a5e3ea"}]->(target)
SET r += {order: 2, relationship_id: "relationship:8260ad47f4a5e3ea"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:8d28655726fd4144"}]->(target)
SET r += {order: 1, relationship_id: "relationship:8d28655726fd4144"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-3"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:e35eb02e1e9dca7c"}]->(target)
SET r += {order: 3, relationship_id: "relationship:e35eb02e1e9dca7c"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-3"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:e3912237fa510a8e"}]->(target)
SET r += {order: 2, relationship_id: "relationship:e3912237fa510a8e"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-4"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:b9fb9b8d00a7bc6e"}]->(target)
SET r += {order: 4, relationship_id: "relationship:b9fb9b8d00a7bc6e"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:8753180103c80dc6"}]->(target)
SET r += {order: 3, relationship_id: "relationship:8753180103c80dc6"};

MATCH (source {node_id: "document:9c2e67b1cbeb1480"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-5"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:cabe4a84d118ab01"}]->(target)
SET r += {order: 5, relationship_id: "relationship:cabe4a84d118ab01"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:c227385024237b11"}]->(target)
SET r += {order: 4, relationship_id: "relationship:c227385024237b11"};

MATCH (source {node_id: "document:9c2e67b1cbeb1480"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-6"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:01eb99479d4ef578"}]->(target)
SET r += {order: 6, relationship_id: "relationship:01eb99479d4ef578"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:9147abff8152e3b4"}]->(target)
SET r += {order: 5, relationship_id: "relationship:9147abff8152e3b4"};

CREATE CONSTRAINT document_node_id IF NOT EXISTS FOR (n:Document) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT section_node_id IF NOT EXISTS FOR (n:Section) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT chunk_node_id IF NOT EXISTS FOR (n:Chunk) REQUIRE n.node_id IS UNIQUE;

CREATE INDEX document_title IF NOT EXISTS FOR (n:Document) ON (n.title);

CREATE INDEX section_title IF NOT EXISTS FOR (n:Section) ON (n.title);

CREATE INDEX has_section_relationship_id IF NOT EXISTS FOR ()-[r:HAS_SECTION]-() ON (r.relationship_id);

CREATE INDEX has_subsection_relationship_id IF NOT EXISTS FOR ()-[r:HAS_SUBSECTION]-() ON (r.relationship_id);

CREATE INDEX has_chunk_relationship_id IF NOT EXISTS FOR ()-[r:HAS_CHUNK]-() ON (r.relationship_id);

// Document: Algebra lineal para vectores
// Document ID: 9c2e67b1cbeb1480
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

// Document: Biologia celular: membranas y organelos
// Document ID: cf930a8d0f9b30a7
MERGE (n:Document {node_id: "document:cf930a8d0f9b30a7"})
SET n:Document
SET n += {document_id: "cf930a8d0f9b30a7", node_id: "document:cf930a8d0f9b30a7", paragraph_count: 9, processing_status: "neo4j_export_ready", source_extension: ".txt", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/biologia_celular.txt", title: "Biologia celular: membranas y organelos", word_count: 104};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "numbered", level: 2, node_id: "section:cf930a8d0f9b30a7:section-2", numbering: "1", order: 2, section_id: "section-2", start_line: 3, title: "Introduccion"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
SET n:Chunk
SET n += {character_count: 155, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:cf930a8d0f9b30a7:chunk-1", order: 1, start_line: 5, text: "La biologia celular estudia la estructura y funcion de las celulas. La celula es la unidad basica de los seres vivos y contiene componentes especializados.", title: "Biologia celular estudia", title_candidates: ["biologia celular estudia", "biologia celular", "celular estudia estructura", "estudia estructura funcion", "estructura funcion celulas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "numbered", level: 3, node_id: "section:cf930a8d0f9b30a7:section-3", numbering: "1.1", order: 3, section_id: "section-3", start_line: 7, title: "Membrana celular"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
SET n:Chunk
SET n += {character_count: 166, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:cf930a8d0f9b30a7:chunk-2", order: 2, start_line: 9, text: "La membrana celular regula el intercambio de sustancias. Esta formada por una bicapa lipidica y proteinas que participan en transporte, senalizacion y reconocimiento.", title: "Membrana celular regula", title_candidates: ["membrana celular regula", "membrana celular", "celular regula intercambio", "regula intercambio sustancias", "intercambio sustancias formada"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-4"})
SET n:Section
SET n += {end_line: 13, heading_type: "numbered", level: 3, node_id: "section:cf930a8d0f9b30a7:section-4", numbering: "1.2", order: 4, section_id: "section-4", start_line: 11, title: "Organelos"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
SET n:Chunk
SET n += {character_count: 171, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:cf930a8d0f9b30a7:chunk-3", order: 3, start_line: 13, text: "Los organelos realizan tareas especificas. El nucleo guarda informacion genetica, las mitocondrias producen energia y los ribosomas participan en la sintesis de proteinas.", title: "Organelos realizan tareas", title_candidates: ["organelos realizan tareas", "organelos realizan", "realizan tareas especificas", "tareas especificas nucleo", "especificas nucleo guarda"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-5"})
SET n:Section
SET n += {end_line: 17, heading_type: "numbered", level: 2, node_id: "section:cf930a8d0f9b30a7:section-5", numbering: "2", order: 5, section_id: "section-5", start_line: 15, title: "Resumen de temas importantes"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
SET n:Chunk
SET n += {character_count: 105, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 17, node_id: "chunk:cf930a8d0f9b30a7:chunk-4", order: 4, start_line: 17, text: "Los conceptos clave son celula, membrana celular, organelos, nucleo, mitocondria y sintesis de proteinas.", title: "Clave celula membrana", title_candidates: ["clave celula membrana", "clave celula", "celula membrana celular", "membrana celular organelos", "celular organelos nucleo"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 14};

MATCH (source {node_id: "document:cf930a8d0f9b30a7"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-2"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:db1eda81a3dcf4d4"}]->(target)
SET r += {order: 2, relationship_id: "relationship:db1eda81a3dcf4d4"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:c049df15954f371e"}]->(target)
SET r += {order: 1, relationship_id: "relationship:c049df15954f371e"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-3"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:0dd81e8bebc4ce0f"}]->(target)
SET r += {order: 3, relationship_id: "relationship:0dd81e8bebc4ce0f"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:877a0f00c9b59662"}]->(target)
SET r += {order: 2, relationship_id: "relationship:877a0f00c9b59662"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-4"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:db2b61f6a5944757"}]->(target)
SET r += {order: 4, relationship_id: "relationship:db2b61f6a5944757"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:a5ea98f96675beaa"}]->(target)
SET r += {order: 3, relationship_id: "relationship:a5ea98f96675beaa"};

MATCH (source {node_id: "document:cf930a8d0f9b30a7"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-5"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:c22d21126c68067f"}]->(target)
SET r += {order: 5, relationship_id: "relationship:c22d21126c68067f"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:723067e5ecd0c821"}]->(target)
SET r += {order: 4, relationship_id: "relationship:723067e5ecd0c821"};

// Document: Estrategias de aprendizaje autorregulado
// Document ID: e17459b81e02abbb
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

// Document: Historia del metodo cientifico
// Document ID: 7e169ef36110ab70
MERGE (n:Document {node_id: "document:7e169ef36110ab70"})
SET n:Document
SET n += {document_id: "7e169ef36110ab70", node_id: "document:7e169ef36110ab70", paragraph_count: 11, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/historia_metodo_cientifico.md", title: "Historia del metodo cientifico", word_count: 104};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "markdown", level: 2, node_id: "section:7e169ef36110ab70:section-2", order: 2, section_id: "section-2", start_line: 3, title: "Introduccion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-1"})
SET n:Chunk
SET n += {character_count: 145, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:7e169ef36110ab70:chunk-1", order: 1, start_line: 5, text: "El metodo cientifico es una forma organizada de construir conocimiento mediante observacion, hipotesis, experimentacion y revision de resultados.", title: "Metodo cientifico organizada", title_candidates: ["metodo cientifico organizada", "metodo cientifico", "cientifico organizada construir", "organizada construir conocimiento", "construir conocimiento observacion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 18};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 2, node_id: "section:7e169ef36110ab70:section-3", numbering: "1", order: 3, section_id: "section-3", start_line: 7, title: "1. Observacion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-2"})
SET n:Chunk
SET n += {character_count: 122, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:7e169ef36110ab70:chunk-2", order: 2, start_line: 9, text: "La observacion identifica un fenomeno o problema. En esta etapa se registran patrones, preguntas y condiciones relevantes.", title: "Observacion identifica fenomeno", title_candidates: ["observacion identifica fenomeno", "observacion identifica", "identifica fenomeno problema", "fenomeno problema etapa", "problema etapa registran"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 17};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-4"})
SET n:Section
SET n += {end_line: 13, heading_type: "markdown", level: 3, node_id: "section:7e169ef36110ab70:section-4", numbering: "1.1", order: 4, section_id: "section-4", start_line: 11, title: "1.1 Hipotesis"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-3"})
SET n:Chunk
SET n += {character_count: 107, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:7e169ef36110ab70:chunk-3", order: 3, start_line: 13, text: "Una hipotesis propone una explicacion tentativa. Debe poder ponerse a prueba y generar predicciones claras.", title: "Hipotesis propone explicacion", title_candidates: ["hipotesis propone explicacion", "hipotesis propone", "propone explicacion tentativa", "explicacion tentativa debe", "tentativa debe poder"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 15};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-5"})
SET n:Section
SET n += {end_line: 17, heading_type: "markdown", level: 3, node_id: "section:7e169ef36110ab70:section-5", numbering: "1.2", order: 5, section_id: "section-5", start_line: 15, title: "1.2 Experimentacion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-4"})
SET n:Chunk
SET n += {character_count: 149, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 17, node_id: "chunk:7e169ef36110ab70:chunk-4", order: 4, start_line: 17, text: "La experimentacion compara resultados esperados con resultados observados. Un buen experimento controla variables y permite repetir el procedimiento.", title: "Experimentacion compara resultados", title_candidates: ["experimentacion compara resultados", "experimentacion compara", "compara resultados esperados", "resultados esperados resultados", "esperados resultados observados"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 18};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-6"})
SET n:Section
SET n += {end_line: 21, heading_type: "markdown", level: 2, node_id: "section:7e169ef36110ab70:section-6", numbering: "2", order: 6, section_id: "section-6", start_line: 19, title: "2. Conclusion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-5"})
SET n:Chunk
SET n += {character_count: 170, chunk_id: "chunk-5", chunk_type: "paragraph", end_line: 21, node_id: "chunk:7e169ef36110ab70:chunk-5", order: 5, start_line: 21, text: "Los temas importantes son observacion, hipotesis, evidencia, experimentacion y revision. La ciencia avanza cuando sus explicaciones pueden corregirse con nueva evidencia.", title: "Importantes observacion hipotesis", title_candidates: ["importantes observacion hipotesis", "importantes observacion", "observacion hipotesis evidencia", "hipotesis evidencia experimentacion", "evidencia experimentacion revision"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 21};

MATCH (source {node_id: "document:7e169ef36110ab70"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-2"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:6cfdd74bd6b6a161"}]->(target)
SET r += {order: 2, relationship_id: "relationship:6cfdd74bd6b6a161"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:b64b3e2f2df4139f"}]->(target)
SET r += {order: 1, relationship_id: "relationship:b64b3e2f2df4139f"};

MATCH (source {node_id: "document:7e169ef36110ab70"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-3"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:e8e034340a27c5d3"}]->(target)
SET r += {order: 3, relationship_id: "relationship:e8e034340a27c5d3"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:5b5a44b5c4b12f11"}]->(target)
SET r += {order: 2, relationship_id: "relationship:5b5a44b5c4b12f11"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-4"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:2f7b774dd0701ba8"}]->(target)
SET r += {order: 4, relationship_id: "relationship:2f7b774dd0701ba8"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:ebe3236662fb2613"}]->(target)
SET r += {order: 3, relationship_id: "relationship:ebe3236662fb2613"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-5"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:c28e2a5d0da199c0"}]->(target)
SET r += {order: 5, relationship_id: "relationship:c28e2a5d0da199c0"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:0e66463e6e1b7409"}]->(target)
SET r += {order: 4, relationship_id: "relationship:0e66463e6e1b7409"};

MATCH (source {node_id: "document:7e169ef36110ab70"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-6"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:6b88e8bddf106284"}]->(target)
SET r += {order: 6, relationship_id: "relationship:6b88e8bddf106284"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:3f32568e8c311750"}]->(target)
SET r += {order: 5, relationship_id: "relationship:3f32568e8c311750"};

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

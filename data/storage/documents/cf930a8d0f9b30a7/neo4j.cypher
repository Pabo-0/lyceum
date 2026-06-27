MERGE (n:Document {node_id: "document:cf930a8d0f9b30a7"})
SET n:Document
SET n += {document_id: "cf930a8d0f9b30a7", node_id: "document:cf930a8d0f9b30a7", paragraph_count: 9, processing_status: "neo4j_export_ready", source_extension: ".txt", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/biologia_celular.txt", title: "Biologia celular: membranas y organelos", word_count: 104};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-1"})
SET n:Section
SET n += {end_line: 1, heading_type: "title_line", level: 1, node_id: "section:cf930a8d0f9b30a7:section-1", order: 1, section_id: "section-1", start_line: 1, title: "Biologia celular: membranas y organelos"};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "numbered", level: 2, node_id: "section:cf930a8d0f9b30a7:section-2", numbering: "1", order: 2, section_id: "section-2", start_line: 3, title: "Introduccion"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
SET n:Chunk
SET n += {character_count: 155, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:cf930a8d0f9b30a7:chunk-1", order: 1, start_line: 5, text: "La biologia celular estudia la estructura y funcion de las celulas. La celula es la unidad basica de los seres vivos y contiene componentes especializados.", word_count: 25};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "numbered", level: 3, node_id: "section:cf930a8d0f9b30a7:section-3", numbering: "1.1", order: 3, section_id: "section-3", start_line: 7, title: "Membrana celular"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
SET n:Chunk
SET n += {character_count: 166, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:cf930a8d0f9b30a7:chunk-2", order: 2, start_line: 9, text: "La membrana celular regula el intercambio de sustancias. Esta formada por una bicapa lipidica y proteinas que participan en transporte, senalizacion y reconocimiento.", word_count: 23};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-4"})
SET n:Section
SET n += {end_line: 13, heading_type: "numbered", level: 3, node_id: "section:cf930a8d0f9b30a7:section-4", numbering: "1.2", order: 4, section_id: "section-4", start_line: 11, title: "Organelos"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
SET n:Chunk
SET n += {character_count: 171, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:cf930a8d0f9b30a7:chunk-3", order: 3, start_line: 13, text: "Los organelos realizan tareas especificas. El nucleo guarda informacion genetica, las mitocondrias producen energia y los ribosomas participan en la sintesis de proteinas.", word_count: 23};

MERGE (n:Section {node_id: "section:cf930a8d0f9b30a7:section-5"})
SET n:Section
SET n += {end_line: 17, heading_type: "numbered", level: 2, node_id: "section:cf930a8d0f9b30a7:section-5", numbering: "2", order: 5, section_id: "section-5", start_line: 15, title: "Resumen de temas importantes"};

MERGE (n:Chunk {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
SET n:Chunk
SET n += {character_count: 105, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 17, node_id: "chunk:cf930a8d0f9b30a7:chunk-4", order: 4, start_line: 17, text: "Los conceptos clave son celula, membrana celular, organelos, nucleo, mitocondria y sintesis de proteinas.", word_count: 14};

MERGE (n:Concept {node_id: "concept:canonical-concept-c3ada42de2b8"})
SET n:Concept
SET n += {canonical_name: "celular", chunk_frequency: 4, concept_id: "canonical-concept-c3ada42de2b8", display_name: "celular", frequency: 8, mention_count: 3, node_id: "concept:canonical-concept-c3ada42de2b8", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.592287, section_frequency: 4, variant_terms: ["celular"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-5564607f899f"})
SET n:Concept
SET n += {canonical_name: "organelo", chunk_frequency: 4, concept_id: "canonical-concept-5564607f899f", display_name: "organelos", frequency: 7, mention_count: 2, node_id: "concept:canonical-concept-5564607f899f", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.504702, section_frequency: 4, variant_terms: ["organelos"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-62e76573b23c"})
SET n:Concept
SET n += {canonical_name: "membrana", chunk_frequency: 4, concept_id: "canonical-concept-62e76573b23c", display_name: "membrana", frequency: 7, mention_count: 2, node_id: "concept:canonical-concept-62e76573b23c", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.460698, section_frequency: 4, variant_terms: ["membrana", "membranas"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-3b15c4d3747a"})
SET n:Concept
SET n += {canonical_name: "membrana celular", chunk_frequency: 2, concept_id: "canonical-concept-3b15c4d3747a", display_name: "membrana celular", frequency: 3, mention_count: 2, node_id: "concept:canonical-concept-3b15c4d3747a", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.319384, section_frequency: 2, variant_terms: ["membrana celular"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-cd2b87c04e3d"})
SET n:Concept
SET n += {canonical_name: "biologia celular", chunk_frequency: 4, concept_id: "canonical-concept-cd2b87c04e3d", display_name: "biologia celular", frequency: 5, mention_count: 1, node_id: "concept:canonical-concept-cd2b87c04e3d", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.306253, section_frequency: 4, variant_terms: ["biologia celular"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-c59c5c439ef8"})
SET n:Concept
SET n += {canonical_name: "biologia", chunk_frequency: 4, concept_id: "canonical-concept-c59c5c439ef8", display_name: "biologia", frequency: 5, mention_count: 1, node_id: "concept:canonical-concept-c59c5c439ef8", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.266307, section_frequency: 4, variant_terms: ["biologia"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-9701408756ed"})
SET n:Concept
SET n += {canonical_name: "biologia celular membrana", chunk_frequency: 4, concept_id: "canonical-concept-9701408756ed", display_name: "biologia celular membranas", frequency: 4, mention_count: 3, node_id: "concept:canonical-concept-9701408756ed", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.237865, section_frequency: 4, variant_terms: ["biologia celular membranas"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-23f394395e82"})
SET n:Concept
SET n += {canonical_name: "celular membrana organelo", chunk_frequency: 4, concept_id: "canonical-concept-23f394395e82", display_name: "celular membranas organelos", frequency: 4, mention_count: 2, node_id: "concept:canonical-concept-23f394395e82", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.237865, section_frequency: 4, variant_terms: ["celular membranas organelos"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-aeadf184d703"})
SET n:Concept
SET n += {canonical_name: "celular membrana", chunk_frequency: 4, concept_id: "canonical-concept-aeadf184d703", display_name: "celular membranas", frequency: 4, mention_count: 0, node_id: "concept:canonical-concept-aeadf184d703", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.210419, section_frequency: 4, variant_terms: ["celular membranas"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-7943061132c7"})
SET n:Concept
SET n += {canonical_name: "membrana organelo", chunk_frequency: 4, concept_id: "canonical-concept-7943061132c7", display_name: "membranas organelos", frequency: 4, mention_count: 0, node_id: "concept:canonical-concept-7943061132c7", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.210419, section_frequency: 4, variant_terms: ["membranas organelos"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-61752c9fc521"})
SET n:Concept
SET n += {canonical_name: "sintesis proteina", chunk_frequency: 2, concept_id: "canonical-concept-61752c9fc521", display_name: "sintesis proteinas", frequency: 2, mention_count: 2, node_id: "concept:canonical-concept-61752c9fc521", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.173119, section_frequency: 2, variant_terms: ["sintesis proteinas"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-f7d91f4c21e0"})
SET n:Concept
SET n += {canonical_name: "proteina", chunk_frequency: 3, concept_id: "canonical-concept-f7d91f4c21e0", display_name: "proteinas", frequency: 3, mention_count: 0, node_id: "concept:canonical-concept-f7d91f4c21e0", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.172838, section_frequency: 3, variant_terms: ["proteinas"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-e837a5185381"})
SET n:Concept
SET n += {canonical_name: "celula", chunk_frequency: 2, concept_id: "canonical-concept-e837a5185381", display_name: "celula", frequency: 2, mention_count: 2, node_id: "concept:canonical-concept-e837a5185381", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.151823, section_frequency: 2, variant_terms: ["celula"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-812d6dca15fd"})
SET n:Concept
SET n += {canonical_name: "nucleo", chunk_frequency: 2, concept_id: "canonical-concept-812d6dca15fd", display_name: "nucleo", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-812d6dca15fd", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.150538, section_frequency: 2, variant_terms: ["nucleo"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-c60dc706a863"})
SET n:Concept
SET n += {canonical_name: "sintesis", chunk_frequency: 2, concept_id: "canonical-concept-c60dc706a863", display_name: "sintesis", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-c60dc706a863", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.150538, section_frequency: 2, variant_terms: ["sintesis"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
SET n:Concept
SET n += {canonical_name: "participan", chunk_frequency: 2, concept_id: "canonical-concept-3f8bc83f0c3b", display_name: "participan", frequency: 2, mention_count: 2, node_id: "concept:canonical-concept-3f8bc83f0c3b", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.124617, section_frequency: 2, variant_terms: ["participan"]};

MATCH (source {node_id: "document:cf930a8d0f9b30a7"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-1"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:ff173b637538ab70"}]->(target)
SET r += {order: 1, relationship_id: "relationship:ff173b637538ab70"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-1"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-2"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:3c07704fce5711ee"}]->(target)
SET r += {order: 2, relationship_id: "relationship:3c07704fce5711ee"};

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

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-1"})
MATCH (target {node_id: "section:cf930a8d0f9b30a7:section-5"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:9c4ad44a71395de6"}]->(target)
SET r += {order: 5, relationship_id: "relationship:9c4ad44a71395de6"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:723067e5ecd0c821"}]->(target)
SET r += {order: 4, relationship_id: "relationship:723067e5ecd0c821"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f762eb311717aafc"}]->(target)
SET r += {mention_id: "canonical-mention-8865df8d485b", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:f762eb311717aafc", score: 0.047917, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:35429f9d6a466704"}]->(target)
SET r += {mention_id: "canonical-mention-005f249be910", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:35429f9d6a466704", score: 0.041667, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f292e8ca92ecc8a9"}]->(target)
SET r += {mention_id: "canonical-mention-654133c3c758", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:f292e8ca92ecc8a9", score: 0.041667, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:51abd73154a2b0dc"}]->(target)
SET r += {mention_id: "canonical-mention-0a6417becc76", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:51abd73154a2b0dc", score: 0.031476, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:21976e3c9c0160d2"}]->(target)
SET r += {mention_id: "canonical-mention-228c90963c2e", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:21976e3c9c0160d2", score: 0.027083, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-23f394395e82"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:26f8a69bc28a4cb0"}]->(target)
SET r += {mention_id: "canonical-mention-efa1e815f6c3", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:26f8a69bc28a4cb0", score: 0.027083, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9e6cef198be77e41"}]->(target)
SET r += {mention_id: "canonical-mention-4c6e5ef1cd8e", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:9e6cef198be77e41", score: 0.072394, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:acf0ba06798b3225"}]->(target)
SET r += {mention_id: "canonical-mention-d5e6c25ddcee", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:acf0ba06798b3225", score: 0.062951, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1397d1802390dcf4"}]->(target)
SET r += {mention_id: "canonical-mention-1183b217b5dc", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 3, relationship_id: "relationship:1397d1802390dcf4", score: 0.0625, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:500c858a273b0a6e"}]->(target)
SET r += {mention_id: "canonical-mention-aadd1b31e030", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:500c858a273b0a6e", score: 0.031476, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6c68b9f5b2f6bff9"}]->(target)
SET r += {mention_id: "canonical-mention-1469078b2bba", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:6c68b9f5b2f6bff9", score: 0.027083, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-23f394395e82"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:eb0c8403d6d5dc28"}]->(target)
SET r += {mention_id: "canonical-mention-617037910c11", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:eb0c8403d6d5dc28", score: 0.027083, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-5564607f899f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9d12c0c194665203"}]->(target)
SET r += {mention_id: "canonical-mention-3a2634f541c2", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 3, relationship_id: "relationship:9d12c0c194665203", score: 0.061224, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:7c5f1d5541e7e1d1"}]->(target)
SET r += {mention_id: "canonical-mention-fefcb82935e7", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:7c5f1d5541e7e1d1", score: 0.035458, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:94891a17876f5abd"}]->(target)
SET r += {mention_id: "canonical-mention-7a907497ed7e", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:94891a17876f5abd", score: 0.030833, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3b3dc9cb60b686bb"}]->(target)
SET r += {mention_id: "canonical-mention-7684e7ab64d1", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:3b3dc9cb60b686bb", score: 0.030833, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:82027676a000d238"}]->(target)
SET r += {mention_id: "canonical-mention-a03d03f77793", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:82027676a000d238", score: 0.030833, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:2f2348243560b8ae"}]->(target)
SET r += {mention_id: "canonical-mention-f6ae8f867751", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:2f2348243560b8ae", score: 0.026531, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:888ea2eb55d02934"}]->(target)
SET r += {mention_id: "canonical-mention-a8fa7f2a8052", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:888ea2eb55d02934", score: 0.058824, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-5564607f899f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:197200ad178255de"}]->(target)
SET r += {mention_id: "canonical-mention-4f4dc6b29be4", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:197200ad178255de", score: 0.058824, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:debf652981f61634"}]->(target)
SET r += {mention_id: "canonical-mention-ca0ad6465b32", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:debf652981f61634", score: 0.051101, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:328829ef2361f1c3"}]->(target)
SET r += {mention_id: "canonical-mention-b2beaf2197c0", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:328829ef2361f1c3", score: 0.051101, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:7b90dfa764602857"}]->(target)
SET r += {mention_id: "canonical-mention-3ca335b84bc6", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:7b90dfa764602857", score: 0.044436, source: "chunk"};

MATCH (source {node_id: "chunk:cf930a8d0f9b30a7:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:cb35d69a4bb03460"}]->(target)
SET r += {mention_id: "canonical-mention-6d6a5bc7eee7", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:cb35d69a4bb03460", score: 0.044436, source: "chunk"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:097fc4cb8c92116e"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:097fc4cb8c92116e", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d590e3271692ce29"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:d590e3271692ce29", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:5e800393972e92aa"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:5e800393972e92aa", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:8f506520928b8b5c"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:8f506520928b8b5c", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3551033fac33da14"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:3551033fac33da14", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-2"})
MATCH (target {node_id: "concept:canonical-concept-23f394395e82"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:57b859ba3ec03237"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:57b859ba3ec03237", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:a804992a10329d33"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:a804992a10329d33", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:24ed9c1baa6fd2a4"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:24ed9c1baa6fd2a4", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1beb3e775a1f2542"}]->(target)
SET r += {mention_count: 1, occurrence_count: 3, relationship_id: "relationship:1beb3e775a1f2542", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:05a7bd1cceb5ce04"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:05a7bd1cceb5ce04", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1bd9f3ebf73396fa"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:1bd9f3ebf73396fa", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-3"})
MATCH (target {node_id: "concept:canonical-concept-23f394395e82"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:436df90df3d0067b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:436df90df3d0067b", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "concept:canonical-concept-5564607f899f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:c9b790ae80f8b14a"}]->(target)
SET r += {mention_count: 1, occurrence_count: 3, relationship_id: "relationship:c9b790ae80f8b14a", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:255023271ad0bf96"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:255023271ad0bf96", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:ad8b6191b87290d6"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:ad8b6191b87290d6", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:562aedfd0b63cc00"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:562aedfd0b63cc00", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d399532b9aa49bc4"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:d399532b9aa49bc4", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-4"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4ff794c56b44e9ed"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:4ff794c56b44e9ed", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:c7b3b18c719ada1b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:c7b3b18c719ada1b", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "concept:canonical-concept-5564607f899f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:67233caa5575748f"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:67233caa5575748f", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:832f3f6c5b57ca2b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:832f3f6c5b57ca2b", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:551fe4a3179a9b1e"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:551fe4a3179a9b1e", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b2752a6db0cf75aa"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:b2752a6db0cf75aa", source: "section"};

MATCH (source {node_id: "section:cf930a8d0f9b30a7:section-5"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:bb657d09e32a3fec"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:bb657d09e32a3fec", source: "section"};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:37cac5e99c593dc8"}]->(target)
SET r += {candidate_id: "semantic-relationship:b5b9580b22d6c55d", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:37cac5e99c593dc8", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:ad0d54055be9b4ea"}]->(target)
SET r += {candidate_id: "semantic-relationship:cc01fb6fff04e6f6", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:ad0d54055be9b4ea", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:a1d41992ccfd552a"}]->(target)
SET r += {candidate_id: "semantic-relationship:63c03d1472a6a3a7", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:a1d41992ccfd552a", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:bd0bbb6261a84a5c"}]->(target)
SET r += {candidate_id: "semantic-relationship:5a69aeab8d689cc7", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:bd0bbb6261a84a5c", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:b1f81298bd0ca6fe"}]->(target)
SET r += {candidate_id: "semantic-relationship:804863a5f0d04524", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:b1f81298bd0ca6fe", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:a8cb9851c8a1c930"}]->(target)
SET r += {candidate_id: "semantic-relationship:754d7a93c4837b02", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:a8cb9851c8a1c930", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:b114780579ca84a3"}]->(target)
SET r += {candidate_id: "semantic-relationship:5ee51c9a81b94525", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:b114780579ca84a3", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:420a1bc18e3c08a4"}]->(target)
SET r += {candidate_id: "semantic-relationship:7ef3b4f2f3efb2be", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:420a1bc18e3c08a4", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:4f95f4e746df7fb0"}]->(target)
SET r += {candidate_id: "semantic-relationship:2107f4031cc98370", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:4f95f4e746df7fb0", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-e837a5185381"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f0f1692bf8aa375d"}]->(target)
SET r += {candidate_id: "semantic-relationship:17faedb0e9dc89d4", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f0f1692bf8aa375d", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:dbf69d90f30415c6"}]->(target)
SET r += {candidate_id: "semantic-relationship:95967bbc36e4e0b4", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:dbf69d90f30415c6", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e88a3bae1dcbb2f5"}]->(target)
SET r += {candidate_id: "semantic-relationship:5ab73e43143e8316", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e88a3bae1dcbb2f5", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:a731f79594494150"}]->(target)
SET r += {candidate_id: "semantic-relationship:210d632fc72058d9", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:a731f79594494150", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f138516a8e525f6d"}]->(target)
SET r += {candidate_id: "semantic-relationship:d5e892f1ba000514", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f138516a8e525f6d", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e702233d9ef03a0c"}]->(target)
SET r += {candidate_id: "semantic-relationship:aae31f83578e8635", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e702233d9ef03a0c", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:2e77b342512454f7"}]->(target)
SET r += {candidate_id: "semantic-relationship:e2d9ae006da6d88f", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:2e77b342512454f7", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:7d439835a034d2da"}]->(target)
SET r += {candidate_id: "semantic-relationship:6917e3f87ae33bef", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:7d439835a034d2da", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-e837a5185381"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:bdb35615d3132d5c"}]->(target)
SET r += {candidate_id: "semantic-relationship:9ebdf2ebd477f455", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:bdb35615d3132d5c", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:abc1ed4ab59ec765"}]->(target)
SET r += {candidate_id: "semantic-relationship:e45739cb96104bc8", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:abc1ed4ab59ec765", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-812d6dca15fd"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:05d88d201d210686"}]->(target)
SET r += {candidate_id: "semantic-relationship:f71f1df38d52fb14", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:05d88d201d210686", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d2b685525adbceff"}]->(target)
SET r += {candidate_id: "semantic-relationship:d4534e82824ae0a0", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:d2b685525adbceff", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:98dd3c406a9f656e"}]->(target)
SET r += {candidate_id: "semantic-relationship:c3d88dfb10eb2f36", confidence: 0.8, evidence: ["cosine_similarity:0.980308"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:98dd3c406a9f656e", source: "concept_mentions", status: "candidate", weight: 0.980308};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:71adcdb31e4dbe95"}]->(target)
SET r += {candidate_id: "semantic-relationship:2f4bc0787b241597", confidence: 0.8, evidence: ["cosine_similarity:0.890737"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:71adcdb31e4dbe95", source: "concept_mentions", status: "candidate", weight: 0.890737};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:494475a5571fb1e3"}]->(target)
SET r += {candidate_id: "semantic-relationship:94dede65562bc68a", confidence: 0.8, evidence: ["cosine_similarity:0.890737"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:494475a5571fb1e3", source: "concept_mentions", status: "candidate", weight: 0.890737};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bb78f0a06540bccd"}]->(target)
SET r += {candidate_id: "semantic-relationship:f7f7eaa23f22f6c0", confidence: 0.8, evidence: ["cosine_similarity:0.822043"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:bb78f0a06540bccd", source: "concept_mentions", status: "candidate", weight: 0.822043};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:245a9c38833970b1"}]->(target)
SET r += {candidate_id: "semantic-relationship:39c5479500781901", confidence: 0.8, evidence: ["cosine_similarity:0.813709"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:245a9c38833970b1", source: "concept_mentions", status: "candidate", weight: 0.813709};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e03de10a17adbb86"}]->(target)
SET r += {candidate_id: "semantic-relationship:797fff79a501e91d", confidence: 0.786012, evidence: ["cosine_similarity:0.772025"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:e03de10a17adbb86", source: "concept_mentions", status: "candidate", weight: 0.772025};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1e5dcc620858f81e"}]->(target)
SET r += {candidate_id: "semantic-relationship:37f84f2d11c1aad8", confidence: 0.777779, evidence: ["cosine_similarity:0.755557"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:1e5dcc620858f81e", source: "concept_mentions", status: "candidate", weight: 0.755557};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:4baf8dfe0491724b"}]->(target)
SET r += {candidate_id: "semantic-relationship:90a10a1c73b07f94", confidence: 0.76055, evidence: ["cosine_similarity:0.721099"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:4baf8dfe0491724b", source: "concept_mentions", status: "candidate", weight: 0.721099};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6e465e61c63994b9"}]->(target)
SET r += {candidate_id: "semantic-relationship:a287ad6151ca76d4", confidence: 0.76055, evidence: ["cosine_similarity:0.721099"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6e465e61c63994b9", source: "concept_mentions", status: "candidate", weight: 0.721099};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:de2373c29984851e"}]->(target)
SET r += {candidate_id: "semantic-relationship:3ba46100f81483ba", confidence: 0.753553, evidence: ["cosine_similarity:0.707107"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:de2373c29984851e", source: "concept_mentions", status: "candidate", weight: 0.707107};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f2cf79d596dc73af"}]->(target)
SET r += {candidate_id: "semantic-relationship:b760af0aa2e48ae7", confidence: 0.753553, evidence: ["cosine_similarity:0.707107"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:f2cf79d596dc73af", source: "concept_mentions", status: "candidate", weight: 0.707107};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ab25722c72b10397"}]->(target)
SET r += {candidate_id: "semantic-relationship:87c963e3fffc3bc2", confidence: 0.749886, evidence: ["cosine_similarity:0.699773"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:ab25722c72b10397", source: "concept_mentions", status: "candidate", weight: 0.699773};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:31170ef33d7c9dd9"}]->(target)
SET r += {candidate_id: "semantic-relationship:d4cd5b78d7953607", confidence: 0.749886, evidence: ["cosine_similarity:0.699773"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:31170ef33d7c9dd9", source: "concept_mentions", status: "candidate", weight: 0.699773};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:693c151fcaad5528"}]->(target)
SET r += {candidate_id: "semantic-relationship:0118b86d7fa8686c", confidence: 0.735216, evidence: ["cosine_similarity:0.670431"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:693c151fcaad5528", source: "concept_mentions", status: "candidate", weight: 0.670431};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:34bfbe66c47fbaed"}]->(target)
SET r += {candidate_id: "semantic-relationship:78d1fb0303a6fadf", confidence: 0.717319, evidence: ["cosine_similarity:0.634638"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:34bfbe66c47fbaed", source: "concept_mentions", status: "candidate", weight: 0.634638};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:7d695218e4eb756f"}]->(target)
SET r += {candidate_id: "semantic-relationship:18ef48f5d236f000", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:7d695218e4eb756f", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d28aba476f3ecb36"}]->(target)
SET r += {candidate_id: "semantic-relationship:5838f0f1269b1a19", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d28aba476f3ecb36", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bfc11fd5a3b82fba"}]->(target)
SET r += {candidate_id: "semantic-relationship:2f2b93cd68ce545e", confidence: 0.7, evidence: ["chunk:chunk-2", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:bfc11fd5a3b82fba", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c3d19926c0dcff75"}]->(target)
SET r += {candidate_id: "semantic-relationship:07eb77ba6ea7b4fd", confidence: 0.7, evidence: ["chunk:chunk-2", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:c3d19926c0dcff75", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:4d0d73b4f54e110f"}]->(target)
SET r += {candidate_id: "semantic-relationship:ab81c8f8732ac30d", confidence: 0.7, evidence: ["chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:4d0d73b4f54e110f", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:337b53d85cbb04ee"}]->(target)
SET r += {candidate_id: "semantic-relationship:20e909d0b04b058c", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:337b53d85cbb04ee", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a9b2c1f9ce6b0d26"}]->(target)
SET r += {candidate_id: "semantic-relationship:6ed18d3a96593335", confidence: 0.7, evidence: ["chunk:chunk-2", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a9b2c1f9ce6b0d26", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:941fbfaf32bc3b89"}]->(target)
SET r += {candidate_id: "semantic-relationship:60fb4a0e968e047b", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:941fbfaf32bc3b89", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e92ba23237de1d5a"}]->(target)
SET r += {candidate_id: "semantic-relationship:8d5fd030a62ec8c4", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e92ba23237de1d5a", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:76f48f319e677379"}]->(target)
SET r += {candidate_id: "semantic-relationship:c8386d5ba8d30468", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:76f48f319e677379", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a252ee24518fba97"}]->(target)
SET r += {candidate_id: "semantic-relationship:a6f95473c6cb16c1", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a252ee24518fba97", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:eee0a89e45ab898f"}]->(target)
SET r += {candidate_id: "semantic-relationship:3bb57a7d13cd0648", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:eee0a89e45ab898f", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:4be2102325e62599"}]->(target)
SET r += {candidate_id: "semantic-relationship:8c2891d902f09997", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:4be2102325e62599", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:7853a7b365035f09"}]->(target)
SET r += {candidate_id: "semantic-relationship:f1dd20643bca724b", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:7853a7b365035f09", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:585ec76e8b103347"}]->(target)
SET r += {candidate_id: "semantic-relationship:5f2f59fcc01c6b50", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:585ec76e8b103347", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:8797aabd0b50de85"}]->(target)
SET r += {candidate_id: "semantic-relationship:c45eaf2dfc97fe32", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:8797aabd0b50de85", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-5564607f899f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:92cef97e85bf67e2"}]->(target)
SET r += {candidate_id: "semantic-relationship:baea4983977f08c3", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:92cef97e85bf67e2", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5c70affb95d2f536"}]->(target)
SET r += {candidate_id: "semantic-relationship:6b5b822f716aa2fc", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:5c70affb95d2f536", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e1aa46703c06779f"}]->(target)
SET r += {candidate_id: "semantic-relationship:d94f44244c5ad407", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e1aa46703c06779f", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ddb72966d6f12410"}]->(target)
SET r += {candidate_id: "semantic-relationship:62ab0a14f537b7b9", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ddb72966d6f12410", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-5564607f899f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:367fc61b00837ecb"}]->(target)
SET r += {candidate_id: "semantic-relationship:671e9ba6b5a405e2", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:367fc61b00837ecb", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-61752c9fc521"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:720183f6e76834e1"}]->(target)
SET r += {candidate_id: "semantic-relationship:62e4e7c985ca49e6", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:720183f6e76834e1", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9cdbf767b0da85c8"}]->(target)
SET r += {candidate_id: "semantic-relationship:b309fec9f6c6e64c", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:9cdbf767b0da85c8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e923ac9a3d38cf25"}]->(target)
SET r += {candidate_id: "semantic-relationship:00d001ed31359465", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e923ac9a3d38cf25", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:dfbe927c4aaec9cb"}]->(target)
SET r += {candidate_id: "semantic-relationship:26bae9dc21b89ee1", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:dfbe927c4aaec9cb", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:30f3c4458d602894"}]->(target)
SET r += {candidate_id: "semantic-relationship:6fa47d8ff2fa9db7", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:30f3c4458d602894", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e8e1465018c230e3"}]->(target)
SET r += {candidate_id: "semantic-relationship:6f4d72fc32bc5dd4", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e8e1465018c230e3", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:cbb37b6fc5062709"}]->(target)
SET r += {candidate_id: "semantic-relationship:9b492792db08733d", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:cbb37b6fc5062709", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1a2315646d64e208"}]->(target)
SET r += {candidate_id: "semantic-relationship:ad22b9cca1ff1744", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1a2315646d64e208", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a39e1509c68c7f2f"}]->(target)
SET r += {candidate_id: "semantic-relationship:8be32d6f45497851", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a39e1509c68c7f2f", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b88c752c3b8c805f"}]->(target)
SET r += {candidate_id: "semantic-relationship:17fd53e48f47275c", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:b88c752c3b8c805f", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5564607f899f"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:cc844f2c0699dcfe"}]->(target)
SET r += {candidate_id: "semantic-relationship:78762a9a7544ac52", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:cc844f2c0699dcfe", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d051a98a42343277"}]->(target)
SET r += {candidate_id: "semantic-relationship:54828cd09c201607", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d051a98a42343277", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:eace1338734ef685"}]->(target)
SET r += {candidate_id: "semantic-relationship:6338d505d6680208", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:eace1338734ef685", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:8c99fd532a60c972"}]->(target)
SET r += {candidate_id: "semantic-relationship:4ed073f1b4323b45", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:8c99fd532a60c972", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-c3ada42de2b8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6be3252196290593"}]->(target)
SET r += {candidate_id: "semantic-relationship:eaf1f57d517fb117", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:6be3252196290593", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:10c2a1c9f2e1e9d8"}]->(target)
SET r += {candidate_id: "semantic-relationship:afc3483b72e3ee68", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:10c2a1c9f2e1e9d8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:fe87521f6963bc11"}]->(target)
SET r += {candidate_id: "semantic-relationship:e1db139ea4305a28", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:fe87521f6963bc11", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1376917ac5cf0546"}]->(target)
SET r += {candidate_id: "semantic-relationship:ab865738f427b1c2", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1376917ac5cf0546", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-62e76573b23c"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:8700ee46d1a3d361"}]->(target)
SET r += {candidate_id: "semantic-relationship:1c0f200d5f51dc1b", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:8700ee46d1a3d361", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-812d6dca15fd"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:7dd5b16bc2ce9290"}]->(target)
SET r += {candidate_id: "semantic-relationship:f801291e90eb5ffe", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:7dd5b16bc2ce9290", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-812d6dca15fd"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:96c7bba7b78b1510"}]->(target)
SET r += {candidate_id: "semantic-relationship:78083f0eb2ccbfb9", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:96c7bba7b78b1510", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e319e03742fd80ef"}]->(target)
SET r += {candidate_id: "semantic-relationship:ccafb962f831f7f9", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e319e03742fd80ef", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:14944d4540ca43c5"}]->(target)
SET r += {candidate_id: "semantic-relationship:eef1598af90789bb", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:14944d4540ca43c5", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6ba681c0ba3677a5"}]->(target)
SET r += {candidate_id: "semantic-relationship:91e80c54ee519f4c", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:6ba681c0ba3677a5", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:acc36c23c3dae2fd"}]->(target)
SET r += {candidate_id: "semantic-relationship:8d9c6b5513e93255", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:acc36c23c3dae2fd", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:38dabac3beeb8503"}]->(target)
SET r += {candidate_id: "semantic-relationship:3dc341a088f2290e", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:38dabac3beeb8503", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-c3ada42de2b8"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ce9be69c375362fe"}]->(target)
SET r += {candidate_id: "semantic-relationship:fc56b5006ffa636d", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ce9be69c375362fe", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:eb55806fb69d3292"}]->(target)
SET r += {candidate_id: "semantic-relationship:94ad1e19c1387261", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:eb55806fb69d3292", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0c30bbb417da8f14"}]->(target)
SET r += {candidate_id: "semantic-relationship:a2d5c8f787045db8", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0c30bbb417da8f14", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d7d0351477edd5e8"}]->(target)
SET r += {candidate_id: "semantic-relationship:c76dbe8764ee818f", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d7d0351477edd5e8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3b15c4d3747a"})
MATCH (target {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5843bdfbea37b1dd"}]->(target)
SET r += {candidate_id: "semantic-relationship:e078c6fc5afced0d", confidence: 0.691808, evidence: ["cosine_similarity:0.583616"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:5843bdfbea37b1dd", source: "concept_mentions", status: "candidate", weight: 0.583616};

MATCH (source {node_id: "concept:canonical-concept-3f8bc83f0c3b"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:13a241eb2980bed7"}]->(target)
SET r += {candidate_id: "semantic-relationship:0d7797a52ba1f9ce", confidence: 0.691807, evidence: ["cosine_similarity:0.583614"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:13a241eb2980bed7", source: "concept_mentions", status: "candidate", weight: 0.583614};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-c59c5c439ef8"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:306b2a3c31f7f425"}]->(target)
SET r += {candidate_id: "semantic-relationship:604352b06b3d967f", confidence: 0.690636, evidence: ["cosine_similarity:0.581272"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:306b2a3c31f7f425", source: "concept_mentions", status: "candidate", weight: 0.581272};

MATCH (source {node_id: "concept:canonical-concept-9701408756ed"})
MATCH (target {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:99cc37012d42b92b"}]->(target)
SET r += {candidate_id: "semantic-relationship:0a44ec0f09507cdb", confidence: 0.690636, evidence: ["cosine_similarity:0.581272"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:99cc37012d42b92b", source: "concept_mentions", status: "candidate", weight: 0.581272};

MATCH (source {node_id: "concept:canonical-concept-c59c5c439ef8"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:3d3140da43273e51"}]->(target)
SET r += {candidate_id: "semantic-relationship:198bd70f08a7667f", confidence: 0.689012, evidence: ["cosine_similarity:0.578023"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:3d3140da43273e51", source: "concept_mentions", status: "candidate", weight: 0.578023};

MATCH (source {node_id: "concept:canonical-concept-cd2b87c04e3d"})
MATCH (target {node_id: "concept:canonical-concept-e837a5185381"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:be133996b14486a0"}]->(target)
SET r += {candidate_id: "semantic-relationship:a79eac491d033a98", confidence: 0.689012, evidence: ["cosine_similarity:0.578023"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:be133996b14486a0", source: "concept_mentions", status: "candidate", weight: 0.578023};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-3b15c4d3747a"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c9265d7cf5e76ed5"}]->(target)
SET r += {candidate_id: "semantic-relationship:96998d5b270aa7cf", confidence: 0.688843, evidence: ["cosine_similarity:0.577686"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:c9265d7cf5e76ed5", source: "concept_mentions", status: "candidate", weight: 0.577686};

MATCH (source {node_id: "concept:canonical-concept-23f394395e82"})
MATCH (target {node_id: "concept:canonical-concept-62e76573b23c"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6959932492e2300d"}]->(target)
SET r += {candidate_id: "semantic-relationship:53d111637a30792d", confidence: 0.688842, evidence: ["cosine_similarity:0.577684"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6959932492e2300d", source: "concept_mentions", status: "candidate", weight: 0.577684};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-812d6dca15fd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:483097b723e67248"}]->(target)
SET r += {candidate_id: "semantic-relationship:1776827248df3d3f", confidence: 0.685042, evidence: ["cosine_similarity:0.570083"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:483097b723e67248", source: "concept_mentions", status: "candidate", weight: 0.570083};

MATCH (source {node_id: "concept:canonical-concept-61752c9fc521"})
MATCH (target {node_id: "concept:canonical-concept-c60dc706a863"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d2a697c714f00ff3"}]->(target)
SET r += {candidate_id: "semantic-relationship:e38947e8445426df", confidence: 0.685042, evidence: ["cosine_similarity:0.570083"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:d2a697c714f00ff3", source: "concept_mentions", status: "candidate", weight: 0.570083};

MATCH (source {node_id: "concept:canonical-concept-812d6dca15fd"})
MATCH (target {node_id: "concept:canonical-concept-9701408756ed"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5b5686daccb08418"}]->(target)
SET r += {candidate_id: "semantic-relationship:ffe196664ed8d147", confidence: 0.684713, evidence: ["cosine_similarity:0.569425"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:5b5686daccb08418", source: "concept_mentions", status: "candidate", weight: 0.569425};

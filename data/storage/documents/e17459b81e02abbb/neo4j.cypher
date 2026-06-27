MERGE (n:Document {node_id: "document:e17459b81e02abbb"})
SET n:Document
SET n += {document_id: "e17459b81e02abbb", node_id: "document:e17459b81e02abbb", paragraph_count: 5, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/chunking_texto_largo.md", title: "Estrategias de aprendizaje autorregulado", word_count: 177};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-1"})
SET n:Section
SET n += {end_line: 1, heading_type: "markdown", level: 1, node_id: "section:e17459b81e02abbb:section-1", order: 1, section_id: "section-1", start_line: 1, title: "Estrategias de aprendizaje autorregulado"};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-2", numbering: "1", order: 2, section_id: "section-2", start_line: 3, title: "1. Planificacion"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:chunk-1"})
SET n:Chunk
SET n += {character_count: 847, chunk_id: "chunk-1", chunk_type: "split_paragraph", end_line: 5, node_id: "chunk:e17459b81e02abbb:chunk-1", order: 1, start_line: 5, text: "La planificacion del aprendizaje comienza cuando el estudiante identifica una meta concreta, revisa los recursos disponibles y decide una secuencia de acciones para avanzar. Esta etapa incluye reconocer conocimientos previos, anticipar dificultades, estimar el tiempo necesario y seleccionar estrategias de lectura, practica o explicacion. Cuando la planificacion es clara, el estudiante puede comparar su progreso con una intencion inicial y ajustar el esfuerzo antes de llegar al final de la actividad. En materiales educativos extensos, esta habilidad ayuda a dividir un tema grande en partes manejables, relacionar conceptos nuevos con conceptos conocidos y evitar que toda la informacion se procese como un bloque unico. La planificacion tambien permite detectar prerequisitos, ordenar actividades y construir una ruta de estudio mas estable.", word_count: 120};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:chunk-2"})
SET n:Chunk
SET n += {character_count: 121, chunk_id: "chunk-2", chunk_type: "split_paragraph", end_line: 5, node_id: "chunk:e17459b81e02abbb:chunk-2", order: 2, start_line: 5, text: "Si el texto es demasiado largo, conviene partirlo en fragmentos pequenos para conservar contexto sin saturar el analisis.", word_count: 18};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-3", numbering: "2", order: 3, section_id: "section-3", start_line: 7, title: "2. Monitoreo"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:chunk-3"})
SET n:Chunk
SET n += {character_count: 208, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 9, node_id: "chunk:e17459b81e02abbb:chunk-3", order: 3, start_line: 9, text: "El monitoreo ocurre durante la actividad. El estudiante observa si entiende, si puede explicar una idea con sus propias palabras y si los ejemplos resueltos realmente coinciden con el procedimiento estudiado.", word_count: 31};

MERGE (n:Concept {node_id: "concept:canonical-concept-5ed38dd077d2"})
SET n:Concept
SET n += {canonical_name: "planificacion", chunk_frequency: 2, concept_id: "canonical-concept-5ed38dd077d2", display_name: "planificacion", frequency: 5, mention_count: 2, node_id: "concept:canonical-concept-5ed38dd077d2", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.205535, section_frequency: 1, variant_terms: ["planificacion"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-a858929745ec"})
SET n:Concept
SET n += {canonical_name: "monitoreo", chunk_frequency: 1, concept_id: "canonical-concept-a858929745ec", display_name: "monitoreo", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-a858929745ec", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.184707, section_frequency: 1, variant_terms: ["monitoreo"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-aeb8c159f858"})
SET n:Concept
SET n += {canonical_name: "estrategia aprendizaje autorregulado", chunk_frequency: 3, concept_id: "canonical-concept-aeb8c159f858", display_name: "estrategias aprendizaje autorregulado", frequency: 3, mention_count: 3, node_id: "concept:canonical-concept-aeb8c159f858", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.138932, section_frequency: 2, variant_terms: ["estrategias aprendizaje autorregulado"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-474e5dce48b2"})
SET n:Concept
SET n += {canonical_name: "aprendizaje", chunk_frequency: 3, concept_id: "canonical-concept-474e5dce48b2", display_name: "aprendizaje", frequency: 4, mention_count: 3, node_id: "concept:canonical-concept-474e5dce48b2", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.126673, section_frequency: 2, variant_terms: ["aprendizaje"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-3feaf5d985f9"})
SET n:Concept
SET n += {canonical_name: "estrategia", chunk_frequency: 3, concept_id: "canonical-concept-3feaf5d985f9", display_name: "estrategias", frequency: 4, mention_count: 3, node_id: "concept:canonical-concept-3feaf5d985f9", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.126673, section_frequency: 2, variant_terms: ["estrategias"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-06e3f90dcaff"})
SET n:Concept
SET n += {canonical_name: "aprendizaje autorregulado", chunk_frequency: 3, concept_id: "canonical-concept-06e3f90dcaff", display_name: "aprendizaje autorregulado", frequency: 3, mention_count: 3, node_id: "concept:canonical-concept-06e3f90dcaff", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.122901, section_frequency: 2, variant_terms: ["aprendizaje autorregulado"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-b49d02d9907f"})
SET n:Concept
SET n += {canonical_name: "estrategia aprendizaje", chunk_frequency: 3, concept_id: "canonical-concept-b49d02d9907f", display_name: "estrategias aprendizaje", frequency: 3, mention_count: 3, node_id: "concept:canonical-concept-b49d02d9907f", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.122901, section_frequency: 2, variant_terms: ["estrategias aprendizaje"]};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-1"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:a74a3677bab7fdb0"}]->(target)
SET r += {order: 1, relationship_id: "relationship:a74a3677bab7fdb0"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-1"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-2"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:e63306679c9846ae"}]->(target)
SET r += {order: 2, relationship_id: "relationship:e63306679c9846ae"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:2dafac2274a28252"}]->(target)
SET r += {order: 1, relationship_id: "relationship:2dafac2274a28252"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:b8901fbcd299209c"}]->(target)
SET r += {order: 2, relationship_id: "relationship:b8901fbcd299209c"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-1"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-3"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:d369db3b38d9ffd6"}]->(target)
SET r += {order: 3, relationship_id: "relationship:d369db3b38d9ffd6"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:21a09faa98cf3bd3"}]->(target)
SET r += {order: 3, relationship_id: "relationship:21a09faa98cf3bd3"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d317ced346efc125"}]->(target)
SET r += {mention_id: "canonical-mention-8663564517a6", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 4, relationship_id: "relationship:d317ced346efc125", score: 0.025499, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:97b7eab6a734f4db"}]->(target)
SET r += {mention_id: "canonical-mention-82d4497de51b", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:97b7eab6a734f4db", score: 0.009901, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:89349e92e8f2ea14"}]->(target)
SET r += {mention_id: "canonical-mention-06e6f5692400", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:89349e92e8f2ea14", score: 0.009901, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:5c085468b0e9af31"}]->(target)
SET r += {mention_id: "canonical-mention-067a8b2a7eb2", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:5c085468b0e9af31", score: 0.006436, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-06e3f90dcaff"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e56d796ed5b4a641"}]->(target)
SET r += {mention_id: "canonical-mention-0bd27860839b", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:e56d796ed5b4a641", score: 0.005693, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:270c7e479c9d7fc0"}]->(target)
SET r += {mention_id: "canonical-mention-fe63648f7e2e", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:270c7e479c9d7fc0", score: 0.005693, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e02480c25eb227bb"}]->(target)
SET r += {mention_id: "canonical-mention-d13322a3bb2a", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:e02480c25eb227bb", score: 0.039394, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e9a2f4dfe603a577"}]->(target)
SET r += {mention_id: "canonical-mention-c522c22868b4", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:e9a2f4dfe603a577", score: 0.039021, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-06e3f90dcaff"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9cf36ba07260a7a6"}]->(target)
SET r += {mention_id: "canonical-mention-a193596cee71", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:9cf36ba07260a7a6", score: 0.034848, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:799929e7bc30e8d3"}]->(target)
SET r += {mention_id: "canonical-mention-a5e72eb960cb", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:799929e7bc30e8d3", score: 0.034848, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1aba8ebe88631587"}]->(target)
SET r += {mention_id: "canonical-mention-f5905008f571", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:1aba8ebe88631587", score: 0.030303, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:73009c9e297f58b5"}]->(target)
SET r += {mention_id: "canonical-mention-0d05d99e13a9", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:73009c9e297f58b5", score: 0.030303, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:5f0f46a0087d827d"}]->(target)
SET r += {mention_id: "canonical-mention-8b2e8e1208f5", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:5f0f46a0087d827d", score: 0.061569, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0bff805f86fb7aac"}]->(target)
SET r += {mention_id: "canonical-mention-a0ca5a194997", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:0bff805f86fb7aac", score: 0.023636, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-06e3f90dcaff"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:a5bb8caa25757df3"}]->(target)
SET r += {mention_id: "canonical-mention-3ccb0cb11126", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:a5bb8caa25757df3", score: 0.020909, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:52f7e4f11a04090c"}]->(target)
SET r += {mention_id: "canonical-mention-bff66f8cb60a", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:52f7e4f11a04090c", score: 0.020909, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:13972659dade9485"}]->(target)
SET r += {mention_id: "canonical-mention-4d0f7ec8ee54", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:13972659dade9485", score: 0.018182, source: "chunk"};

MATCH (source {node_id: "chunk:e17459b81e02abbb:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b51177553f4a0f51"}]->(target)
SET r += {mention_id: "canonical-mention-811b3a3344a8", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:b51177553f4a0f51", score: 0.018182, source: "chunk"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:aed721403a843607"}]->(target)
SET r += {mention_count: 2, occurrence_count: 5, relationship_id: "relationship:aed721403a843607", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:fc0506f297d4a598"}]->(target)
SET r += {mention_count: 2, occurrence_count: 3, relationship_id: "relationship:fc0506f297d4a598", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:dcb50d65b12dbc9f"}]->(target)
SET r += {mention_count: 2, occurrence_count: 3, relationship_id: "relationship:dcb50d65b12dbc9f", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:79ce3ad4124785b4"}]->(target)
SET r += {mention_count: 2, occurrence_count: 2, relationship_id: "relationship:79ce3ad4124785b4", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "concept:canonical-concept-06e3f90dcaff"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:29b8cae544e12c52"}]->(target)
SET r += {mention_count: 2, occurrence_count: 2, relationship_id: "relationship:29b8cae544e12c52", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:812007069a94541e"}]->(target)
SET r += {mention_count: 2, occurrence_count: 2, relationship_id: "relationship:812007069a94541e", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:89a0eafff8f2ffba"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:89a0eafff8f2ffba", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:45b4dcdb33c29e76"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:45b4dcdb33c29e76", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "concept:canonical-concept-06e3f90dcaff"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:68c410d036a869e2"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:68c410d036a869e2", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3b9723704c4680f8"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:3b9723704c4680f8", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:bd1223beb2526286"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:bd1223beb2526286", source: "section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4713a8b8a11d84d5"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:4713a8b8a11d84d5", source: "section"};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:8922409af9e9ceb7"}]->(target)
SET r += {candidate_id: "semantic-relationship:219c5bf74337e123", confidence: 0.65, evidence: ["section:section-1->section-2"], method: "title_subtitle_hierarchy", reason: "A parent-section concept is connected to a child-section concept.", relationship_id: "relationship:8922409af9e9ceb7", source: "section_hierarchy", status: "candidate", weight: 0.75};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:bc74d79ec00adcf5"}]->(target)
SET r += {candidate_id: "semantic-relationship:da18ce01cf97786f", confidence: 0.65, evidence: ["section:section-1->section-3"], method: "title_subtitle_hierarchy", reason: "A parent-section concept is connected to a child-section concept.", relationship_id: "relationship:bc74d79ec00adcf5", source: "section_hierarchy", status: "candidate", weight: 0.75};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:2f0aa9dd2991011a"}]->(target)
SET r += {candidate_id: "semantic-relationship:20344af003502d93", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:2f0aa9dd2991011a", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:b9f4572952e27da4"}]->(target)
SET r += {candidate_id: "semantic-relationship:905c3323f52d64cb", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:b9f4572952e27da4", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:5d830f406770cf1b"}]->(target)
SET r += {candidate_id: "semantic-relationship:c3cf922e08bb76fb", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:5d830f406770cf1b", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6033bde586e6f3a7"}]->(target)
SET r += {candidate_id: "semantic-relationship:66561134df96e22f", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6033bde586e6f3a7", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9df95d92b96ac811"}]->(target)
SET r += {candidate_id: "semantic-relationship:3205b99714ab7e9a", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9df95d92b96ac811", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6a19480e776f8f5a"}]->(target)
SET r += {candidate_id: "semantic-relationship:2ee40864cb70e27c", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6a19480e776f8f5a", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-aeb8c159f858"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:20e2a4a1c05ffb98"}]->(target)
SET r += {candidate_id: "semantic-relationship:24f90a5751ca08b9", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:20e2a4a1c05ffb98", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bc8075f7315e757e"}]->(target)
SET r += {candidate_id: "semantic-relationship:a50e8c0cb20ace51", confidence: 0.8, evidence: ["cosine_similarity:0.991038"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:bc8075f7315e757e", source: "concept_mentions", status: "candidate", weight: 0.991038};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d27375d7cd003064"}]->(target)
SET r += {candidate_id: "semantic-relationship:f10175c5bbe9b841", confidence: 0.8, evidence: ["cosine_similarity:0.991038"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:d27375d7cd003064", source: "concept_mentions", status: "candidate", weight: 0.991038};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bca621a100bac6a6"}]->(target)
SET r += {candidate_id: "semantic-relationship:afde9c2e53071f7a", confidence: 0.8, evidence: ["cosine_similarity:0.991037"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:bca621a100bac6a6", source: "concept_mentions", status: "candidate", weight: 0.991037};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1cb0418425230500"}]->(target)
SET r += {candidate_id: "semantic-relationship:0c240cd46a354b11", confidence: 0.8, evidence: ["cosine_similarity:0.991037"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:1cb0418425230500", source: "concept_mentions", status: "candidate", weight: 0.991037};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5041381a512605fc"}]->(target)
SET r += {candidate_id: "semantic-relationship:3103ba92cb33a818", confidence: 0.8, evidence: ["cosine_similarity:0.991037"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:5041381a512605fc", source: "concept_mentions", status: "candidate", weight: 0.991037};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:de47781362f86910"}]->(target)
SET r += {candidate_id: "semantic-relationship:c89b633b259c4605", confidence: 0.8, evidence: ["cosine_similarity:0.991037"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:de47781362f86910", source: "concept_mentions", status: "candidate", weight: 0.991037};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9074843db0c36dab"}]->(target)
SET r += {candidate_id: "semantic-relationship:742d25ea8954e08f", confidence: 0.8, evidence: ["cosine_similarity:0.83878"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9074843db0c36dab", source: "concept_mentions", status: "candidate", weight: 0.83878};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d67a473027e5de2c"}]->(target)
SET r += {candidate_id: "semantic-relationship:b22638a40ad49315", confidence: 0.8, evidence: ["cosine_similarity:0.83878"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:d67a473027e5de2c", source: "concept_mentions", status: "candidate", weight: 0.83878};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:863096c8398dcc31"}]->(target)
SET r += {candidate_id: "semantic-relationship:36e2b2320fbcdfe4", confidence: 0.793387, evidence: ["cosine_similarity:0.786775"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:863096c8398dcc31", source: "concept_mentions", status: "candidate", weight: 0.786775};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:122b19b5fecf7f9c"}]->(target)
SET r += {candidate_id: "semantic-relationship:3a4a6c115490c0fa", confidence: 0.793383, evidence: ["cosine_similarity:0.786766"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:122b19b5fecf7f9c", source: "concept_mentions", status: "candidate", weight: 0.786766};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:64d72d1a25cd368e"}]->(target)
SET r += {candidate_id: "semantic-relationship:eb768a79f3604fc1", confidence: 0.793383, evidence: ["cosine_similarity:0.786766"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:64d72d1a25cd368e", source: "concept_mentions", status: "candidate", weight: 0.786766};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:013fafc66433265b"}]->(target)
SET r += {candidate_id: "semantic-relationship:7e80290ad0917484", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:013fafc66433265b", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9a786292401c7d0a"}]->(target)
SET r += {candidate_id: "semantic-relationship:8ad91d8822ac8bda", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:9a786292401c7d0a", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:42db6e1bd6a2fe35"}]->(target)
SET r += {candidate_id: "semantic-relationship:d4857681dfc35d26", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:42db6e1bd6a2fe35", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1d15613368a4104c"}]->(target)
SET r += {candidate_id: "semantic-relationship:7db9c6ff81a09b07", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1d15613368a4104c", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a578d61a650f2ffc"}]->(target)
SET r += {candidate_id: "semantic-relationship:910b12b99c59a387", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a578d61a650f2ffc", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6402b3a75bb0a9e7"}]->(target)
SET r += {candidate_id: "semantic-relationship:2affc253740d37be", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:6402b3a75bb0a9e7", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0c578f1142dec888"}]->(target)
SET r += {candidate_id: "semantic-relationship:c42bdfe43751b159", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0c578f1142dec888", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f6673bf37f931e6d"}]->(target)
SET r += {candidate_id: "semantic-relationship:ee7abe827b75c77f", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:f6673bf37f931e6d", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:3aa4db8d256b7f8f"}]->(target)
SET r += {candidate_id: "semantic-relationship:b8f7464c9baa483e", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:3aa4db8d256b7f8f", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-aeb8c159f858"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:457369ab8e5ad4dc"}]->(target)
SET r += {candidate_id: "semantic-relationship:6fe11911d88a6f55", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:457369ab8e5ad4dc", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:360d9edb0c05185e"}]->(target)
SET r += {candidate_id: "semantic-relationship:69b6f8a4e6dc49af", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:360d9edb0c05185e", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b0b9d847e8ec0885"}]->(target)
SET r += {candidate_id: "semantic-relationship:e3ddc902607f2bb1", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:b0b9d847e8ec0885", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ae3c8778bb2ee897"}]->(target)
SET r += {candidate_id: "semantic-relationship:83bbf49276762479", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ae3c8778bb2ee897", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:40d38da70a6834d0"}]->(target)
SET r += {candidate_id: "semantic-relationship:acb6f4378a612e68", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:40d38da70a6834d0", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:27ebaff58b885975"}]->(target)
SET r += {candidate_id: "semantic-relationship:36e53abd961ca72b", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:27ebaff58b885975", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a8f7759eda4c8d6f"}]->(target)
SET r += {candidate_id: "semantic-relationship:5fee9e84197c69ab", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a8f7759eda4c8d6f", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:2c00910deef6ac17"}]->(target)
SET r += {candidate_id: "semantic-relationship:fd2a534b2c1aae18", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:2c00910deef6ac17", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1e90816526f02479"}]->(target)
SET r += {candidate_id: "semantic-relationship:11d88f0c09266ad6", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1e90816526f02479", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-a858929745ec"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d3dd75fddcd03ae5"}]->(target)
SET r += {candidate_id: "semantic-relationship:b798d1b3e7d52b8c", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d3dd75fddcd03ae5", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-a858929745ec"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:02467e6074f12fb5"}]->(target)
SET r += {candidate_id: "semantic-relationship:26d7628c2f8045da", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:02467e6074f12fb5", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bea5b65ccbd297cf"}]->(target)
SET r += {candidate_id: "semantic-relationship:5df4c6ea56cb8722", confidence: 0.654762, evidence: ["cosine_similarity:0.509524"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:bea5b65ccbd297cf", source: "concept_mentions", status: "candidate", weight: 0.509524};

MATCH (source {node_id: "concept:canonical-concept-a858929745ec"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:dc401634a3870719"}]->(target)
SET r += {candidate_id: "semantic-relationship:bf9f2d3dd46d38b5", confidence: 0.654762, evidence: ["cosine_similarity:0.509524"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:dc401634a3870719", source: "concept_mentions", status: "candidate", weight: 0.509524};

MATCH (source {node_id: "concept:canonical-concept-a858929745ec"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9b00ad0e3cd9eb90"}]->(target)
SET r += {candidate_id: "semantic-relationship:e367a2db55c9ca8c", confidence: 0.654757, evidence: ["cosine_similarity:0.509514"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9b00ad0e3cd9eb90", source: "concept_mentions", status: "candidate", weight: 0.509514};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:8c305a954662a5cd"}]->(target)
SET r += {candidate_id: "semantic-relationship:375dc5d516e8766c", confidence: 0.647711, evidence: ["cosine_similarity:0.495423"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:8c305a954662a5cd", source: "concept_mentions", status: "candidate", weight: 0.495423};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:20177e8e81448044"}]->(target)
SET r += {candidate_id: "semantic-relationship:64432b942ae8b676", confidence: 0.647711, evidence: ["cosine_similarity:0.495423"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:20177e8e81448044", source: "concept_mentions", status: "candidate", weight: 0.495423};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-3feaf5d985f9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:da4f8b55d2f5849c"}]->(target)
SET r += {candidate_id: "semantic-relationship:a0485b5dbf741352", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:da4f8b55d2f5849c", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1c156680c3c11df4"}]->(target)
SET r += {candidate_id: "semantic-relationship:8488fd7446a0640e", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:1c156680c3c11df4", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:2b9a60f8b747e63c"}]->(target)
SET r += {candidate_id: "semantic-relationship:90690c33b7932fdd", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:2b9a60f8b747e63c", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:65e7db7f41ee2057"}]->(target)
SET r += {candidate_id: "semantic-relationship:b1c8603c9bfb001d", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:65e7db7f41ee2057", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-474e5dce48b2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f2489a271ad1e012"}]->(target)
SET r += {candidate_id: "semantic-relationship:65a29b43692a9745", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:f2489a271ad1e012", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:8ab7cd955ed36a12"}]->(target)
SET r += {candidate_id: "semantic-relationship:834f70e14d1f6402", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:8ab7cd955ed36a12", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:46e0f11bb2704ddf"}]->(target)
SET r += {candidate_id: "semantic-relationship:a29ac557f9534741", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:46e0f11bb2704ddf", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:21940c08aa16463b"}]->(target)
SET r += {candidate_id: "semantic-relationship:17a909b9d14eff98", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:21940c08aa16463b", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:3822961d2d5cc353"}]->(target)
SET r += {candidate_id: "semantic-relationship:2599d36bec25db8e", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:3822961d2d5cc353", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-aeb8c159f858"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:3f7f7e78441e7c68"}]->(target)
SET r += {candidate_id: "semantic-relationship:0c8cc5fff9b09ef2", confidence: 0.55, evidence: ["section:section-2", "section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:3f7f7e78441e7c68", source: "section", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e75eba9391f9b326"}]->(target)
SET r += {candidate_id: "semantic-relationship:f7dbf9b7a18794f9", confidence: 0.55, evidence: ["section:section-2"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:e75eba9391f9b326", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-06e3f90dcaff"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a44f02136fddeee9"}]->(target)
SET r += {candidate_id: "semantic-relationship:0a25a4726ef4e5a1", confidence: 0.55, evidence: ["section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:a44f02136fddeee9", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c1270cb08e0e6f65"}]->(target)
SET r += {candidate_id: "semantic-relationship:0e2994c62f8e70e2", confidence: 0.55, evidence: ["section:section-2"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:c1270cb08e0e6f65", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-3feaf5d985f9"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:267043211ae3b8d4"}]->(target)
SET r += {candidate_id: "semantic-relationship:8fd914bae2f9e1cf", confidence: 0.55, evidence: ["section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:267043211ae3b8d4", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-5ed38dd077d2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1f8cab9d1b504b8b"}]->(target)
SET r += {candidate_id: "semantic-relationship:ed7c756042aa3a91", confidence: 0.55, evidence: ["section:section-2"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:1f8cab9d1b504b8b", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-474e5dce48b2"})
MATCH (target {node_id: "concept:canonical-concept-a858929745ec"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bdd18d3d934e0469"}]->(target)
SET r += {candidate_id: "semantic-relationship:1c7bde4dbac54594", confidence: 0.55, evidence: ["section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:bdd18d3d934e0469", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a2864b7b75887d11"}]->(target)
SET r += {candidate_id: "semantic-relationship:e908b26efb71f795", confidence: 0.55, evidence: ["section:section-2"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:a2864b7b75887d11", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-5ed38dd077d2"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:532f371cebac7ef2"}]->(target)
SET r += {candidate_id: "semantic-relationship:80fc82943aaf10f0", confidence: 0.55, evidence: ["section:section-2"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:532f371cebac7ef2", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-a858929745ec"})
MATCH (target {node_id: "concept:canonical-concept-aeb8c159f858"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6766442779b617d7"}]->(target)
SET r += {candidate_id: "semantic-relationship:9153dfa9fedb6d10", confidence: 0.55, evidence: ["section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:6766442779b617d7", source: "section", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-a858929745ec"})
MATCH (target {node_id: "concept:canonical-concept-b49d02d9907f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:294d92e6a8a38662"}]->(target)
SET r += {candidate_id: "semantic-relationship:e1dd02561e252dca", confidence: 0.55, evidence: ["section:section-3"], method: "section_cooccurrence", reason: "Concepts are mentioned within the same section.", relationship_id: "relationship:294d92e6a8a38662", source: "section", status: "candidate", weight: 0.5};

CREATE CONSTRAINT document_node_id IF NOT EXISTS FOR (n:Document) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT section_node_id IF NOT EXISTS FOR (n:Section) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT chunk_node_id IF NOT EXISTS FOR (n:Chunk) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT concept_node_id IF NOT EXISTS FOR (n:Concept) REQUIRE n.node_id IS UNIQUE;

CREATE INDEX document_title IF NOT EXISTS FOR (n:Document) ON (n.title);

CREATE INDEX section_title IF NOT EXISTS FOR (n:Section) ON (n.title);

CREATE INDEX concept_canonical_name IF NOT EXISTS FOR (n:Concept) ON (n.canonical_name);

CREATE INDEX has_section_relationship_id IF NOT EXISTS FOR ()-[r:HAS_SECTION]-() ON (r.relationship_id);

CREATE INDEX has_subsection_relationship_id IF NOT EXISTS FOR ()-[r:HAS_SUBSECTION]-() ON (r.relationship_id);

CREATE INDEX has_chunk_relationship_id IF NOT EXISTS FOR ()-[r:HAS_CHUNK]-() ON (r.relationship_id);

CREATE INDEX mentions_relationship_id IF NOT EXISTS FOR ()-[r:MENTIONS]-() ON (r.relationship_id);

CREATE INDEX related_to_relationship_id IF NOT EXISTS FOR ()-[r:RELATED_TO]-() ON (r.relationship_id);

CREATE INDEX prerequisite_candidate_relationship_id IF NOT EXISTS FOR ()-[r:PREREQUISITE_CANDIDATE]-() ON (r.relationship_id);

// Document: Algebra lineal para vectores
// Document ID: 9c2e67b1cbeb1480
MERGE (n:Document {node_id: "document:9c2e67b1cbeb1480"})
SET n:Document
SET n += {document_id: "9c2e67b1cbeb1480", node_id: "document:9c2e67b1cbeb1480", paragraph_count: 11, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/algebra_lineal.md", title: "Algebra lineal para vectores", word_count: 117};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-1"})
SET n:Section
SET n += {end_line: 1, heading_type: "markdown", level: 1, node_id: "section:9c2e67b1cbeb1480:section-1", order: 1, section_id: "section-1", start_line: 1, title: "Algebra lineal para vectores"};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "markdown", level: 2, node_id: "section:9c2e67b1cbeb1480:section-2", numbering: "1", order: 2, section_id: "section-2", start_line: 3, title: "1. Introduccion"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
SET n:Chunk
SET n += {character_count: 162, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:9c2e67b1cbeb1480:chunk-1", order: 1, start_line: 5, text: "El algebra lineal estudia vectores, matrices y transformaciones lineales. Un vector puede representar una posicion, una direccion o una lista ordenada de valores.", word_count: 23};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 3, node_id: "section:9c2e67b1cbeb1480:section-3", numbering: "1.1", order: 3, section_id: "section-3", start_line: 7, title: "1.1 Vectores"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
SET n:Chunk
SET n += {character_count: 151, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:9c2e67b1cbeb1480:chunk-2", order: 2, start_line: 9, text: "Un vector tiene magnitud y direccion. En aprendizaje automatico, los vectores tambien pueden representar caracteristicas de objetos, textos o usuarios.", word_count: 20};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-4"})
SET n:Section
SET n += {end_line: 13, heading_type: "markdown", level: 3, node_id: "section:9c2e67b1cbeb1480:section-4", numbering: "1.2", order: 4, section_id: "section-4", start_line: 11, title: "1.2 Matrices"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
SET n:Chunk
SET n += {character_count: 148, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:9c2e67b1cbeb1480:chunk-3", order: 3, start_line: 13, text: "Una matriz organiza numeros en filas y columnas. Las matrices permiten describir sistemas de ecuaciones y transformar vectores de un espacio a otro.", word_count: 23};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-5"})
SET n:Section
SET n += {end_line: 17, heading_type: "markdown", level: 2, node_id: "section:9c2e67b1cbeb1480:section-5", numbering: "2", order: 5, section_id: "section-5", start_line: 15, title: "2. Idea importante"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
SET n:Chunk
SET n += {character_count: 154, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 17, node_id: "chunk:9c2e67b1cbeb1480:chunk-4", order: 4, start_line: 17, text: "Los espacios vectoriales permiten estudiar relaciones entre objetos mediante operaciones como suma, multiplicacion por escalares y combinaciones lineales.", word_count: 18};

MERGE (n:Section {node_id: "section:9c2e67b1cbeb1480:section-6"})
SET n:Section
SET n += {end_line: 21, heading_type: "markdown", level: 2, node_id: "section:9c2e67b1cbeb1480:section-6", order: 6, section_id: "section-6", start_line: 19, title: "Conclusion"};

MERGE (n:Chunk {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
SET n:Chunk
SET n += {character_count: 111, chunk_id: "chunk-5", chunk_type: "paragraph", end_line: 21, node_id: "chunk:9c2e67b1cbeb1480:chunk-5", order: 5, start_line: 21, text: "El tema central es que vectores y matrices funcionan como lenguaje comun para modelar datos y transformaciones.", word_count: 17};

MERGE (n:Concept {node_id: "concept:canonical-concept-b0d51c58c8b9"})
SET n:Concept
SET n += {canonical_name: "vector", chunk_frequency: 5, concept_id: "canonical-concept-b0d51c58c8b9", display_name: "vectores", frequency: 12, mention_count: 4, node_id: "concept:canonical-concept-b0d51c58c8b9", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.933804, section_frequency: 5, variant_terms: ["vector", "vectores"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-c3568c25c436"})
SET n:Concept
SET n += {canonical_name: "lineal", chunk_frequency: 5, concept_id: "canonical-concept-c3568c25c436", display_name: "lineal", frequency: 8, mention_count: 2, node_id: "concept:canonical-concept-c3568c25c436", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.486862, section_frequency: 5, variant_terms: ["lineal", "lineales"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-10e399e84efc"})
SET n:Concept
SET n += {canonical_name: "algebra lineal", chunk_frequency: 5, concept_id: "canonical-concept-10e399e84efc", display_name: "algebra lineal", frequency: 6, mention_count: 3, node_id: "concept:canonical-concept-10e399e84efc", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.381405, section_frequency: 5, variant_terms: ["algebra lineal"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-a5ebcbe2893f"})
SET n:Concept
SET n += {canonical_name: "matriz", chunk_frequency: 3, concept_id: "canonical-concept-a5ebcbe2893f", display_name: "matrices", frequency: 4, mention_count: 1, node_id: "concept:canonical-concept-a5ebcbe2893f", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.33558, section_frequency: 3, variant_terms: ["matrices"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-ec752d1d10b6"})
SET n:Concept
SET n += {canonical_name: "algebra", chunk_frequency: 5, concept_id: "canonical-concept-ec752d1d10b6", display_name: "algebra", frequency: 6, mention_count: 1, node_id: "concept:canonical-concept-ec752d1d10b6", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.331657, section_frequency: 5, variant_terms: ["algebra"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-07f596a83279"})
SET n:Concept
SET n += {canonical_name: "algebra lineal vector", chunk_frequency: 5, concept_id: "canonical-concept-07f596a83279", display_name: "algebra lineal vectores", frequency: 5, mention_count: 3, node_id: "concept:canonical-concept-07f596a83279", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.32282, section_frequency: 5, variant_terms: ["algebra lineal vectores"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-417aec00781a"})
SET n:Concept
SET n += {canonical_name: "lineal vector", chunk_frequency: 5, concept_id: "canonical-concept-417aec00781a", display_name: "lineal vectores", frequency: 5, mention_count: 2, node_id: "concept:canonical-concept-417aec00781a", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.285572, section_frequency: 5, variant_terms: ["lineal vectores"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-e7fb8dff526f"})
SET n:Concept
SET n += {canonical_name: "vector matriz", chunk_frequency: 2, concept_id: "canonical-concept-e7fb8dff526f", display_name: "vectores matrices", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-e7fb8dff526f", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.210938, section_frequency: 2, variant_terms: ["vectores matrices"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-cec5b52c461f"})
SET n:Concept
SET n += {canonical_name: "transformacion", chunk_frequency: 2, concept_id: "canonical-concept-cec5b52c461f", display_name: "transformaciones", frequency: 2, mention_count: 0, node_id: "concept:canonical-concept-cec5b52c461f", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.183424, section_frequency: 2, variant_terms: ["transformaciones"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-c58bf55b8da4"})
SET n:Concept
SET n += {canonical_name: "objeto", chunk_frequency: 2, concept_id: "canonical-concept-c58bf55b8da4", display_name: "objetos", frequency: 2, mention_count: 2, node_id: "concept:canonical-concept-c58bf55b8da4", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.163408, section_frequency: 2, variant_terms: ["objetos"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-6da516d844b3"})
SET n:Concept
SET n += {canonical_name: "permiten", chunk_frequency: 2, concept_id: "canonical-concept-6da516d844b3", display_name: "permiten", frequency: 2, mention_count: 2, node_id: "concept:canonical-concept-6da516d844b3", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.158272, section_frequency: 2, variant_terms: ["permiten"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-a0d3005ea234"})
SET n:Concept
SET n += {canonical_name: "direccion", chunk_frequency: 2, concept_id: "canonical-concept-a0d3005ea234", display_name: "direccion", frequency: 2, mention_count: 2, node_id: "concept:canonical-concept-a0d3005ea234", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.149299, section_frequency: 2, variant_terms: ["direccion"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-99533f6472a2"})
SET n:Concept
SET n += {canonical_name: "representar", chunk_frequency: 2, concept_id: "canonical-concept-99533f6472a2", display_name: "representar", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-99533f6472a2", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.149299, section_frequency: 2, variant_terms: ["representar"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-8cb6279a8e1b"})
SET n:Concept
SET n += {canonical_name: "central", chunk_frequency: 1, concept_id: "canonical-concept-8cb6279a8e1b", display_name: "central", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-8cb6279a8e1b", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.139907, section_frequency: 1, variant_terms: ["central"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-38ea3835b477"})
SET n:Concept
SET n += {canonical_name: "comun", chunk_frequency: 1, concept_id: "canonical-concept-38ea3835b477", display_name: "comun", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-38ea3835b477", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.139907, section_frequency: 1, variant_terms: ["comun"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-ba70ddc5159d"})
SET n:Concept
SET n += {canonical_name: "dato", chunk_frequency: 1, concept_id: "canonical-concept-ba70ddc5159d", display_name: "datos", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-ba70ddc5159d", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.139907, section_frequency: 1, variant_terms: ["datos"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-8e388de6a7bd"})
SET n:Concept
SET n += {canonical_name: "funcionan", chunk_frequency: 1, concept_id: "canonical-concept-8e388de6a7bd", display_name: "funcionan", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-8e388de6a7bd", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.139907, section_frequency: 1, variant_terms: ["funcionan"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-e2a94f3ec336"})
SET n:Concept
SET n += {canonical_name: "lenguaje", chunk_frequency: 1, concept_id: "canonical-concept-e2a94f3ec336", display_name: "lenguaje", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-e2a94f3ec336", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.139907, section_frequency: 1, variant_terms: ["lenguaje"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-e34c51af4dbd"})
SET n:Concept
SET n += {canonical_name: "modelar", chunk_frequency: 1, concept_id: "canonical-concept-e34c51af4dbd", display_name: "modelar", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-e34c51af4dbd", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.139907, section_frequency: 1, variant_terms: ["modelar"]};

MATCH (source {node_id: "document:9c2e67b1cbeb1480"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-1"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:6e84c05dd74f9f88"}]->(target)
SET r += {order: 1, relationship_id: "relationship:6e84c05dd74f9f88"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-1"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-2"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:44e922e891af9f0f"}]->(target)
SET r += {order: 2, relationship_id: "relationship:44e922e891af9f0f"};

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

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-1"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-5"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:83252f9671278077"}]->(target)
SET r += {order: 5, relationship_id: "relationship:83252f9671278077"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:c227385024237b11"}]->(target)
SET r += {order: 4, relationship_id: "relationship:c227385024237b11"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-1"})
MATCH (target {node_id: "section:9c2e67b1cbeb1480:section-6"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:4ac8064bd1e18646"}]->(target)
SET r += {order: 6, relationship_id: "relationship:4ac8064bd1e18646"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:9147abff8152e3b4"}]->(target)
SET r += {order: 5, relationship_id: "relationship:9147abff8152e3b4"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:64e0c8c8ce13c495"}]->(target)
SET r += {mention_id: "canonical-mention-3ba969451d96", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:64e0c8c8ce13c495", score: 0.047917, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9f155ddde095fe9b"}]->(target)
SET r += {mention_id: "canonical-mention-6e45ba6a12cc", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:9f155ddde095fe9b", score: 0.041667, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6c1ffcc361cee063"}]->(target)
SET r += {mention_id: "canonical-mention-a221cb7d6120", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:6c1ffcc361cee063", score: 0.041667, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:511e6e3a8e98adae"}]->(target)
SET r += {mention_id: "canonical-mention-3830df58909a", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:511e6e3a8e98adae", score: 0.041667, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-e7fb8dff526f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:8d33a3291f4b7a17"}]->(target)
SET r += {mention_id: "canonical-mention-2a9b30f17754", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:8d33a3291f4b7a17", score: 0.040565, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d6f68992c911c22b"}]->(target)
SET r += {mention_id: "canonical-mention-2d89323d4551", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:d6f68992c911c22b", score: 0.035274, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f94f3b94fafa8cf0"}]->(target)
SET r += {mention_id: "canonical-mention-e9a2314eb450", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 3, relationship_id: "relationship:f94f3b94fafa8cf0", score: 0.069767, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3d912ada000dfebc"}]->(target)
SET r += {mention_id: "canonical-mention-6b1b6923c3a4", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:3d912ada000dfebc", score: 0.039376, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4b445d88b32fcb18"}]->(target)
SET r += {mention_id: "canonical-mention-b5129c3c807a", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:4b445d88b32fcb18", score: 0.039376, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-99533f6472a2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e98bac507ac6e8b9"}]->(target)
SET r += {mention_id: "canonical-mention-b20898bc9be4", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:e98bac507ac6e8b9", score: 0.039376, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:2d959f336e1ba7fd"}]->(target)
SET r += {mention_id: "canonical-mention-88453647ea7f", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:2d959f336e1ba7fd", score: 0.039376, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:7db09413808182c5"}]->(target)
SET r += {mention_id: "canonical-mention-38a0edc0a906", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:7db09413808182c5", score: 0.030233, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:93f356304e2eef4c"}]->(target)
SET r += {mention_id: "canonical-mention-d45b0a221c85", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:93f356304e2eef4c", score: 0.061107, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:ba556bd6ca743801"}]->(target)
SET r += {mention_id: "canonical-mention-d23724df0cea", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:ba556bd6ca743801", score: 0.043478, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:fd1ad3099fc3a5f7"}]->(target)
SET r += {mention_id: "canonical-mention-7cc4d935b4f5", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:fd1ad3099fc3a5f7", score: 0.036808, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:620e8143f328ca31"}]->(target)
SET r += {mention_id: "canonical-mention-c2b27fc09bdd", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:620e8143f328ca31", score: 0.028261, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4d803966c97ab90c"}]->(target)
SET r += {mention_id: "canonical-mention-8876d33f8a3e", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:4d803966c97ab90c", score: 0.025, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:70976e0297034eda"}]->(target)
SET r += {mention_id: "canonical-mention-5dfe9fc53c4f", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:70976e0297034eda", score: 0.025, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:8ec47c0d974a9020"}]->(target)
SET r += {mention_id: "canonical-mention-c36659e5420e", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:8ec47c0d974a9020", score: 0.042329, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1627b70259874673"}]->(target)
SET r += {mention_id: "canonical-mention-9041f63c6433", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:1627b70259874673", score: 0.042329, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:03d1b2d2949829fe"}]->(target)
SET r += {mention_id: "canonical-mention-aaa4ff19f1b5", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:03d1b2d2949829fe", score: 0.042329, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:c7025b5d0baf36ec"}]->(target)
SET r += {mention_id: "canonical-mention-91ab5ae6ed9b", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:c7025b5d0baf36ec", score: 0.0325, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d674caec7f0ecf6e"}]->(target)
SET r += {mention_id: "canonical-mention-b1ac19e40cc3", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:d674caec7f0ecf6e", score: 0.02875, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b9e967430dd3ebd1"}]->(target)
SET r += {mention_id: "canonical-mention-4fc997ea143f", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:b9e967430dd3ebd1", score: 0.02875, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3b15aed173a94a87"}]->(target)
SET r += {mention_id: "canonical-mention-2c0e28f93950", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:3b15aed173a94a87", score: 0.069954, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-38ea3835b477"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:7709b547d549b19e"}]->(target)
SET r += {mention_id: "canonical-mention-280b2b6bc9e1", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:7709b547d549b19e", score: 0.069954, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:77be4c30bc53e3fd"}]->(target)
SET r += {mention_id: "canonical-mention-b65c17a879d3", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:77be4c30bc53e3fd", score: 0.069954, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:419edb3b9a166f98"}]->(target)
SET r += {mention_id: "canonical-mention-f95f4c27b66f", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:419edb3b9a166f98", score: 0.069954, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1069d79b36389de0"}]->(target)
SET r += {mention_id: "canonical-mention-f91b4d593c1f", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:1069d79b36389de0", score: 0.069954, source: "chunk"};

MATCH (source {node_id: "chunk:9c2e67b1cbeb1480:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:a09977065dc21e83"}]->(target)
SET r += {mention_id: "canonical-mention-7bbd32d2b562", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:a09977065dc21e83", score: 0.069954, source: "chunk"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0f6ac5105102c340"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:0f6ac5105102c340", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:622feced8a6b5289"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:622feced8a6b5289", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0d23ab2ff3d06de6"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:0d23ab2ff3d06de6", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:16afb4301462c8f1"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:16afb4301462c8f1", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "concept:canonical-concept-e7fb8dff526f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:664f75706063a080"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:664f75706063a080", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-2"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:23d9d9e786f417bc"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:23d9d9e786f417bc", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-3"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:a7bfbc4e1def3ae2"}]->(target)
SET r += {mention_count: 2, occurrence_count: 4, relationship_id: "relationship:a7bfbc4e1def3ae2", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-3"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3d98794930f06833"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:3d98794930f06833", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-3"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:486c39c05935035a"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:486c39c05935035a", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-3"})
MATCH (target {node_id: "concept:canonical-concept-99533f6472a2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b854b994a74dd069"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:b854b994a74dd069", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-3"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b1c6458ed834e438"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:b1c6458ed834e438", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9bc91cf31ac6611b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:9bc91cf31ac6611b", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:11679ca2dd839b0d"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:11679ca2dd839b0d", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:fb208657e8083262"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:fb208657e8083262", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:341be7be197a1c4c"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:341be7be197a1c4c", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:49e9eb158ea98050"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:49e9eb158ea98050", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-4"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3f13fb83339cec37"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:3f13fb83339cec37", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4bb928484aea6ad4"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:4bb928484aea6ad4", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:c86bae15a47e0e8b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:c86bae15a47e0e8b", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f899ac2eeb42a756"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:f899ac2eeb42a756", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:142e9630f243e188"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:142e9630f243e188", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:ccdad6978898a5fa"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:ccdad6978898a5fa", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-5"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:3e865cf489adee9b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:3e865cf489adee9b", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6c5a4711e6920082"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:6c5a4711e6920082", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "concept:canonical-concept-38ea3835b477"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:204681d7fd32e26c"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:204681d7fd32e26c", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f43af1b54ffc0c10"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:f43af1b54ffc0c10", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6a6c6f47c9029798"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:6a6c6f47c9029798", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0a232002ba936dc3"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:0a232002ba936dc3", source: "section"};

MATCH (source {node_id: "section:9c2e67b1cbeb1480:section-6"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b21656fe40a36220"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:b21656fe40a36220", source: "section"};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:785cbee7123569c7"}]->(target)
SET r += {candidate_id: "semantic-relationship:8dd3103795b9cb79", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:785cbee7123569c7", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:040b89d40b05b638"}]->(target)
SET r += {candidate_id: "semantic-relationship:91a4501c038fedd3", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:040b89d40b05b638", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:ac60893c743281ca"}]->(target)
SET r += {candidate_id: "semantic-relationship:f71014aa53af34e6", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:ac60893c743281ca", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:6c1d853a8194db16"}]->(target)
SET r += {candidate_id: "semantic-relationship:faed771f022bbb77", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:6c1d853a8194db16", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MATCH (target {node_id: "concept:canonical-concept-99533f6472a2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:0b43b1bd6b275e0a"}]->(target)
SET r += {candidate_id: "semantic-relationship:a46ff0f2a330a998", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:0b43b1bd6b275e0a", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:61c6e1eca2c22fc9"}]->(target)
SET r += {candidate_id: "semantic-relationship:0e6e86842939c535", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:61c6e1eca2c22fc9", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:121d2f968039fd14"}]->(target)
SET r += {candidate_id: "semantic-relationship:319379c9dfff6a45", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:121d2f968039fd14", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-99533f6472a2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:6ed8ef10e87ed953"}]->(target)
SET r += {candidate_id: "semantic-relationship:af84c64a6ecf5900", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:6ed8ef10e87ed953", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:69b2812f06b307c4"}]->(target)
SET r += {candidate_id: "semantic-relationship:74eec97de1733b75", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:69b2812f06b307c4", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:be8637021e16b046"}]->(target)
SET r += {candidate_id: "semantic-relationship:217163f523e26e23", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:be8637021e16b046", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-e7fb8dff526f"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:89edbab03033db71"}]->(target)
SET r += {candidate_id: "semantic-relationship:14c776bd0e3d16ee", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:89edbab03033db71", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ec752d1d10b6"})
MATCH (target {node_id: "concept:canonical-concept-07f596a83279"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:642d46aa2585647a"}]->(target)
SET r += {candidate_id: "semantic-relationship:cabbe98e78dcd875", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:642d46aa2585647a", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ec752d1d10b6"})
MATCH (target {node_id: "concept:canonical-concept-99533f6472a2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:86b118b49f3827cb"}]->(target)
SET r += {candidate_id: "semantic-relationship:724ccd82c096e0d2", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:86b118b49f3827cb", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ec752d1d10b6"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:a7624ddf23786e2e"}]->(target)
SET r += {candidate_id: "semantic-relationship:b0745ebdb59b36b0", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:a7624ddf23786e2e", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-38ea3835b477"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:01ae022b9854a1c5"}]->(target)
SET r += {candidate_id: "semantic-relationship:eb0d6ed5fb2af91f", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:01ae022b9854a1c5", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:3b24af502ed3d7bc"}]->(target)
SET r += {candidate_id: "semantic-relationship:518748657b25009d", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:3b24af502ed3d7bc", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:079ee1f22e414ab2"}]->(target)
SET r += {candidate_id: "semantic-relationship:d452493f1ea561fe", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:079ee1f22e414ab2", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:9a3335ba251ed968"}]->(target)
SET r += {candidate_id: "semantic-relationship:6a1d5d6c1cf769e3", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:9a3335ba251ed968", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:110bcb7eea6b9ad4"}]->(target)
SET r += {candidate_id: "semantic-relationship:f83ff00376ab0e13", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:110bcb7eea6b9ad4", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:cecbf8d968d0be22"}]->(target)
SET r += {candidate_id: "semantic-relationship:baddfa6416f00853", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:cecbf8d968d0be22", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:6c80e8b169252f82"}]->(target)
SET r += {candidate_id: "semantic-relationship:48f0e8965ab57d06", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:6c80e8b169252f82", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MATCH (target {node_id: "concept:canonical-concept-38ea3835b477"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:50e748d3e2768df7"}]->(target)
SET r += {candidate_id: "semantic-relationship:9a6e012a4f4cc7a6", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:50e748d3e2768df7", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:af0e3f4e7d729b27"}]->(target)
SET r += {candidate_id: "semantic-relationship:08a2cc738dc627c0", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:af0e3f4e7d729b27", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f7deaa9e46cd1abe"}]->(target)
SET r += {candidate_id: "semantic-relationship:ebe42d1419b8bbec", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f7deaa9e46cd1abe", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:c8a6a8aeb7665a05"}]->(target)
SET r += {candidate_id: "semantic-relationship:f2bdb5ced5fb2d16", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:c8a6a8aeb7665a05", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:78d5ad8167792236"}]->(target)
SET r += {candidate_id: "semantic-relationship:5a017e68ea2c57dd", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:78d5ad8167792236", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:8b8c38b6859d2b95"}]->(target)
SET r += {candidate_id: "semantic-relationship:0f52af2b789c4550", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:8b8c38b6859d2b95", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:d30712ff33321072"}]->(target)
SET r += {candidate_id: "semantic-relationship:f3ad4f9b0b8fe9f4", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:d30712ff33321072", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:580ca6bc770534ef"}]->(target)
SET r += {candidate_id: "semantic-relationship:18f108fe8c44dcbc", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:580ca6bc770534ef", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:d5c30a77d05de0ee"}]->(target)
SET r += {candidate_id: "semantic-relationship:b6975436856cb285", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:d5c30a77d05de0ee", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:23e4ec51a579f258"}]->(target)
SET r += {candidate_id: "semantic-relationship:daad1c2723f15897", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:23e4ec51a579f258", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:41c1ac21afde7226"}]->(target)
SET r += {candidate_id: "semantic-relationship:0636fd71db2d0ca0", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:41c1ac21afde7226", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:2ce118b723a3af0b"}]->(target)
SET r += {candidate_id: "semantic-relationship:29731ed5a90e0c4b", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:2ce118b723a3af0b", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-ec752d1d10b6"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:fe9743fc06e92565"}]->(target)
SET r += {candidate_id: "semantic-relationship:e2225beefca4c95c", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:fe9743fc06e92565", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-ec752d1d10b6"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:7f338fe57b1ede2a"}]->(target)
SET r += {candidate_id: "semantic-relationship:e603f0c2a4c92ab6", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:7f338fe57b1ede2a", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-ec752d1d10b6"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:664001b277f98d94"}]->(target)
SET r += {candidate_id: "semantic-relationship:9174489c6200dc17", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:664001b277f98d94", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-38ea3835b477"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:3a4cfdcbc22c6c48"}]->(target)
SET r += {candidate_id: "semantic-relationship:f012333ecd80d816", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:3a4cfdcbc22c6c48", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:d6fde1a271a7a372"}]->(target)
SET r += {candidate_id: "semantic-relationship:a19efcf17bce50ad", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:d6fde1a271a7a372", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:820419243bb5867d"}]->(target)
SET r += {candidate_id: "semantic-relationship:1d286efd10c1a872", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:820419243bb5867d", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:34b2a12c564eaf78"}]->(target)
SET r += {candidate_id: "semantic-relationship:d9a7f22fd271ad44", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:34b2a12c564eaf78", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:5871555adf97b864"}]->(target)
SET r += {candidate_id: "semantic-relationship:da1123fd4cc055aa", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:5871555adf97b864", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:3c9d3737cad1ec23"}]->(target)
SET r += {candidate_id: "semantic-relationship:439d0d8a6a076908", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:3c9d3737cad1ec23", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-38ea3835b477"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:97a6e783a481aab7"}]->(target)
SET r += {candidate_id: "semantic-relationship:a217d78f8ccaf11e", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:97a6e783a481aab7", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:b74377f56b1f3b10"}]->(target)
SET r += {candidate_id: "semantic-relationship:2dec9c13597af82a", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:b74377f56b1f3b10", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:8b8103c8f17e02eb"}]->(target)
SET r += {candidate_id: "semantic-relationship:aecf9109f8a35b51", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:8b8103c8f17e02eb", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:113bb539c3823ff7"}]->(target)
SET r += {candidate_id: "semantic-relationship:55fa6c5037ff730a", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:113bb539c3823ff7", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:c3b7f84099cc31b6"}]->(target)
SET r += {candidate_id: "semantic-relationship:3cc7a15eba92874b", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:c3b7f84099cc31b6", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-c58bf55b8da4"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f11a6d2b29ec5ed8"}]->(target)
SET r += {candidate_id: "semantic-relationship:e284975fb0cc5b1d", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f11a6d2b29ec5ed8", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:bf7f7adc360a1b56"}]->(target)
SET r += {candidate_id: "semantic-relationship:bda710cf8547e4d5", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:bf7f7adc360a1b56", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0ce738a947217a13"}]->(target)
SET r += {candidate_id: "semantic-relationship:7a1d00eaecdcad2e", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:0ce738a947217a13", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1a9a1488427646bf"}]->(target)
SET r += {candidate_id: "semantic-relationship:d0cf14fc573cf3f0", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:1a9a1488427646bf", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:407b993ebdb21b13"}]->(target)
SET r += {candidate_id: "semantic-relationship:91d316f88cf8fe18", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:407b993ebdb21b13", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:08547065b4e8a193"}]->(target)
SET r += {candidate_id: "semantic-relationship:3940b363a78f7090", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:08547065b4e8a193", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:462a364da42f40f0"}]->(target)
SET r += {candidate_id: "semantic-relationship:4745e1ac0da119c4", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:462a364da42f40f0", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:564f2692970fca60"}]->(target)
SET r += {candidate_id: "semantic-relationship:adaaa5af8080d7d6", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:564f2692970fca60", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b73521a4ba3af840"}]->(target)
SET r += {candidate_id: "semantic-relationship:5820675a0aaf21a9", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:b73521a4ba3af840", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a3578f22c67f1a72"}]->(target)
SET r += {candidate_id: "semantic-relationship:3ad391c1097a6ecc", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:a3578f22c67f1a72", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e58285346e2d2008"}]->(target)
SET r += {candidate_id: "semantic-relationship:741f44a4f0de2490", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:e58285346e2d2008", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8e388de6a7bd"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1e54e1f674bb4b67"}]->(target)
SET r += {candidate_id: "semantic-relationship:1f01309c6170f21d", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:1e54e1f674bb4b67", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8e388de6a7bd"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ae1bfd55c90f96c8"}]->(target)
SET r += {candidate_id: "semantic-relationship:9a019856c92f8210", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:ae1bfd55c90f96c8", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8e388de6a7bd"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:20060e2168778cf8"}]->(target)
SET r += {candidate_id: "semantic-relationship:654f83ff16cda24b", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:20060e2168778cf8", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-ba70ddc5159d"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:227001120aa3cbbf"}]->(target)
SET r += {candidate_id: "semantic-relationship:cbacbc1ce99f8ff9", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:227001120aa3cbbf", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-ba70ddc5159d"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:dfdf2ece3e95434b"}]->(target)
SET r += {candidate_id: "semantic-relationship:bb60e27982a19e94", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:dfdf2ece3e95434b", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-e2a94f3ec336"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a60bda0b71919860"}]->(target)
SET r += {candidate_id: "semantic-relationship:9c9b869097d08e08", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:a60bda0b71919860", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-e7fb8dff526f"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c8b0c1d186de7ff6"}]->(target)
SET r += {candidate_id: "semantic-relationship:a845adc4de60631b", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:c8b0c1d186de7ff6", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a5320d62e8e6be5c"}]->(target)
SET r += {candidate_id: "semantic-relationship:db60f1f1ca046dcc", confidence: 0.8, evidence: ["cosine_similarity:0.883785"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:a5320d62e8e6be5c", source: "concept_mentions", status: "candidate", weight: 0.883785};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:8698021e1058698c"}]->(target)
SET r += {candidate_id: "semantic-relationship:0d1816004ac93b57", confidence: 0.8, evidence: ["cosine_similarity:0.865507"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:8698021e1058698c", source: "concept_mentions", status: "candidate", weight: 0.865507};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e03cf2ef4102ec13"}]->(target)
SET r += {candidate_id: "semantic-relationship:8fd6d038bd36fa47", confidence: 0.8, evidence: ["cosine_similarity:0.84354"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:e03cf2ef4102ec13", source: "concept_mentions", status: "candidate", weight: 0.84354};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:7e6a901719cc3fd0"}]->(target)
SET r += {candidate_id: "semantic-relationship:10f357f5147841ce", confidence: 0.8, evidence: ["cosine_similarity:0.818475"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:7e6a901719cc3fd0", source: "concept_mentions", status: "candidate", weight: 0.818475};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:2924fd26f9e8b371"}]->(target)
SET r += {candidate_id: "semantic-relationship:b1df268cee72effb", confidence: 0.8, evidence: ["cosine_similarity:0.818475"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:2924fd26f9e8b371", source: "concept_mentions", status: "candidate", weight: 0.818475};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-e7fb8dff526f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:534849ee98b84148"}]->(target)
SET r += {candidate_id: "semantic-relationship:3cb02956abf97884", confidence: 0.791366, evidence: ["cosine_similarity:0.782732"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:534849ee98b84148", source: "concept_mentions", status: "candidate", weight: 0.782732};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b350e7daec2fbe37"}]->(target)
SET r += {candidate_id: "semantic-relationship:31ed08f741672295", confidence: 0.791366, evidence: ["cosine_similarity:0.782732"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:b350e7daec2fbe37", source: "concept_mentions", status: "candidate", weight: 0.782732};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:405166bf88777995"}]->(target)
SET r += {candidate_id: "semantic-relationship:e962c18035db76fe", confidence: 0.7785, evidence: ["cosine_similarity:0.757001"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:405166bf88777995", source: "concept_mentions", status: "candidate", weight: 0.757001};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0ecef2e8690842fb"}]->(target)
SET r += {candidate_id: "semantic-relationship:fa7938351ec5c81e", confidence: 0.772419, evidence: ["cosine_similarity:0.744838"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:0ecef2e8690842fb", source: "concept_mentions", status: "candidate", weight: 0.744838};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-e7fb8dff526f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:537d0481eca34b72"}]->(target)
SET r += {candidate_id: "semantic-relationship:5efd712f98b8da4d", confidence: 0.750756, evidence: ["cosine_similarity:0.701512"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:537d0481eca34b72", source: "concept_mentions", status: "candidate", weight: 0.701512};

MATCH (source {node_id: "concept:canonical-concept-c3568c25c436"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:26005db31e880f84"}]->(target)
SET r += {candidate_id: "semantic-relationship:b104195135cc87e6", confidence: 0.750756, evidence: ["cosine_similarity:0.701512"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:26005db31e880f84", source: "concept_mentions", status: "candidate", weight: 0.701512};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ee63eca70a4484e9"}]->(target)
SET r += {candidate_id: "semantic-relationship:df766a9f89a28a25", confidence: 0.744146, evidence: ["cosine_similarity:0.688293"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:ee63eca70a4484e9", source: "concept_mentions", status: "candidate", weight: 0.688293};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:4817fe4f88a17098"}]->(target)
SET r += {candidate_id: "semantic-relationship:1679ddce0c244499", confidence: 0.740553, evidence: ["cosine_similarity:0.681106"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:4817fe4f88a17098", source: "concept_mentions", status: "candidate", weight: 0.681106};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-e7fb8dff526f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9e0317720558cb70"}]->(target)
SET r += {candidate_id: "semantic-relationship:10d11fc21999a016", confidence: 0.733622, evidence: ["cosine_similarity:0.667245"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9e0317720558cb70", source: "concept_mentions", status: "candidate", weight: 0.667245};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b908b05d6da5f933"}]->(target)
SET r += {candidate_id: "semantic-relationship:e460fcf91d8823a9", confidence: 0.733622, evidence: ["cosine_similarity:0.667245"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:b908b05d6da5f933", source: "concept_mentions", status: "candidate", weight: 0.667245};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:459db0dda6dcf5e2"}]->(target)
SET r += {candidate_id: "semantic-relationship:44f1508ad9868bae", confidence: 0.72809, evidence: ["cosine_similarity:0.65618"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:459db0dda6dcf5e2", source: "concept_mentions", status: "candidate", weight: 0.65618};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:93902c4259970c84"}]->(target)
SET r += {candidate_id: "semantic-relationship:789db896c1d2a966", confidence: 0.728089, evidence: ["cosine_similarity:0.656179"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:93902c4259970c84", source: "concept_mentions", status: "candidate", weight: 0.656179};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ab3ec9b3c56a4cce"}]->(target)
SET r += {candidate_id: "semantic-relationship:8a03614d7366f62f", confidence: 0.71118, evidence: ["cosine_similarity:0.622359"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:ab3ec9b3c56a4cce", source: "concept_mentions", status: "candidate", weight: 0.622359};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:75878068e5d19d1d"}]->(target)
SET r += {candidate_id: "semantic-relationship:1d34ef20239efb7e", confidence: 0.71118, evidence: ["cosine_similarity:0.622359"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:75878068e5d19d1d", source: "concept_mentions", status: "candidate", weight: 0.622359};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-10e399e84efc"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d54023edb4c53d57"}]->(target)
SET r += {candidate_id: "semantic-relationship:a7c867ba27cef411", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d54023edb4c53d57", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0a866b240aaa3593"}]->(target)
SET r += {candidate_id: "semantic-relationship:8d2fba8090b337f8", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0a866b240aaa3593", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1c80ac84389da13f"}]->(target)
SET r += {candidate_id: "semantic-relationship:24fbb59ea8890dbd", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1c80ac84389da13f", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:dda5f81e20109733"}]->(target)
SET r += {candidate_id: "semantic-relationship:6f6e8128189994dd", confidence: 0.7, evidence: ["chunk:chunk-2", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:dda5f81e20109733", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0ea53490c0186da8"}]->(target)
SET r += {candidate_id: "semantic-relationship:9afbb0c9ef674ca7", confidence: 0.7, evidence: ["chunk:chunk-2", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0ea53490c0186da8", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-417aec00781a"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:445b36a7ed0661fa"}]->(target)
SET r += {candidate_id: "semantic-relationship:dcf10a921098c394", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:445b36a7ed0661fa", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1373ca0e821b641c"}]->(target)
SET r += {candidate_id: "semantic-relationship:bd4abf5d0e019f09", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1373ca0e821b641c", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:fe060f8755b0c540"}]->(target)
SET r += {candidate_id: "semantic-relationship:15fc0fa67020440e", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:fe060f8755b0c540", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c76df41bd89e0b59"}]->(target)
SET r += {candidate_id: "semantic-relationship:c607b2f4a0bdad56", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:c76df41bd89e0b59", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-6da516d844b3"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:13213fb8ab816892"}]->(target)
SET r += {candidate_id: "semantic-relationship:74b466f60b60d0d1", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:13213fb8ab816892", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1f8d6071caf21445"}]->(target)
SET r += {candidate_id: "semantic-relationship:2773e9c2c437328d", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1f8d6071caf21445", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-99533f6472a2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e344bee36d24db4b"}]->(target)
SET r += {candidate_id: "semantic-relationship:6af6fb3ed011e14d", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e344bee36d24db4b", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:29a556c45cfff459"}]->(target)
SET r += {candidate_id: "semantic-relationship:8be5125c0dc919fc", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:29a556c45cfff459", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:4a94741baf3f5ae1"}]->(target)
SET r += {candidate_id: "semantic-relationship:917c5b0ea29b001c", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:4a94741baf3f5ae1", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-07f596a83279"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:52a35dcdb737b7c6"}]->(target)
SET r += {candidate_id: "semantic-relationship:2799b18588a68763", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:52a35dcdb737b7c6", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:add7ce1a1cbec3a8"}]->(target)
SET r += {candidate_id: "semantic-relationship:46620a684101c084", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:add7ce1a1cbec3a8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1560d3e30d1390ce"}]->(target)
SET r += {candidate_id: "semantic-relationship:b19bc589e0cbf307", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1560d3e30d1390ce", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a601cc3df0f33914"}]->(target)
SET r += {candidate_id: "semantic-relationship:d60cfdd37c92fd64", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a601cc3df0f33914", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-e7fb8dff526f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:23913acfe49b5366"}]->(target)
SET r += {candidate_id: "semantic-relationship:fcfd7ecc699041f1", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:23913acfe49b5366", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-10e399e84efc"})
MATCH (target {node_id: "concept:canonical-concept-ec752d1d10b6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5282404a5528fa71"}]->(target)
SET r += {candidate_id: "semantic-relationship:7d6f9b6ca801d9a4", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:5282404a5528fa71", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ebfcc22da5caf4c5"}]->(target)
SET r += {candidate_id: "semantic-relationship:23fc3c3a67ab30e4", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ebfcc22da5caf4c5", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:2bfb434a675b7bd7"}]->(target)
SET r += {candidate_id: "semantic-relationship:8e6a21c3801be844", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:2bfb434a675b7bd7", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c0d70746db9b41b2"}]->(target)
SET r += {candidate_id: "semantic-relationship:7426c3bd170d4eef", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:c0d70746db9b41b2", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:07e200245201e473"}]->(target)
SET r += {candidate_id: "semantic-relationship:9f2c57a422d6a219", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:07e200245201e473", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-38ea3835b477"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:2e2a3744ebef2d15"}]->(target)
SET r += {candidate_id: "semantic-relationship:6c41411926a8bebf", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:2e2a3744ebef2d15", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:fca41e369fbba03a"}]->(target)
SET r += {candidate_id: "semantic-relationship:ac00c2a7386e5c2c", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:fca41e369fbba03a", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:52671691740f7e68"}]->(target)
SET r += {candidate_id: "semantic-relationship:b7f5f54725a7a8ce", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:52671691740f7e68", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ceded0346a2b6cf2"}]->(target)
SET r += {candidate_id: "semantic-relationship:04bc581864edadc2", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ceded0346a2b6cf2", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-417aec00781a"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e29e8157495dfdcf"}]->(target)
SET r += {candidate_id: "semantic-relationship:65e205f242f28805", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e29e8157495dfdcf", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-a5ebcbe2893f"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:90e53d9de1580289"}]->(target)
SET r += {candidate_id: "semantic-relationship:082049a54eb9d0c0", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:90e53d9de1580289", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d5ced1112f0fa176"}]->(target)
SET r += {candidate_id: "semantic-relationship:01a18010079e354b", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d5ced1112f0fa176", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:31b362c71cab0a29"}]->(target)
SET r += {candidate_id: "semantic-relationship:5e837fe43afdf4b3", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:31b362c71cab0a29", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6da516d844b3"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:37bef157e9c6bd17"}]->(target)
SET r += {candidate_id: "semantic-relationship:bdab8dd95865735e", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:37bef157e9c6bd17", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-8e388de6a7bd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:cbbf7b8035249dff"}]->(target)
SET r += {candidate_id: "semantic-relationship:6c1453779770f7eb", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:cbbf7b8035249dff", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a68b2a57290831c3"}]->(target)
SET r += {candidate_id: "semantic-relationship:c8b115864aa221f1", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a68b2a57290831c3", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5a4fd28cdee1e3a0"}]->(target)
SET r += {candidate_id: "semantic-relationship:e81e6b1567b975b1", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:5a4fd28cdee1e3a0", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8cb6279a8e1b"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f8536884d7fc6576"}]->(target)
SET r += {candidate_id: "semantic-relationship:0aee47e560255575", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:f8536884d7fc6576", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8e388de6a7bd"})
MATCH (target {node_id: "concept:canonical-concept-ba70ddc5159d"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5876ea8fa1ee7884"}]->(target)
SET r += {candidate_id: "semantic-relationship:c5370d7b6a7f5183", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:5876ea8fa1ee7884", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8e388de6a7bd"})
MATCH (target {node_id: "concept:canonical-concept-e2a94f3ec336"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e5d93b479295ee57"}]->(target)
SET r += {candidate_id: "semantic-relationship:3aa0d4977883064e", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e5d93b479295ee57", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-8e388de6a7bd"})
MATCH (target {node_id: "concept:canonical-concept-e34c51af4dbd"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5ac34f2c913e4c8b"}]->(target)
SET r += {candidate_id: "semantic-relationship:4eed1b1933468ead", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:5ac34f2c913e4c8b", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-a0d3005ea234"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:65da36e05c704345"}]->(target)
SET r += {candidate_id: "semantic-relationship:807592eb3e4279cc", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:65da36e05c704345", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-b0d51c58c8b9"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b9fedba2860250a8"}]->(target)
SET r += {candidate_id: "semantic-relationship:fcb0deda4fdfdfbc", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:b9fedba2860250a8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-99533f6472a2"})
MATCH (target {node_id: "concept:canonical-concept-c58bf55b8da4"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:550bb4c658b0fd5b"}]->(target)
SET r += {candidate_id: "semantic-relationship:36239c85ee3c4345", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:550bb4c658b0fd5b", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-a0d3005ea234"})
MATCH (target {node_id: "concept:canonical-concept-c3568c25c436"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ba28834ad64739af"}]->(target)
SET r += {candidate_id: "semantic-relationship:4f7998d0ddad62b5", confidence: 0.7, evidence: ["chunk:chunk-1"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ba28834ad64739af", source: "chunk", status: "candidate", weight: 1.0};

// Document: Biologia celular: membranas y organelos
// Document ID: cf930a8d0f9b30a7
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

// Document: Estrategias de aprendizaje autorregulado
// Document ID: e17459b81e02abbb
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

// Document: Historia del metodo cientifico
// Document ID: 7e169ef36110ab70
MERGE (n:Document {node_id: "document:7e169ef36110ab70"})
SET n:Document
SET n += {document_id: "7e169ef36110ab70", node_id: "document:7e169ef36110ab70", paragraph_count: 11, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/historia_metodo_cientifico.md", title: "Historia del metodo cientifico", word_count: 104};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-1"})
SET n:Section
SET n += {end_line: 1, heading_type: "markdown", level: 1, node_id: "section:7e169ef36110ab70:section-1", order: 1, section_id: "section-1", start_line: 1, title: "Historia del metodo cientifico"};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-2"})
SET n:Section
SET n += {end_line: 5, heading_type: "markdown", level: 2, node_id: "section:7e169ef36110ab70:section-2", order: 2, section_id: "section-2", start_line: 3, title: "Introduccion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-1"})
SET n:Chunk
SET n += {character_count: 145, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:7e169ef36110ab70:chunk-1", order: 1, start_line: 5, text: "El metodo cientifico es una forma organizada de construir conocimiento mediante observacion, hipotesis, experimentacion y revision de resultados.", word_count: 18};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 2, node_id: "section:7e169ef36110ab70:section-3", numbering: "1", order: 3, section_id: "section-3", start_line: 7, title: "1. Observacion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-2"})
SET n:Chunk
SET n += {character_count: 122, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:7e169ef36110ab70:chunk-2", order: 2, start_line: 9, text: "La observacion identifica un fenomeno o problema. En esta etapa se registran patrones, preguntas y condiciones relevantes.", word_count: 17};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-4"})
SET n:Section
SET n += {end_line: 13, heading_type: "markdown", level: 3, node_id: "section:7e169ef36110ab70:section-4", numbering: "1.1", order: 4, section_id: "section-4", start_line: 11, title: "1.1 Hipotesis"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-3"})
SET n:Chunk
SET n += {character_count: 107, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:7e169ef36110ab70:chunk-3", order: 3, start_line: 13, text: "Una hipotesis propone una explicacion tentativa. Debe poder ponerse a prueba y generar predicciones claras.", word_count: 15};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-5"})
SET n:Section
SET n += {end_line: 17, heading_type: "markdown", level: 3, node_id: "section:7e169ef36110ab70:section-5", numbering: "1.2", order: 5, section_id: "section-5", start_line: 15, title: "1.2 Experimentacion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-4"})
SET n:Chunk
SET n += {character_count: 149, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 17, node_id: "chunk:7e169ef36110ab70:chunk-4", order: 4, start_line: 17, text: "La experimentacion compara resultados esperados con resultados observados. Un buen experimento controla variables y permite repetir el procedimiento.", word_count: 18};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:section-6"})
SET n:Section
SET n += {end_line: 21, heading_type: "markdown", level: 2, node_id: "section:7e169ef36110ab70:section-6", numbering: "2", order: 6, section_id: "section-6", start_line: 19, title: "2. Conclusion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:chunk-5"})
SET n:Chunk
SET n += {character_count: 170, chunk_id: "chunk-5", chunk_type: "paragraph", end_line: 21, node_id: "chunk:7e169ef36110ab70:chunk-5", order: 5, start_line: 21, text: "Los temas importantes son observacion, hipotesis, evidencia, experimentacion y revision. La ciencia avanza cuando sus explicaciones pueden corregirse con nueva evidencia.", word_count: 21};

MERGE (n:Concept {node_id: "concept:canonical-concept-a7f19d0e7e88"})
SET n:Concept
SET n += {canonical_name: "metodo cientifico", chunk_frequency: 5, concept_id: "canonical-concept-a7f19d0e7e88", display_name: "metodo cientifico", frequency: 6, mention_count: 3, node_id: "concept:canonical-concept-a7f19d0e7e88", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.444299, section_frequency: 5, variant_terms: ["metodo cientifico"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-ad157100c047"})
SET n:Concept
SET n += {canonical_name: "cientifico", chunk_frequency: 5, concept_id: "canonical-concept-ad157100c047", display_name: "cientifico", frequency: 6, mention_count: 3, node_id: "concept:canonical-concept-ad157100c047", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.386347, section_frequency: 5, variant_terms: ["cientifico"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-fdc832a84284"})
SET n:Concept
SET n += {canonical_name: "metodo", chunk_frequency: 5, concept_id: "canonical-concept-fdc832a84284", display_name: "metodo", frequency: 6, mention_count: 1, node_id: "concept:canonical-concept-fdc832a84284", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.386347, section_frequency: 5, variant_terms: ["metodo"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-7d73a2290315"})
SET n:Concept
SET n += {canonical_name: "observacion", chunk_frequency: 5, concept_id: "canonical-concept-7d73a2290315", display_name: "observacion", frequency: 6, mention_count: 0, node_id: "concept:canonical-concept-7d73a2290315", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.382782, section_frequency: 5, variant_terms: ["observacion"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-eb2c97a846a6"})
SET n:Concept
SET n += {canonical_name: "hipotesis", chunk_frequency: 3, concept_id: "canonical-concept-eb2c97a846a6", display_name: "hipotesis", frequency: 4, mention_count: 2, node_id: "concept:canonical-concept-eb2c97a846a6", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.374022, section_frequency: 3, variant_terms: ["hipotesis"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-f8e5e6a86a22"})
SET n:Concept
SET n += {canonical_name: "historia metodo cientifico", chunk_frequency: 5, concept_id: "canonical-concept-f8e5e6a86a22", display_name: "historia metodo cientifico", frequency: 5, mention_count: 2, node_id: "concept:canonical-concept-f8e5e6a86a22", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.344675, section_frequency: 5, variant_terms: ["historia metodo cientifico"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-8c7a452b3c53"})
SET n:Concept
SET n += {canonical_name: "experimentacion", chunk_frequency: 3, concept_id: "canonical-concept-8c7a452b3c53", display_name: "experimentacion", frequency: 4, mention_count: 2, node_id: "concept:canonical-concept-8c7a452b3c53", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.343761, section_frequency: 3, variant_terms: ["experimentacion"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-18a54cbd476e"})
SET n:Concept
SET n += {canonical_name: "resultados", chunk_frequency: 2, concept_id: "canonical-concept-18a54cbd476e", display_name: "resultados", frequency: 3, mention_count: 1, node_id: "concept:canonical-concept-18a54cbd476e", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.333499, section_frequency: 2, variant_terms: ["resultados"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-256fea961843"})
SET n:Concept
SET n += {canonical_name: "historia metodo", chunk_frequency: 5, concept_id: "canonical-concept-256fea961843", display_name: "historia metodo", frequency: 5, mention_count: 2, node_id: "concept:canonical-concept-256fea961843", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.304905, section_frequency: 5, variant_terms: ["historia metodo"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-769c9e0034db"})
SET n:Concept
SET n += {canonical_name: "evidencia", chunk_frequency: 1, concept_id: "canonical-concept-769c9e0034db", display_name: "evidencia", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-769c9e0034db", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.299802, section_frequency: 1, variant_terms: ["evidencia"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-874900292abe"})
SET n:Concept
SET n += {canonical_name: "historia", chunk_frequency: 5, concept_id: "canonical-concept-874900292abe", display_name: "historia", frequency: 5, mention_count: 1, node_id: "concept:canonical-concept-874900292abe", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.265135, section_frequency: 5, variant_terms: ["historia"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-148a3ffbd154"})
SET n:Concept
SET n += {canonical_name: "experimentacion revision", chunk_frequency: 2, concept_id: "canonical-concept-148a3ffbd154", display_name: "experimentacion revision", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-148a3ffbd154", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.210727, section_frequency: 2, variant_terms: ["experimentacion revision"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-3d698db604e2"})
SET n:Concept
SET n += {canonical_name: "observacion hipotesis", chunk_frequency: 2, concept_id: "canonical-concept-3d698db604e2", display_name: "observacion hipotesis", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-3d698db604e2", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.210727, section_frequency: 2, variant_terms: ["observacion hipotesis"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-2b214ddf3326"})
SET n:Concept
SET n += {canonical_name: "revision", chunk_frequency: 2, concept_id: "canonical-concept-2b214ddf3326", display_name: "revision", frequency: 2, mention_count: 1, node_id: "concept:canonical-concept-2b214ddf3326", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.183241, section_frequency: 2, variant_terms: ["revision"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-7b0c6489184e"})
SET n:Concept
SET n += {canonical_name: "conocimiento", chunk_frequency: 1, concept_id: "canonical-concept-7b0c6489184e", display_name: "conocimiento", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-7b0c6489184e", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.127189, section_frequency: 1, variant_terms: ["conocimiento"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-3f1147684ec8"})
SET n:Concept
SET n += {canonical_name: "construir", chunk_frequency: 1, concept_id: "canonical-concept-3f1147684ec8", display_name: "construir", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-3f1147684ec8", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.127189, section_frequency: 1, variant_terms: ["construir"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-5a92df5bec38"})
SET n:Concept
SET n += {canonical_name: "organizada", chunk_frequency: 1, concept_id: "canonical-concept-5a92df5bec38", display_name: "organizada", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-5a92df5bec38", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.127189, section_frequency: 1, variant_terms: ["organizada"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-3243cd0dd827"})
SET n:Concept
SET n += {canonical_name: "condicion", chunk_frequency: 1, concept_id: "canonical-concept-3243cd0dd827", display_name: "condiciones", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-3243cd0dd827", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["condiciones"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-00ed591b5c5f"})
SET n:Concept
SET n += {canonical_name: "etapa", chunk_frequency: 1, concept_id: "canonical-concept-00ed591b5c5f", display_name: "etapa", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-00ed591b5c5f", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["etapa"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-9a06bb7eaa71"})
SET n:Concept
SET n += {canonical_name: "fenomeno", chunk_frequency: 1, concept_id: "canonical-concept-9a06bb7eaa71", display_name: "fenomeno", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-9a06bb7eaa71", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["fenomeno"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-d09566670783"})
SET n:Concept
SET n += {canonical_name: "identifica", chunk_frequency: 1, concept_id: "canonical-concept-d09566670783", display_name: "identifica", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-d09566670783", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["identifica"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-6e753a6b0a37"})
SET n:Concept
SET n += {canonical_name: "patron", chunk_frequency: 1, concept_id: "canonical-concept-6e753a6b0a37", display_name: "patrones", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-6e753a6b0a37", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["patrones"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-f480c3e5d390"})
SET n:Concept
SET n += {canonical_name: "pregunta", chunk_frequency: 1, concept_id: "canonical-concept-f480c3e5d390", display_name: "preguntas", frequency: 1, mention_count: 1, node_id: "concept:canonical-concept-f480c3e5d390", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["preguntas"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-835b578bd545"})
SET n:Concept
SET n += {canonical_name: "problema", chunk_frequency: 1, concept_id: "canonical-concept-835b578bd545", display_name: "problema", frequency: 1, mention_count: 0, node_id: "concept:canonical-concept-835b578bd545", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["problema"]};

MERGE (n:Concept {node_id: "concept:canonical-concept-6b4ecea085dd"})
SET n:Concept
SET n += {canonical_name: "registran", chunk_frequency: 1, concept_id: "canonical-concept-6b4ecea085dd", display_name: "registran", frequency: 1, mention_count: 0, node_id: "concept:canonical-concept-6b4ecea085dd", normalization_method: "lowercase_stopword_trim_simple_singular", score: 0.123448, section_frequency: 1, variant_terms: ["registran"]};

MATCH (source {node_id: "document:7e169ef36110ab70"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-1"})
MERGE (source)-[r:HAS_SECTION {relationship_id: "relationship:6da627445b971b1a"}]->(target)
SET r += {order: 1, relationship_id: "relationship:6da627445b971b1a"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-1"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-2"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:ece6150bdf8785f8"}]->(target)
SET r += {order: 2, relationship_id: "relationship:ece6150bdf8785f8"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:b64b3e2f2df4139f"}]->(target)
SET r += {order: 1, relationship_id: "relationship:b64b3e2f2df4139f"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-1"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-3"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:a9d016712c102dca"}]->(target)
SET r += {order: 3, relationship_id: "relationship:a9d016712c102dca"};

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

MATCH (source {node_id: "section:7e169ef36110ab70:section-1"})
MATCH (target {node_id: "section:7e169ef36110ab70:section-6"})
MERGE (source)-[r:HAS_SUBSECTION {relationship_id: "relationship:8e333f208a14495c"}]->(target)
SET r += {order: 6, relationship_id: "relationship:8e333f208a14495c"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MERGE (source)-[r:HAS_CHUNK {relationship_id: "relationship:3f32568e8c311750"}]->(target)
SET r += {order: 5, relationship_id: "relationship:3f32568e8c311750"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6afcf54beb8923e5"}]->(target)
SET r += {mention_id: "canonical-mention-812e53f44b40", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:6afcf54beb8923e5", score: 0.069697, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-7b0c6489184e"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0adfca451ef5bbc5"}]->(target)
SET r += {mention_id: "canonical-mention-028ebc2e77d8", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:0adfca451ef5bbc5", score: 0.063594, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-3f1147684ec8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:83265f4ff641d3d6"}]->(target)
SET r += {mention_id: "canonical-mention-39e49285e469", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:83265f4ff641d3d6", score: 0.063594, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-5a92df5bec38"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e9c73b18b8cf2daf"}]->(target)
SET r += {mention_id: "canonical-mention-6d05f59570eb", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:e9c73b18b8cf2daf", score: 0.063594, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:a9e0d5a9a9db916a"}]->(target)
SET r += {mention_id: "canonical-mention-f10cea0b77ae", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:a9e0d5a9a9db916a", score: 0.060606, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-1"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:56db9145c4ce6d46"}]->(target)
SET r += {mention_id: "canonical-mention-4d1a0bff9ca5", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:56db9145c4ce6d46", score: 0.060606, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-3243cd0dd827"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:801d4cea7bc9f244"}]->(target)
SET r += {mention_id: "canonical-mention-c79660623434", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:801d4cea7bc9f244", score: 0.061724, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-00ed591b5c5f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:36ef3aba699fe85d"}]->(target)
SET r += {mention_id: "canonical-mention-ee36b2f257ec", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:36ef3aba699fe85d", score: 0.061724, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d17b497106e0dbf9"}]->(target)
SET r += {mention_id: "canonical-mention-6f5514ab4131", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:d17b497106e0dbf9", score: 0.061724, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4fb59d698d32fdb8"}]->(target)
SET r += {mention_id: "canonical-mention-6d5bbf8033ee", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:4fb59d698d32fdb8", score: 0.061724, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:cd7f3a5769bd4949"}]->(target)
SET r += {mention_id: "canonical-mention-3d5f3a434685", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:cd7f3a5769bd4949", score: 0.061724, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-2"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:031bf270ce5c4630"}]->(target)
SET r += {mention_id: "canonical-mention-8126313f2b7f", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:031bf270ce5c4630", score: 0.061724, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:bbfa88dd36e4b1a4"}]->(target)
SET r += {mention_id: "canonical-mention-4d6d7ba8e9f0", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:bbfa88dd36e4b1a4", score: 0.073972, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:eaf89378dcf0b3b8"}]->(target)
SET r += {mention_id: "canonical-mention-b49231bf7ec0", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:eaf89378dcf0b3b8", score: 0.034211, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6c8a3360bc2360c6"}]->(target)
SET r += {mention_id: "canonical-mention-32097b9aabd9", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:6c8a3360bc2360c6", score: 0.030263, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:598e1e0dcfe1c8bb"}]->(target)
SET r += {mention_id: "canonical-mention-a062abf0b00d", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:598e1e0dcfe1c8bb", score: 0.030263, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:5a689f3821352226"}]->(target)
SET r += {mention_id: "canonical-mention-88afb82eadca", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:5a689f3821352226", score: 0.026316, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-3"})
MATCH (target {node_id: "concept:canonical-concept-874900292abe"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:02cd98477d2da949"}]->(target)
SET r += {mention_id: "canonical-mention-6d63e024370b", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:02cd98477d2da949", score: 0.026316, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-18a54cbd476e"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:2f1abe50201a7a5f"}]->(target)
SET r += {mention_id: "canonical-mention-da74b6eb604c", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:2f1abe50201a7a5f", score: 0.076961, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:14d2a87127a3c9eb"}]->(target)
SET r += {mention_id: "canonical-mention-8fae60a422f3", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:14d2a87127a3c9eb", score: 0.063885, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f0a2b77a181fb251"}]->(target)
SET r += {mention_id: "canonical-mention-d7b7aca3fcba", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:f0a2b77a181fb251", score: 0.029545, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:2b3df33ed375698b"}]->(target)
SET r += {mention_id: "canonical-mention-5e7fd76882a7", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:2b3df33ed375698b", score: 0.026136, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:77ce7453acd894e4"}]->(target)
SET r += {mention_id: "canonical-mention-2608169fdb43", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:77ce7453acd894e4", score: 0.026136, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-4"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e793ea54846f2eb0"}]->(target)
SET r += {mention_id: "canonical-mention-88ff10d6dce5", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:e793ea54846f2eb0", score: 0.022727, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:c946b458bb2d5c7a"}]->(target)
SET r += {mention_id: "canonical-mention-4440e1c77ad1", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 2, relationship_id: "relationship:c946b458bb2d5c7a", score: 0.099934, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:89d49757e52242f9"}]->(target)
SET r += {mention_id: "canonical-mention-2936847dbcd9", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:89d49757e52242f9", score: 0.04636, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:7762a698b5e52ca7"}]->(target)
SET r += {mention_id: "canonical-mention-a145bcdf73a4", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:7762a698b5e52ca7", score: 0.04636, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9f1f33a3c2eed5ce"}]->(target)
SET r += {mention_id: "canonical-mention-114cfaec4e2d", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:9f1f33a3c2eed5ce", score: 0.040313, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:cc96314362841cfe"}]->(target)
SET r += {mention_id: "canonical-mention-7bf785a49b91", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:cc96314362841cfe", score: 0.033463, source: "chunk"};

MATCH (source {node_id: "chunk:7e169ef36110ab70:chunk-5"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6831e74397535137"}]->(target)
SET r += {mention_id: "canonical-mention-10ce2f80b47c", method: "tfidf_frequency_ngram", normalization_method: "lowercase_stopword_trim_simple_singular", occurrence_count: 1, relationship_id: "relationship:6831e74397535137", score: 0.033463, source: "chunk"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:8e0d02f82ddfdb64"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:8e0d02f82ddfdb64", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "concept:canonical-concept-7b0c6489184e"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:e54890549b871a92"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:e54890549b871a92", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "concept:canonical-concept-3f1147684ec8"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:f7e933085c904b78"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:f7e933085c904b78", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "concept:canonical-concept-5a92df5bec38"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b8d35390cae5db76"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:b8d35390cae5db76", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:9674a3d1a4745e97"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:9674a3d1a4745e97", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-2"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:ff75ba0c086b9a52"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:ff75ba0c086b9a52", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "concept:canonical-concept-3243cd0dd827"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:6b5965789220c54d"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:6b5965789220c54d", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "concept:canonical-concept-00ed591b5c5f"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:ff463ff21f9a72b5"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:ff463ff21f9a72b5", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:11e6b1ab6609b2b3"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:11e6b1ab6609b2b3", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:1812c89dda23f06b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:1812c89dda23f06b", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:4c4e30d1cdee1533"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:4c4e30d1cdee1533", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-3"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0a40ce19b8a45bde"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:0a40ce19b8a45bde", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:b059b425ae29332e"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:b059b425ae29332e", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:68238a118e1771ab"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:68238a118e1771ab", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:fca113430b50d206"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:fca113430b50d206", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:0391ca56732d230f"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:0391ca56732d230f", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:c4ff46d85880205c"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:c4ff46d85880205c", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-4"})
MATCH (target {node_id: "concept:canonical-concept-874900292abe"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:55f482cc774e7706"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:55f482cc774e7706", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "concept:canonical-concept-18a54cbd476e"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:75a1905401cbc937"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:75a1905401cbc937", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:60e5012700305d12"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:60e5012700305d12", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:2a13e6e602af1d76"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:2a13e6e602af1d76", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:faae6c1a2a54fa9b"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:faae6c1a2a54fa9b", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:7ca230912c390b03"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:7ca230912c390b03", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-5"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:ab9479672e991ef8"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:ab9479672e991ef8", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:47f0ff3301bbe03a"}]->(target)
SET r += {mention_count: 1, occurrence_count: 2, relationship_id: "relationship:47f0ff3301bbe03a", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:d83e9c7b02255f61"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:d83e9c7b02255f61", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:31e17e5f97c039dc"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:31e17e5f97c039dc", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:8f65c75291153a32"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:8f65c75291153a32", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:69177b90aa63b00a"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:69177b90aa63b00a", source: "section"};

MATCH (source {node_id: "section:7e169ef36110ab70:section-6"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:MENTIONS {relationship_id: "relationship:2504a63c4b23041e"}]->(target)
SET r += {mention_count: 1, occurrence_count: 1, relationship_id: "relationship:2504a63c4b23041e", source: "section"};

MATCH (source {node_id: "concept:canonical-concept-7d73a2290315"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:5376f592ab7b0a9d"}]->(target)
SET r += {candidate_id: "semantic-relationship:3e5885a8f8e5a343", confidence: 0.65, evidence: ["section:section-3->section-5"], method: "title_subtitle_hierarchy", reason: "A parent-section concept is connected to a child-section concept.", relationship_id: "relationship:5376f592ab7b0a9d", source: "section_hierarchy", status: "candidate", weight: 0.75};

MATCH (source {node_id: "concept:canonical-concept-7d73a2290315"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:79acf9c87dadc2dd"}]->(target)
SET r += {candidate_id: "semantic-relationship:bf75d6daea688a06", confidence: 0.65, evidence: ["section:section-3->section-4"], method: "title_subtitle_hierarchy", reason: "A parent-section concept is connected to a child-section concept.", relationship_id: "relationship:79acf9c87dadc2dd", source: "section_hierarchy", status: "candidate", weight: 0.75};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:0221fb9139bd408d"}]->(target)
SET r += {candidate_id: "semantic-relationship:312bed2e3d836f43", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:0221fb9139bd408d", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:3c71c6295a41f547"}]->(target)
SET r += {candidate_id: "semantic-relationship:5ea3ff54f2cd9498", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:3c71c6295a41f547", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:77768946566b5cc5"}]->(target)
SET r += {candidate_id: "semantic-relationship:bd8fb9559280e977", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:77768946566b5cc5", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:2d6e534ac7fcb1f9"}]->(target)
SET r += {candidate_id: "semantic-relationship:a3a3c5b1035c39a8", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:2d6e534ac7fcb1f9", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:bc8fea2053896b2b"}]->(target)
SET r += {candidate_id: "semantic-relationship:60235f49e957a0fa", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:bc8fea2053896b2b", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:c9d19d5a3bd332e5"}]->(target)
SET r += {candidate_id: "semantic-relationship:491e7dd491d16627", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:c9d19d5a3bd332e5", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:d16583446f606453"}]->(target)
SET r += {candidate_id: "semantic-relationship:de381583ad8659d2", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:d16583446f606453", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-6e753a6b0a37"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:8ed113021e585293"}]->(target)
SET r += {candidate_id: "semantic-relationship:129e4e1d244e6863", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:8ed113021e585293", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-6e753a6b0a37"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:93b74facb184f4d6"}]->(target)
SET r += {candidate_id: "semantic-relationship:d610df3c075a2954", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:93b74facb184f4d6", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-18a54cbd476e"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:6b3ae7beb163395b"}]->(target)
SET r += {candidate_id: "semantic-relationship:2357f37fb26de7b7", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:6b3ae7beb163395b", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:ed00e79b294f32a5"}]->(target)
SET r += {candidate_id: "semantic-relationship:f52d8f5ae1662c17", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:ed00e79b294f32a5", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-8c7a452b3c53"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f85844d289f1f731"}]->(target)
SET r += {candidate_id: "semantic-relationship:ff4b9324e10f8a7d", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f85844d289f1f731", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-8c7a452b3c53"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:5b7b4bcf560b86cc"}]->(target)
SET r += {candidate_id: "semantic-relationship:44efc2b8755f60ce", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:5b7b4bcf560b86cc", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-8c7a452b3c53"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:73e89ea873991c7c"}]->(target)
SET r += {candidate_id: "semantic-relationship:7c8462c1427b6b8c", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:73e89ea873991c7c", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-8c7a452b3c53"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:76515d31ff4d4127"}]->(target)
SET r += {candidate_id: "semantic-relationship:0b6f23093cea0e3d", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:76515d31ff4d4127", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:57755db0d3e32011"}]->(target)
SET r += {candidate_id: "semantic-relationship:737d0f4c644b8913", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:57755db0d3e32011", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:6ae8cce2fdfb21ad"}]->(target)
SET r += {candidate_id: "semantic-relationship:c58acc24c82b9cdd", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:6ae8cce2fdfb21ad", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-00ed591b5c5f"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:d9947679dd5a1a41"}]->(target)
SET r += {candidate_id: "semantic-relationship:7a52556899ea55a1", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:d9947679dd5a1a41", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-3243cd0dd827"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:78bb3dccef689259"}]->(target)
SET r += {candidate_id: "semantic-relationship:8edcb0101d14bb9c", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:78bb3dccef689259", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e7df6116fbe6c75e"}]->(target)
SET r += {candidate_id: "semantic-relationship:fb197edba1b4bf4d", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e7df6116fbe6c75e", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:0374d686d0f8a888"}]->(target)
SET r += {candidate_id: "semantic-relationship:953ba641f03bc0e1", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:0374d686d0f8a888", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:9f2ec49d55db8c52"}]->(target)
SET r += {candidate_id: "semantic-relationship:d6912041b2916317", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:9f2ec49d55db8c52", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:31b245ee34f1a601"}]->(target)
SET r += {candidate_id: "semantic-relationship:4b85c68687893a0d", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:31b245ee34f1a601", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-d09566670783"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e866a45c0dc8f000"}]->(target)
SET r += {candidate_id: "semantic-relationship:b6f696f75990d144", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e866a45c0dc8f000", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-d09566670783"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:75ccf816dce458ae"}]->(target)
SET r += {candidate_id: "semantic-relationship:6cad1a6fd3dd7684", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:75ccf816dce458ae", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-eb2c97a846a6"})
MATCH (target {node_id: "concept:canonical-concept-18a54cbd476e"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:7d28d7f95bbee079"}]->(target)
SET r += {candidate_id: "semantic-relationship:b6ce95062ef60b2e", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:7d28d7f95bbee079", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-f480c3e5d390"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:775f4af44cdb0957"}]->(target)
SET r += {candidate_id: "semantic-relationship:f5cc588cba2f8022", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:775f4af44cdb0957", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-f480c3e5d390"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e927fef91cd69c57"}]->(target)
SET r += {candidate_id: "semantic-relationship:3512caf92c0d77bc", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e927fef91cd69c57", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-00ed591b5c5f"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:fb794626e030cc2c"}]->(target)
SET r += {candidate_id: "semantic-relationship:fa31aa70ca5d8b06", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:fb794626e030cc2c", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-3243cd0dd827"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:cca04ad5ba015ada"}]->(target)
SET r += {candidate_id: "semantic-relationship:72287898299c904f", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:cca04ad5ba015ada", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:bcca7b81adfb01f3"}]->(target)
SET r += {candidate_id: "semantic-relationship:9469ffed59c8de47", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:bcca7b81adfb01f3", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:39952eae454e0a9a"}]->(target)
SET r += {candidate_id: "semantic-relationship:8d0bde293e3d7e15", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:39952eae454e0a9a", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:22c7f19d346b18ff"}]->(target)
SET r += {candidate_id: "semantic-relationship:ff45f5471652b319", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:22c7f19d346b18ff", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:d0236a74453b8db0"}]->(target)
SET r += {candidate_id: "semantic-relationship:d628adb0f2eefa8a", confidence: 0.55, evidence: ["chunk_distance:1"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:d0236a74453b8db0", source: "document_order", status: "candidate", weight: 0.5};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e08e72460923215b"}]->(target)
SET r += {candidate_id: "semantic-relationship:36c217300f02fec6", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e08e72460923215b", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f6688110d8222cb2"}]->(target)
SET r += {candidate_id: "semantic-relationship:771d5c332ab7a19e", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f6688110d8222cb2", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:af7ae396f4dba4ae"}]->(target)
SET r += {candidate_id: "semantic-relationship:cece696768ea3cae", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:af7ae396f4dba4ae", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:ec20731cc51ee331"}]->(target)
SET r += {candidate_id: "semantic-relationship:5aa5456121b3c636", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:ec20731cc51ee331", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-5a92df5bec38"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e2e69a649a35df8f"}]->(target)
SET r += {candidate_id: "semantic-relationship:ae03786dfa7f6ecc", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e2e69a649a35df8f", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-5a92df5bec38"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:c59f256701390e9a"}]->(target)
SET r += {candidate_id: "semantic-relationship:8d7bf8e946ee6d31", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:c59f256701390e9a", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-7b0c6489184e"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:931d57233cdb3c76"}]->(target)
SET r += {candidate_id: "semantic-relationship:4eab5fd5daeb229c", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:931d57233cdb3c76", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-7b0c6489184e"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:41bc327039408b8a"}]->(target)
SET r += {candidate_id: "semantic-relationship:f9b2eb0c8e747719", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:41bc327039408b8a", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:8ee45fa1ddab23c2"}]->(target)
SET r += {candidate_id: "semantic-relationship:a8b62222e2cc02ab", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:8ee45fa1ddab23c2", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:3a4d80a8daa6ef64"}]->(target)
SET r += {candidate_id: "semantic-relationship:6035e994ec2761c7", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:3a4d80a8daa6ef64", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:ece04f291db6f844"}]->(target)
SET r += {candidate_id: "semantic-relationship:fb9b8e6a1181eb19", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:ece04f291db6f844", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:5936f951c0556384"}]->(target)
SET r += {candidate_id: "semantic-relationship:7f796177418124ea", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:5936f951c0556384", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f7ba88d2428e5d6b"}]->(target)
SET r += {candidate_id: "semantic-relationship:f868f571d489ab2e", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f7ba88d2428e5d6b", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f7f7e359826b72bb"}]->(target)
SET r += {candidate_id: "semantic-relationship:5de90876c96785a9", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f7f7e359826b72bb", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:981e1816525fa8a8"}]->(target)
SET r += {candidate_id: "semantic-relationship:4f6f56293a08f464", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:981e1816525fa8a8", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:4f6f31ef4c7b5ba1"}]->(target)
SET r += {candidate_id: "semantic-relationship:b81b80db0d950148", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:4f6f31ef4c7b5ba1", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-eb2c97a846a6"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:777fbcebd071c832"}]->(target)
SET r += {candidate_id: "semantic-relationship:f02eeaa952b87444", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:777fbcebd071c832", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-eb2c97a846a6"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:0ccf683479fce1ba"}]->(target)
SET r += {candidate_id: "semantic-relationship:fd7cbfa001fb5ef6", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:0ccf683479fce1ba", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-eb2c97a846a6"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:3460d8fc102b7b4c"}]->(target)
SET r += {candidate_id: "semantic-relationship:dcf5ac14f5f8abc2", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:3460d8fc102b7b4c", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-eb2c97a846a6"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:bbd73972d5593712"}]->(target)
SET r += {candidate_id: "semantic-relationship:a8311793cd3e4eae", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:bbd73972d5593712", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:e6cb30016359ac82"}]->(target)
SET r += {candidate_id: "semantic-relationship:b0e48a5072590d95", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:e6cb30016359ac82", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:f355e583772ff5cd"}]->(target)
SET r += {candidate_id: "semantic-relationship:e7bf4785281f1c07", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:f355e583772ff5cd", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-fdc832a84284"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:69c16d0e4ce0b170"}]->(target)
SET r += {candidate_id: "semantic-relationship:df7872fe9ddc6166", confidence: 0.5, evidence: ["chunk_distance:2"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:69c16d0e4ce0b170", source: "document_order", status: "candidate", weight: 0.333333};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-148a3ffbd154"})
MERGE (source)-[r:PREREQUISITE_CANDIDATE {relationship_id: "relationship:cfe5c5f0bddf4a07"}]->(target)
SET r += {candidate_id: "semantic-relationship:586fcd9c8664bc75", confidence: 0.45, evidence: ["chunk_distance:3"], method: "order_of_appearance", reason: "A more general concept appears before a later concept.", relationship_id: "relationship:cfe5c5f0bddf4a07", source: "document_order", status: "candidate", weight: 0.25};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-3243cd0dd827"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:eaa131e9c87b2ee6"}]->(target)
SET r += {candidate_id: "semantic-relationship:7aa16d71b3596b68", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:eaa131e9c87b2ee6", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9f7dbb512635ab07"}]->(target)
SET r += {candidate_id: "semantic-relationship:973ce0c7a34a4e53", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9f7dbb512635ab07", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:288d35852dc9d643"}]->(target)
SET r += {candidate_id: "semantic-relationship:8fc715c51d9f7bee", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:288d35852dc9d643", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:45a1be10fcbe991f"}]->(target)
SET r += {candidate_id: "semantic-relationship:c1aead1d36380b06", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:45a1be10fcbe991f", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ffda90dd3e8e2206"}]->(target)
SET r += {candidate_id: "semantic-relationship:45b86611b3731cbc", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:ffda90dd3e8e2206", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6f959c7523beffdb"}]->(target)
SET r += {candidate_id: "semantic-relationship:31ad51c3a85d8c7e", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6f959c7523beffdb", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a6de53648dc3126c"}]->(target)
SET r += {candidate_id: "semantic-relationship:f1d973a2b4465d68", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:a6de53648dc3126c", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9f102a090d62c5c9"}]->(target)
SET r += {candidate_id: "semantic-relationship:3115088dc6c04242", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9f102a090d62c5c9", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:69ef2c783cd13619"}]->(target)
SET r += {candidate_id: "semantic-relationship:0cae3f8c52b1300f", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:69ef2c783cd13619", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-2b214ddf3326"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:3f17721fc4df090d"}]->(target)
SET r += {candidate_id: "semantic-relationship:92436646e6749d46", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:3f17721fc4df090d", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-2b214ddf3326"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:60ad85346805fb65"}]->(target)
SET r += {candidate_id: "semantic-relationship:69c825a7eb72412a", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:60ad85346805fb65", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:205f9f9f259d96bb"}]->(target)
SET r += {candidate_id: "semantic-relationship:3d01bc1c9e290936", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:205f9f9f259d96bb", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f4adcb144af6921f"}]->(target)
SET r += {candidate_id: "semantic-relationship:4a41a2ec7a48686e", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:f4adcb144af6921f", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:867b07c0196c3db1"}]->(target)
SET r += {candidate_id: "semantic-relationship:fec8e8a04ff9fe53", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:867b07c0196c3db1", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c3f4d0809c0fac3e"}]->(target)
SET r += {candidate_id: "semantic-relationship:529800f2488a64f8", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:c3f4d0809c0fac3e", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3d698db604e2"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:fb32d882f6e472d6"}]->(target)
SET r += {candidate_id: "semantic-relationship:f68faac4e8eed325", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:fb32d882f6e472d6", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-5a92df5bec38"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f1c9c10e46aaf0b8"}]->(target)
SET r += {candidate_id: "semantic-relationship:a4f96df3246b8b0b", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:f1c9c10e46aaf0b8", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-7b0c6489184e"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b42a68e0eb9b6c27"}]->(target)
SET r += {candidate_id: "semantic-relationship:ef8e8ff0eb972355", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:b42a68e0eb9b6c27", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:7005aa70bb990c03"}]->(target)
SET r += {candidate_id: "semantic-relationship:59b5e8aae3fc3878", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:7005aa70bb990c03", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5a92df5bec38"})
MATCH (target {node_id: "concept:canonical-concept-7b0c6489184e"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6adc452a8801e477"}]->(target)
SET r += {candidate_id: "semantic-relationship:2eb1f2ed92a529f3", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6adc452a8801e477", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-5a92df5bec38"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5d565d6b80ae5f59"}]->(target)
SET r += {candidate_id: "semantic-relationship:8a9136502028180c", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:5d565d6b80ae5f59", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6e753a6b0a37"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:eca6149d3c661286"}]->(target)
SET r += {candidate_id: "semantic-relationship:439678f3e4c9ca9e", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:eca6149d3c661286", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6e753a6b0a37"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:64345b6b600dd843"}]->(target)
SET r += {candidate_id: "semantic-relationship:9eea6bda3670f2a1", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:64345b6b600dd843", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-6e753a6b0a37"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6f30788ac0842a5d"}]->(target)
SET r += {candidate_id: "semantic-relationship:ea462665e9a7f426", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6f30788ac0842a5d", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-7b0c6489184e"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:fcbebeb1120fd013"}]->(target)
SET r += {candidate_id: "semantic-relationship:6e20074c53feae07", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:fcbebeb1120fd013", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e3cea4b321211c9d"}]->(target)
SET r += {candidate_id: "semantic-relationship:56bfc3748bfd1d6b", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:e3cea4b321211c9d", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:951b81375a6b816c"}]->(target)
SET r += {candidate_id: "semantic-relationship:39e761834963ff4b", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:951b81375a6b816c", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:63979590524d8c31"}]->(target)
SET r += {candidate_id: "semantic-relationship:58b8a843e6ff359c", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:63979590524d8c31", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-d09566670783"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a914d0efecb1b79d"}]->(target)
SET r += {candidate_id: "semantic-relationship:e1c07deb00dca37d", confidence: 0.8, evidence: ["cosine_similarity:1.0"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:a914d0efecb1b79d", source: "concept_mentions", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1e571ee85eb2f314"}]->(target)
SET r += {candidate_id: "semantic-relationship:f00c2b4670e4798b", confidence: 0.8, evidence: ["cosine_similarity:0.91111"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:1e571ee85eb2f314", source: "concept_mentions", status: "candidate", weight: 0.91111};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6930ec7de4e7de4e"}]->(target)
SET r += {candidate_id: "semantic-relationship:98afb795e8beb2a3", confidence: 0.8, evidence: ["cosine_similarity:0.885835"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:6930ec7de4e7de4e", source: "concept_mentions", status: "candidate", weight: 0.885835};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:722f64ad2602c7c8"}]->(target)
SET r += {candidate_id: "semantic-relationship:3ef358d6ec860ae1", confidence: 0.8, evidence: ["cosine_similarity:0.867385"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:722f64ad2602c7c8", source: "concept_mentions", status: "candidate", weight: 0.867385};

MATCH (source {node_id: "concept:canonical-concept-5a92df5bec38"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:b6bd918b2f9d53a4"}]->(target)
SET r += {candidate_id: "semantic-relationship:d503e8f7cf3d63ae", confidence: 0.8, evidence: ["cosine_similarity:0.867385"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:b6bd918b2f9d53a4", source: "concept_mentions", status: "candidate", weight: 0.867385};

MATCH (source {node_id: "concept:canonical-concept-7b0c6489184e"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:54d04fdd03e2e130"}]->(target)
SET r += {candidate_id: "semantic-relationship:002cc924c1bff571", confidence: 0.8, evidence: ["cosine_similarity:0.867385"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:54d04fdd03e2e130", source: "concept_mentions", status: "candidate", weight: 0.867385};

MATCH (source {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:9099d7cd1bf7ea00"}]->(target)
SET r += {candidate_id: "semantic-relationship:520251edee42e3bf", confidence: 0.8, evidence: ["cosine_similarity:0.867385"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:9099d7cd1bf7ea00", source: "concept_mentions", status: "candidate", weight: 0.867385};

MATCH (source {node_id: "concept:canonical-concept-3f1147684ec8"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:70ee8f59b802fd9a"}]->(target)
SET r += {candidate_id: "semantic-relationship:1ec70f764d182c62", confidence: 0.8, evidence: ["cosine_similarity:0.867383"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:70ee8f59b802fd9a", source: "concept_mentions", status: "candidate", weight: 0.867383};

MATCH (source {node_id: "concept:canonical-concept-5a92df5bec38"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c857c5832d012fc5"}]->(target)
SET r += {candidate_id: "semantic-relationship:b3225b9d6e978ac8", confidence: 0.8, evidence: ["cosine_similarity:0.867383"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:c857c5832d012fc5", source: "concept_mentions", status: "candidate", weight: 0.867383};

MATCH (source {node_id: "concept:canonical-concept-7b0c6489184e"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:43eaf1859787d2ec"}]->(target)
SET r += {candidate_id: "semantic-relationship:cdeb1740742d8c54", confidence: 0.8, evidence: ["cosine_similarity:0.867383"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:43eaf1859787d2ec", source: "concept_mentions", status: "candidate", weight: 0.867383};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-fdc832a84284"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:08c9b362981f82d0"}]->(target)
SET r += {candidate_id: "semantic-relationship:32aea45d65817a23", confidence: 0.8, evidence: ["cosine_similarity:0.867383"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:08c9b362981f82d0", source: "concept_mentions", status: "candidate", weight: 0.867383};

MATCH (source {node_id: "concept:canonical-concept-874900292abe"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:70e51ae06e6fe7e8"}]->(target)
SET r += {candidate_id: "semantic-relationship:45c8ff88422b8c32", confidence: 0.778416, evidence: ["cosine_similarity:0.756832"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:70e51ae06e6fe7e8", source: "concept_mentions", status: "candidate", weight: 0.756832};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-874900292abe"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:994886523ded45bd"}]->(target)
SET r += {candidate_id: "semantic-relationship:666b0d4b3543bb44", confidence: 0.778413, evidence: ["cosine_similarity:0.756826"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:994886523ded45bd", source: "concept_mentions", status: "candidate", weight: 0.756826};

MATCH (source {node_id: "concept:canonical-concept-eb2c97a846a6"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:133cd0e9f880f44c"}]->(target)
SET r += {candidate_id: "semantic-relationship:a4e82a73e2cb6a21", confidence: 0.744779, evidence: ["cosine_similarity:0.689558"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:133cd0e9f880f44c", source: "concept_mentions", status: "candidate", weight: 0.689558};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:50c84fabbf6bea55"}]->(target)
SET r += {candidate_id: "semantic-relationship:feadadc0db99ff2d", confidence: 0.744776, evidence: ["cosine_similarity:0.689552"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:50c84fabbf6bea55", source: "concept_mentions", status: "candidate", weight: 0.689552};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:be9793bb279aab75"}]->(target)
SET r += {candidate_id: "semantic-relationship:a55cbb32d0576527", confidence: 0.726808, evidence: ["cosine_similarity:0.653617"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:be9793bb279aab75", source: "concept_mentions", status: "candidate", weight: 0.653617};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:801cbe69aa254be2"}]->(target)
SET r += {candidate_id: "semantic-relationship:abe7dec07996ec4e", confidence: 0.726804, evidence: ["cosine_similarity:0.653609"], method: "tfidf_chunk_vector_similarity", reason: "Concepts have similar TF-IDF mention patterns across chunks.", relationship_id: "relationship:801cbe69aa254be2", source: "concept_mentions", status: "candidate", weight: 0.653609};

MATCH (source {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:09ee2b2a045b3cf1"}]->(target)
SET r += {candidate_id: "semantic-relationship:a03123ffed5f4469", confidence: 0.7, evidence: ["chunk:chunk-1", "chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:09ee2b2a045b3cf1", source: "chunk", status: "candidate", weight: 3.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:2f6d7bcf8a4300a1"}]->(target)
SET r += {candidate_id: "semantic-relationship:f2489b1b2a3298b3", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:2f6d7bcf8a4300a1", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:27a8c61accd3809b"}]->(target)
SET r += {candidate_id: "semantic-relationship:cd05af412436334c", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:27a8c61accd3809b", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:f21cc67780199280"}]->(target)
SET r += {candidate_id: "semantic-relationship:7eff4c6f32db29d2", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:f21cc67780199280", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:fdc384b599e97f9f"}]->(target)
SET r += {candidate_id: "semantic-relationship:fdd380645f1fc272", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:fdc384b599e97f9f", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-ad157100c047"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:777bbd676d66225a"}]->(target)
SET r += {candidate_id: "semantic-relationship:58e2f48ceebd0be6", confidence: 0.7, evidence: ["chunk:chunk-3", "chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:777bbd676d66225a", source: "chunk", status: "candidate", weight: 2.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-3243cd0dd827"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:803e5ea10151b33d"}]->(target)
SET r += {candidate_id: "semantic-relationship:b2b64b406f0833f2", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:803e5ea10151b33d", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:7e335ae76f04c991"}]->(target)
SET r += {candidate_id: "semantic-relationship:fe3b486c8db5ad1c", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:7e335ae76f04c991", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:4e53a77941ca25ec"}]->(target)
SET r += {candidate_id: "semantic-relationship:2b3d43911e9724bb", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:4e53a77941ca25ec", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:57abc9a1d6f52e1d"}]->(target)
SET r += {candidate_id: "semantic-relationship:4d56e67f1920e501", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:57abc9a1d6f52e1d", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-00ed591b5c5f"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:44ced4836eff7cbf"}]->(target)
SET r += {candidate_id: "semantic-relationship:322793be04f1f760", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:44ced4836eff7cbf", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-2b214ddf3326"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:83df15bd000a8b92"}]->(target)
SET r += {candidate_id: "semantic-relationship:bf2552ed25873721", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:83df15bd000a8b92", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c82245093fc357ab"}]->(target)
SET r += {candidate_id: "semantic-relationship:ade807b1f0d0a608", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:c82245093fc357ab", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:df909cff5b76cd34"}]->(target)
SET r += {candidate_id: "semantic-relationship:d38075f70fd5429b", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:df909cff5b76cd34", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:c469dc3ff7337741"}]->(target)
SET r += {candidate_id: "semantic-relationship:872142e0b5e628d2", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:c469dc3ff7337741", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-148a3ffbd154"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:21f9a8441dde4c8d"}]->(target)
SET r += {candidate_id: "semantic-relationship:940e2ea67cd48b08", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:21f9a8441dde4c8d", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-256fea961843"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:6488550bd5f184b4"}]->(target)
SET r += {candidate_id: "semantic-relationship:e0cbe68112c8a11b", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:6488550bd5f184b4", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:afecb8ac28dea655"}]->(target)
SET r += {candidate_id: "semantic-relationship:d0889ca0d1df147c", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:afecb8ac28dea655", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-a7f19d0e7e88"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0ae09a6876905495"}]->(target)
SET r += {candidate_id: "semantic-relationship:ddab9214d2ae58e1", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0ae09a6876905495", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-ad157100c047"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:1f7b94b08cbfd3e6"}]->(target)
SET r += {candidate_id: "semantic-relationship:4bd0b299c72748d8", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:1f7b94b08cbfd3e6", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-18a54cbd476e"})
MATCH (target {node_id: "concept:canonical-concept-f8e5e6a86a22"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0fb61f17070ded20"}]->(target)
SET r += {candidate_id: "semantic-relationship:55747c4b05f0249a", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0fb61f17070ded20", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-874900292abe"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ce6471bd2823e7cd"}]->(target)
SET r += {candidate_id: "semantic-relationship:5c2456876e88033b", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ce6471bd2823e7cd", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:e92de6845ef163c8"}]->(target)
SET r += {candidate_id: "semantic-relationship:78397c9caa975330", confidence: 0.7, evidence: ["chunk:chunk-4"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:e92de6845ef163c8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-256fea961843"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:84ce1cbae754da5b"}]->(target)
SET r += {candidate_id: "semantic-relationship:083aa6adfa2b5598", confidence: 0.7, evidence: ["chunk:chunk-3"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:84ce1cbae754da5b", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-2b214ddf3326"})
MATCH (target {node_id: "concept:canonical-concept-3d698db604e2"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0a34c2ac4cb5a018"}]->(target)
SET r += {candidate_id: "semantic-relationship:8aceac658e184b2e", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0a34c2ac4cb5a018", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-2b214ddf3326"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:d605f3809dc51ef6"}]->(target)
SET r += {candidate_id: "semantic-relationship:74b4d26bb7f2df35", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:d605f3809dc51ef6", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-2b214ddf3326"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:5d4ab540ba6480a6"}]->(target)
SET r += {candidate_id: "semantic-relationship:60afeefb412c7a79", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:5d4ab540ba6480a6", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-2b214ddf3326"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:ea9b6d3e51e5b43f"}]->(target)
SET r += {candidate_id: "semantic-relationship:26844dadc6bce940", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:ea9b6d3e51e5b43f", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-6e753a6b0a37"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:a7b53d99c7312c6b"}]->(target)
SET r += {candidate_id: "semantic-relationship:4ee605614742457f", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:a7b53d99c7312c6b", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-9a06bb7eaa71"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:536dbbacea42cddf"}]->(target)
SET r += {candidate_id: "semantic-relationship:d96b83d7a51c394f", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:536dbbacea42cddf", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-d09566670783"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:051604b22b6e1f22"}]->(target)
SET r += {candidate_id: "semantic-relationship:c99d2776f4d3cd5a", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:051604b22b6e1f22", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3243cd0dd827"})
MATCH (target {node_id: "concept:canonical-concept-f480c3e5d390"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:364cd5cafdea0742"}]->(target)
SET r += {candidate_id: "semantic-relationship:8b332afa73bcb2f4", confidence: 0.7, evidence: ["chunk:chunk-2"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:364cd5cafdea0742", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3d698db604e2"})
MATCH (target {node_id: "concept:canonical-concept-769c9e0034db"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:0ed4570d5accbe23"}]->(target)
SET r += {candidate_id: "semantic-relationship:679c49aaa0890544", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:0ed4570d5accbe23", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3d698db604e2"})
MATCH (target {node_id: "concept:canonical-concept-8c7a452b3c53"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:152f5e5b1e5aafb8"}]->(target)
SET r += {candidate_id: "semantic-relationship:5de5b86cea555da2", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:152f5e5b1e5aafb8", source: "chunk", status: "candidate", weight: 1.0};

MATCH (source {node_id: "concept:canonical-concept-3d698db604e2"})
MATCH (target {node_id: "concept:canonical-concept-eb2c97a846a6"})
MERGE (source)-[r:RELATED_TO {relationship_id: "relationship:72fb1cf27263f521"}]->(target)
SET r += {candidate_id: "semantic-relationship:1da01bab50293159", confidence: 0.7, evidence: ["chunk:chunk-5"], method: "chunk_cooccurrence", reason: "Concepts are mentioned in the same chunk.", relationship_id: "relationship:72fb1cf27263f521", source: "chunk", status: "candidate", weight: 1.0};

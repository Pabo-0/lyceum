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

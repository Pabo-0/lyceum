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

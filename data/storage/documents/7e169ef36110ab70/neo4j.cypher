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

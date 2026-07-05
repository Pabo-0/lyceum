MERGE (n:Document {node_id: "document:7e169ef36110ab70"})
SET n:Document
SET n += {document_id: "7e169ef36110ab70", max_visible_sections: 2, node_id: "document:7e169ef36110ab70", paragraph_count: 11, processing_status: "neo4j_export_ready", reading_graph_compaction: "section_budget_compaction", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/historia_metodo_cientifico.md", title: "Historia del metodo cientifico", visible_chunk_count: 2, visible_section_count: 2, word_count: 104};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:graph-section-1"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 17, heading_type: "compacted", level: 1, node_id: "section:7e169ef36110ab70:graph-section-1", order: 1, section_id: "graph-section-1", source_section_count: 4, source_section_ids: ["section-2", "section-3", "section-4", "section-5"], source_section_titles: ["Introduccion", "1. Observacion", "1.1 Hipotesis", "1.2 Experimentacion"], start_line: 3, text: "", title: "Bloque 1: Introduccion - Observacion", updated_at: "2026-07-05T01:26:07.694988+00:00"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:graph-chunk-1"})
SET n:Chunk
SET n += {character_count: 529, chunk_id: "graph-chunk-1", chunk_type: "merged_paragraphs", end_line: 17, node_id: "chunk:7e169ef36110ab70:graph-chunk-1", order: 1, source_chunk_count: 4, source_chunk_ids: ["chunk-1", "chunk-2", "chunk-3", "chunk-4"], source_section_count: 4, source_section_ids: ["section-2", "section-3", "section-4", "section-5"], source_section_titles: ["Introduccion", "1. Observacion", "1.1 Hipotesis", "1.2 Experimentacion"], start_line: 5, text: "El metodo cientifico es una forma organizada de construir conocimiento mediante observacion, hipotesis, experimentacion y revision de resultados.\n\nLa observacion identifica un fenomeno o problema. En esta etapa se registran patrones, preguntas y condiciones relevantes.\n\nUna hipotesis propone una explicacion tentativa. Debe poder ponerse a prueba y generar predicciones claras.\n\nLa experimentacion compara resultados esperados con resultados observados. Un buen experimento controla variables y permite repetir el procedimiento.", title: "Metodo cientifico organizada", title_candidates: ["metodo cientifico organizada", "metodo cientifico", "cientifico organizada construir", "organizada construir conocimiento", "construir conocimiento observacion"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 68};

MERGE (n:Section {node_id: "section:7e169ef36110ab70:graph-section-2"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 21, heading_type: "compacted", level: 1, node_id: "section:7e169ef36110ab70:graph-section-2", order: 2, section_id: "graph-section-2", source_section_count: 1, source_section_ids: ["section-6"], source_section_titles: ["2. Conclusion"], start_line: 19, title: "2. Conclusion"};

MERGE (n:Chunk {node_id: "chunk:7e169ef36110ab70:graph-chunk-2"})
SET n:Chunk
SET n += {character_count: 170, chunk_id: "graph-chunk-2", chunk_type: "paragraph", end_line: 21, node_id: "chunk:7e169ef36110ab70:graph-chunk-2", order: 2, source_chunk_count: 1, source_chunk_ids: ["chunk-5"], source_section_count: 1, source_section_ids: ["section-6"], source_section_titles: ["2. Conclusion"], start_line: 21, text: "Los temas importantes son observacion, hipotesis, evidencia, experimentacion y revision. La ciencia avanza cuando sus explicaciones pueden corregirse con nueva evidencia.", title: "Importantes observacion hipotesis", title_candidates: ["importantes observacion hipotesis", "importantes observacion", "observacion hipotesis evidencia", "hipotesis evidencia experimentacion", "evidencia experimentacion revision"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 21};

MERGE (n:Section {node_id: "manual-node:7e169ef36110ab70:f5536644be44"})
SET n:Section
SET n += {created_at: "2026-07-05T01:26:18.605941+00:00", manual: true, node_id: "manual-node:7e169ef36110ab70:f5536644be44", order: 3, text: "", title: "Seccion"};

MERGE (n:Section {node_id: "manual-node:7e169ef36110ab70:7cc04e21ce29"})
SET n:Section
SET n += {created_at: "2026-07-05T01:26:22.196909+00:00", manual: true, node_id: "manual-node:7e169ef36110ab70:7cc04e21ce29", order: 4, text: "", title: "Seccion"};

MATCH (source {node_id: "document:7e169ef36110ab70"})
MATCH (target {node_id: "section:7e169ef36110ab70:graph-section-1"})
MERGE (source)-[r:SEMANTIC {relationship_id: "relationship:f0e8a8e62206e162"}]->(target)
SET r += {order: 1, reason: "", relationship_id: "relationship:f0e8a8e62206e162", role: "contains_section", status: "confirmed", updated_at: "2026-07-05T01:26:04.500589+00:00"};

MATCH (source {node_id: "section:7e169ef36110ab70:graph-section-1"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:graph-chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e1e9b6c4b9c2e4ac"}]->(target)
SET r += {order: 1, relationship_id: "relationship:e1e9b6c4b9c2e4ac", role: "contains_chunk"};

MATCH (source {node_id: "document:7e169ef36110ab70"})
MATCH (target {node_id: "section:7e169ef36110ab70:graph-section-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b1d1ebb970081d5a"}]->(target)
SET r += {order: 2, relationship_id: "relationship:b1d1ebb970081d5a", role: "contains_section"};

MATCH (source {node_id: "section:7e169ef36110ab70:graph-section-2"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:graph-chunk-2"})
MERGE (source)-[r:BIDIRECTIONAL {relationship_id: "relationship:420e30dc300f7db7"}]->(target)
SET r += {order: 2, reason: "", relationship_id: "relationship:420e30dc300f7db7", role: "contains_chunk", status: "confirmed", updated_at: "2026-07-05T01:26:11.847094+00:00"};

MATCH (source {node_id: "manual-node:7e169ef36110ab70:f5536644be44"})
MATCH (target {node_id: "manual-node:7e169ef36110ab70:7cc04e21ce29"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4cc6446b18ae8005"}]->(target)
SET r += {created_at: "2026-07-05T01:26:22.281201+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:4cc6446b18ae8005", status: "confirmed"};

MATCH (source {node_id: "manual-node:7e169ef36110ab70:7cc04e21ce29"})
MATCH (target {node_id: "chunk:7e169ef36110ab70:graph-chunk-1"})
MERGE (source)-[r:SEMANTIC {relationship_id: "relationship:ca8a2603c75c3047"}]->(target)
SET r += {created_at: "2026-07-05T01:26:42.170427+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:ca8a2603c75c3047", status: "confirmed", updated_at: "2026-07-05T01:26:45.867677+00:00"};

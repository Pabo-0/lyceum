MERGE (n:Document {node_id: "document:97fa62eb5581dfa0"})
SET n:Document
SET n += {document_id: "97fa62eb5581dfa0", max_visible_sections: 2, node_id: "document:97fa62eb5581dfa0", paragraph_count: 9, processing_status: "neo4j_export_ready", reading_graph_compaction: "preserve_detected_sections", source_extension: ".txt", source_path: "D:/PABLO/Lyceum Project/lyceum/data/uploads/a34bf6788afb43a599bac7daf27b7a4c_test_2.txt", title: "la ciudad aprende pero no se sabe bien por donde empieza todo esto", visible_chunk_count: 2, visible_section_count: 1, word_count: 423};

MERGE (n:Section {node_id: "section:97fa62eb5581dfa0:section-1"})
SET n:Section
SET n += {compaction_method: "preserved_section", end_line: 45, heading_type: "title_line", level: 1, node_id: "section:97fa62eb5581dfa0:section-1", order: 1, section_id: "section-1", source_section_count: 1, source_section_ids: ["section-1"], source_section_titles: ["la ciudad aprende pero no se sabe bien por donde empieza todo esto"], start_line: 1, title: "la ciudad aprende pero no se sabe bien por donde empieza todo esto"};

MERGE (n:Chunk {node_id: "chunk:97fa62eb5581dfa0:graph-chunk-1"})
SET n:Chunk
SET n += {character_count: 1721, chunk_id: "graph-chunk-1", chunk_type: "merged_paragraphs", end_line: 27, node_id: "chunk:97fa62eb5581dfa0:graph-chunk-1", order: 1, source_chunk_count: 6, source_chunk_ids: ["chunk-1", "chunk-2", "chunk-3", "chunk-4", "chunk-5", "chunk-6"], source_section_count: 1, source_section_ids: ["section-1"], source_section_titles: ["la ciudad aprende pero no se sabe bien por donde empieza todo esto"], start_line: 2, text: "primero estaban hablando de sensores en avenidas y despues alguien menciona escuelas sin explicar la conexion los datos llegan en tablas, correos, reportes de vecinos, fotos, llamadas, notas sueltas y archivos que a veces tienen fecha y a veces no\n\nmovilidad energia salud publica educacion seguridad agua residuos todo aparece junto un tecnico dice que el trafico aumenta cuando llueve pero otra persona dice que tambien baja porque la gente no sale no queda claro si se esta midiendo velocidad promedio, numero de autos, ocupacion del autobus o quejas de usuarios\n\nhay una parte importante sobre modelos predictivos parece que sirven para anticipar demanda y fallas pero tambien pueden equivocarse si los datos vienen incompletos por ejemplo una colonia con pocos reportes puede parecer tranquila aunque tal vez solo no tiene internet o no confia en el sistema\n\nprivacidad aparece de pronto alguien dice que borrar nombres no basta porque una ruta diaria puede identificar a una persona luego se mezcla con el tema de energia solar y baterias si hay paneles en algunas casas se puede estimar produccion pero eso tambien revela habitos de consumo\n\nla salud publica queda entre medio consultas medicas sintomas ventas de medicamentos ausentismo escolar calidad del aire todo podria detectar un brote pero nadie explica quien revisa la alerta si el modelo se equivoca puede mandar recursos a un lugar incorrecto si no avisa a tiempo el problema crece\n\ntambien se habla de educacion asistencia calificaciones conectividad transporte familiaridad con plataformas digitales no se deberia etiquetar estudiantes como problema mejor seria identificar apoyos necesarios aunque eso exige docentes con tiempo y explicaciones claras", title: "Salud publica", title_candidates: ["salud publica", "primero estaban hablando", "primero estaban", "estaban hablando sensores", "hablando sensores avenidas"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 269};

MERGE (n:Chunk {node_id: "chunk:97fa62eb5581dfa0:graph-chunk-2"})
SET n:Chunk
SET n += {character_count: 896, chunk_id: "graph-chunk-2", chunk_type: "merged_paragraphs", end_line: 45, node_id: "chunk:97fa62eb5581dfa0:graph-chunk-2", order: 2, source_chunk_count: 3, source_chunk_ids: ["chunk-7", "chunk-8", "chunk-9"], source_section_count: 1, source_section_ids: ["section-1"], source_section_titles: ["la ciudad aprende pero no se sabe bien por donde empieza todo esto"], start_line: 29, text: "hay frases sobre grafos de conocimiento una estacion se conecta con una ruta una escuela con un barrio un hospital con una subestacion electrica un sensor con una avenida la idea suena util pero el texto salta rapido a paneles de control y APIs\n\nen algun momento se menciona que los paneles no deben confundir datos observados con predicciones esto parece importante si el usuario ve una prediccion como si fuera un hecho puede tomar malas decisiones pero tampoco se explica como se debe disenar el panel\n\nriesgos datos incompletos modelos opacos instituciones separadas mantenimiento caro confianza publica baja todo eso se enumera casi sin orden la conclusion parece ser que una ciudad inteligente necesita tecnologia pero tambien reglas equipos humanos auditoria participacion y correccion no queda claro si el tema principal era inteligencia artificial o gestion urbana o aprendizaje profundo", title: "Frases grafos conocimiento", title_candidates: ["frases grafos conocimiento", "frases grafos", "grafos conocimiento estacion", "conocimiento estacion conecta", "estacion conecta ruta"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 141};

MATCH (source {node_id: "document:97fa62eb5581dfa0"})
MATCH (target {node_id: "section:97fa62eb5581dfa0:section-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9d75ba0fce64ebea"}]->(target)
SET r += {order: 1, relationship_id: "relationship:9d75ba0fce64ebea", role: "contains_section"};

MATCH (source {node_id: "section:97fa62eb5581dfa0:section-1"})
MATCH (target {node_id: "chunk:97fa62eb5581dfa0:graph-chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:12e393238e91e0bb"}]->(target)
SET r += {order: 1, reason: "", relationship_id: "relationship:12e393238e91e0bb", role: "contains_chunk", status: "confirmed", updated_at: "2026-07-04T21:44:04.284510+00:00"};

MATCH (source {node_id: "section:97fa62eb5581dfa0:section-1"})
MATCH (target {node_id: "chunk:97fa62eb5581dfa0:graph-chunk-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d48c95f7793ea400"}]->(target)
SET r += {order: 2, reason: "", relationship_id: "relationship:d48c95f7793ea400", role: "contains_chunk", status: "confirmed", updated_at: "2026-07-04T21:43:55.683883+00:00"};

MATCH (source {node_id: "chunk:97fa62eb5581dfa0:graph-chunk-1"})
MATCH (target {node_id: "chunk:97fa62eb5581dfa0:graph-chunk-2"})
MERGE (source)-[r:SEMANTIC {relationship_id: "relationship:01894c741c7e4573"}]->(target)
SET r += {created_at: "2026-07-04T21:44:07.326307+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:01894c741c7e4573", status: "confirmed", updated_at: "2026-07-04T21:44:12.699084+00:00"};

MERGE (n:Document {node_id: "document:f140157e4da95a65"})
SET n:Document
SET n += {document_id: "f140157e4da95a65", node_id: "document:f140157e4da95a65", paragraph_count: 9, processing_status: "neo4j_export_ready", source_extension: ".txt", source_path: "D:/PABLO/Lyceum Project/lyceum/backend/../data/uploads/a34bf6788afb43a599bac7daf27b7a4c_test_2.txt", title: "la ciudad aprende pero no se sabe bien por donde empieza todo esto", word_count: 423};

MERGE (n:Section {node_id: "section:f140157e4da95a65:section-1"})
SET n:Section
SET n += {end_line: 45, heading_type: "title_line", level: 1, node_id: "section:f140157e4da95a65:section-1", order: 1, section_id: "section-1", start_line: 1, title: "la ciudad aprende pero no se sabe bien por donde empieza todo esto"};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-1"})
SET n:Chunk
SET n += {character_count: 247, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 3, node_id: "chunk:f140157e4da95a65:chunk-1", order: 1, start_line: 2, text: "primero estaban hablando de sensores en avenidas y despues alguien menciona escuelas sin explicar la conexion los datos llegan en tablas, correos, reportes de vecinos, fotos, llamadas, notas sueltas y archivos que a veces tienen fecha y a veces no", title: "Primero estaban hablando", title_candidates: ["primero estaban hablando", "primero estaban", "estaban hablando sensores", "hablando sensores avenidas", "sensores avenidas despues"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 40};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-2"})
SET n:Chunk
SET n += {character_count: 316, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 7, node_id: "chunk:f140157e4da95a65:chunk-2", order: 2, start_line: 5, text: "movilidad energia salud publica educacion seguridad agua residuos todo aparece junto un tecnico dice que el trafico aumenta cuando llueve pero otra persona dice que tambien baja porque la gente no sale no queda claro si se esta midiendo velocidad promedio, numero de autos, ocupacion del autobus o quejas de usuarios", title: "Movilidad energia salud", title_candidates: ["movilidad energia salud", "movilidad energia", "energia salud publica", "salud publica educacion", "publica educacion seguridad"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 51};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-3"})
SET n:Chunk
SET n += {character_count: 295, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 11, node_id: "chunk:f140157e4da95a65:chunk-3", order: 3, start_line: 9, text: "hay una parte importante sobre modelos predictivos parece que sirven para anticipar demanda y fallas pero tambien pueden equivocarse si los datos vienen incompletos por ejemplo una colonia con pocos reportes puede parecer tranquila aunque tal vez solo no tiene internet o no confia en el sistema", title: "Importante modelos predictivos", title_candidates: ["importante modelos predictivos", "importante modelos", "modelos predictivos parece", "predictivos parece sirven", "parece sirven anticipar"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 47};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-4"})
SET n:Chunk
SET n += {character_count: 283, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 16, node_id: "chunk:f140157e4da95a65:chunk-4", order: 4, start_line: 13, text: "privacidad aparece de pronto alguien dice que borrar nombres no basta porque una ruta diaria puede identificar a una persona luego se mezcla con el tema de energia solar y baterias si hay paneles en algunas casas se puede estimar produccion pero eso tambien revela habitos de consumo", title: "Privacidad aparece pronto", title_candidates: ["privacidad aparece pronto", "privacidad aparece", "aparece pronto alguien", "pronto alguien dice", "alguien dice borrar"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 48};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-5"})
SET n:Chunk
SET n += {character_count: 300, chunk_id: "chunk-5", chunk_type: "paragraph", end_line: 22, node_id: "chunk:f140157e4da95a65:chunk-5", order: 5, start_line: 18, text: "la salud publica queda entre medio consultas medicas sintomas ventas de medicamentos ausentismo escolar calidad del aire todo podria detectar un brote pero nadie explica quien revisa la alerta si el modelo se equivoca puede mandar recursos a un lugar incorrecto si no avisa a tiempo el problema crece", title: "Salud publica queda", title_candidates: ["salud publica queda", "salud publica", "publica queda medio", "queda medio consultas", "medio consultas medicas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 49};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-6"})
SET n:Chunk
SET n += {character_count: 270, chunk_id: "chunk-6", chunk_type: "paragraph", end_line: 27, node_id: "chunk:f140157e4da95a65:chunk-6", order: 6, start_line: 24, text: "tambien se habla de educacion asistencia calificaciones conectividad transporte familiaridad con plataformas digitales no se deberia etiquetar estudiantes como problema mejor seria identificar apoyos necesarios aunque eso exige docentes con tiempo y explicaciones claras", title: "Habla educacion asistencia", title_candidates: ["habla educacion asistencia", "habla educacion", "educacion asistencia calificaciones", "asistencia calificaciones conectividad", "calificaciones conectividad transporte"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 34};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-7"})
SET n:Chunk
SET n += {character_count: 244, chunk_id: "chunk-7", chunk_type: "paragraph", end_line: 34, node_id: "chunk:f140157e4da95a65:chunk-7", order: 7, start_line: 29, text: "hay frases sobre grafos de conocimiento una estacion se conecta con una ruta una escuela con un barrio un hospital con una subestacion electrica un sensor con una avenida la idea suena util pero el texto salta rapido a paneles de control y APIs", title: "Frases grafos conocimiento", title_candidates: ["frases grafos conocimiento", "frases grafos", "grafos conocimiento estacion", "conocimiento estacion conecta", "estacion conecta ruta"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 44};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-8"})
SET n:Chunk
SET n += {character_count: 258, chunk_id: "chunk-8", chunk_type: "paragraph", end_line: 39, node_id: "chunk:f140157e4da95a65:chunk-8", order: 8, start_line: 36, text: "en algun momento se menciona que los paneles no deben confundir datos observados con predicciones esto parece importante si el usuario ve una prediccion como si fuera un hecho puede tomar malas decisiones pero tampoco se explica como se debe disenar el panel", title: "Algun momento menciona", title_candidates: ["algun momento menciona", "algun momento", "momento menciona paneles", "menciona paneles no", "paneles no deben"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 43};

MERGE (n:Chunk {node_id: "chunk:f140157e4da95a65:chunk-9"})
SET n:Chunk
SET n += {character_count: 390, chunk_id: "chunk-9", chunk_type: "paragraph", end_line: 45, node_id: "chunk:f140157e4da95a65:chunk-9", order: 9, start_line: 41, text: "riesgos datos incompletos modelos opacos instituciones separadas mantenimiento caro confianza publica baja todo eso se enumera casi sin orden la conclusion parece ser que una ciudad inteligente necesita tecnologia pero tambien reglas equipos humanos auditoria participacion y correccion no queda claro si el tema principal era inteligencia artificial o gestion urbana o aprendizaje profundo", title: "Riesgos datos incompletos", title_candidates: ["riesgos datos incompletos", "riesgos datos", "datos incompletos modelos", "incompletos modelos opacos", "modelos opacos instituciones"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 54};

MATCH (source {node_id: "document:f140157e4da95a65"})
MATCH (target {node_id: "section:f140157e4da95a65:section-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:999531e2f9cdff71"}]->(target)
SET r += {order: 1, relationship_id: "relationship:999531e2f9cdff71", role: "contains_section"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:494fa6fc60eefa8b"}]->(target)
SET r += {order: 1, relationship_id: "relationship:494fa6fc60eefa8b", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5e649eac34cb48a9"}]->(target)
SET r += {order: 2, relationship_id: "relationship:5e649eac34cb48a9", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4bdb6433ae4b9a0e"}]->(target)
SET r += {order: 3, relationship_id: "relationship:4bdb6433ae4b9a0e", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-4"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d6e9edfccb396e7a"}]->(target)
SET r += {order: 4, relationship_id: "relationship:d6e9edfccb396e7a", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-5"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d2835dee106200f5"}]->(target)
SET r += {order: 5, relationship_id: "relationship:d2835dee106200f5", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:62ae3d14059cccc6"}]->(target)
SET r += {order: 6, relationship_id: "relationship:62ae3d14059cccc6", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-7"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b709b6575eb8e6a3"}]->(target)
SET r += {order: 7, relationship_id: "relationship:b709b6575eb8e6a3", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-8"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:98114d89e79d4805"}]->(target)
SET r += {order: 8, relationship_id: "relationship:98114d89e79d4805", role: "contains_chunk"};

MATCH (source {node_id: "section:f140157e4da95a65:section-1"})
MATCH (target {node_id: "chunk:f140157e4da95a65:chunk-9"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:cde559c374761341"}]->(target)
SET r += {order: 9, relationship_id: "relationship:cde559c374761341", role: "contains_chunk"};

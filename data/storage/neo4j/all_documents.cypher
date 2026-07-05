CREATE CONSTRAINT document_node_id IF NOT EXISTS FOR (n:Document) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT section_node_id IF NOT EXISTS FOR (n:Section) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT chunk_node_id IF NOT EXISTS FOR (n:Chunk) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT concept_node_id IF NOT EXISTS FOR (n:Concept) REQUIRE n.node_id IS UNIQUE;

CREATE INDEX document_title IF NOT EXISTS FOR (n:Document) ON (n.title);

CREATE INDEX section_title IF NOT EXISTS FOR (n:Section) ON (n.title);

CREATE INDEX concept_title IF NOT EXISTS FOR (n:Concept) ON (n.title);

CREATE INDEX directional_relationship_id IF NOT EXISTS FOR ()-[r:DIRECTIONAL]-() ON (r.relationship_id);

CREATE INDEX bidirectional_relationship_id IF NOT EXISTS FOR ()-[r:BIDIRECTIONAL]-() ON (r.relationship_id);

CREATE INDEX semantic_relationship_id IF NOT EXISTS FOR ()-[r:SEMANTIC]-() ON (r.relationship_id);

// Document: Prueba 1
// Document ID: e17459b81e02abbb
MERGE (n:Document {node_id: "document:e17459b81e02abbb"})
SET n:Document
SET n += {document_id: "e17459b81e02abbb", max_visible_sections: 2, node_id: "document:e17459b81e02abbb", paragraph_count: 5, processing_status: "neo4j_export_ready", reading_graph_compaction: "preserve_detected_sections", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/test_documents/chunking_texto_largo.md", title: "Prueba 1", visible_chunk_count: 2, visible_section_count: 2, word_count: 177};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-2"})
SET n:Section
SET n += {compaction_method: "preserved_section", end_line: 5, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-2", numbering: "1", order: 2, section_id: "section-2", source_section_count: 1, source_section_ids: ["section-2"], source_section_titles: ["1. Planificacion"], start_line: 3, title: "1. Planificacion"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:graph-chunk-1"})
SET n:Chunk
SET n += {character_count: 970, chunk_id: "graph-chunk-1", chunk_type: "merged_paragraphs", end_line: 5, node_id: "chunk:e17459b81e02abbb:graph-chunk-1", order: 1, source_chunk_count: 2, source_chunk_ids: ["chunk-1", "chunk-2"], source_section_count: 1, source_section_ids: ["section-2"], source_section_titles: ["1. Planificacion"], start_line: 5, text: "La planificacion del aprendizaje comienza cuando el estudiante identifica una meta concreta, revisa los recursos disponibles y decide una secuencia de acciones para avanzar. Esta etapa incluye reconocer conocimientos previos, anticipar dificultades, estimar el tiempo necesario y seleccionar estrategias de lectura, practica o explicacion.\n\nCuando la planificacion es clara, el estudiante puede comparar su progreso con una intencion inicial y ajustar el esfuerzo antes de llegar al final de la actividad. En materiales educativos extensos, esta habilidad ayuda a dividir un tema grande en partes manejables, relacionar conceptos nuevos con conceptos conocidos y evitar que toda la informacion se procese como un bloque unico. La planificacion tambien permite detectar prerequisitos, ordenar actividades y construir una ruta de estudio mas estable. Si el texto es demasiado largo, conviene partirlo en fragmentos pequenos para conservar contexto sin saturar el analisis.", title: "Planificacion del aprendizaje", title_candidates: ["planificacion aprendizaje", "identifica meta concreta", "meta concreta revisa", "concreta revisa recursos", "revisa recursos disponibles"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 138};

MERGE (n:Section {node_id: "section:e17459b81e02abbb:section-3"})
SET n:Section
SET n += {compaction_method: "preserved_section", end_line: 9, heading_type: "markdown", level: 2, node_id: "section:e17459b81e02abbb:section-3", numbering: "2", order: 3, section_id: "section-3", source_section_count: 1, source_section_ids: ["section-3"], source_section_titles: ["2. Monitoreo"], start_line: 7, title: "2. Monitoreo"};

MERGE (n:Chunk {node_id: "chunk:e17459b81e02abbb:graph-chunk-2"})
SET n:Chunk
SET n += {character_count: 208, chunk_id: "graph-chunk-2", chunk_type: "paragraph", end_line: 9, node_id: "chunk:e17459b81e02abbb:graph-chunk-2", order: 2, source_chunk_count: 1, source_chunk_ids: ["chunk-3"], source_section_count: 1, source_section_ids: ["section-3"], source_section_titles: ["2. Monitoreo"], start_line: 9, text: "El monitoreo ocurre durante la actividad. El estudiante observa si entiende, si puede explicar una idea con sus propias palabras y si los ejemplos resueltos realmente coinciden con el procedimiento estudiado.", title: "Explicar propias palabras", title_candidates: ["explicar propias palabras", "explicar propias", "propias palabras", "ejemplos resueltos", "procedimiento estudiado"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 31};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c4f82c22d81696b3"}]->(target)
SET r += {order: 2, relationship_id: "relationship:c4f82c22d81696b3", role: "contains_section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-2"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:graph-chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d9ad2f149b6369d2"}]->(target)
SET r += {order: 1, relationship_id: "relationship:d9ad2f149b6369d2", role: "contains_chunk"};

MATCH (source {node_id: "document:e17459b81e02abbb"})
MATCH (target {node_id: "section:e17459b81e02abbb:section-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:350ead94be5aa24e"}]->(target)
SET r += {order: 3, relationship_id: "relationship:350ead94be5aa24e", role: "contains_section"};

MATCH (source {node_id: "section:e17459b81e02abbb:section-3"})
MATCH (target {node_id: "chunk:e17459b81e02abbb:graph-chunk-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b95fa2c83bed9641"}]->(target)
SET r += {order: 2, relationship_id: "relationship:b95fa2c83bed9641", role: "contains_chunk"};

// Document: Historia del metodo cientifico
// Document ID: 7e169ef36110ab70
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

// Document: Ecosistema de aprendizaje profundo para una ciudad inteligente
// Document ID: e23fede19fb9e33c
MERGE (n:Document {node_id: "document:e23fede19fb9e33c"})
SET n:Document
SET n += {document_id: "e23fede19fb9e33c", max_visible_sections: 7, node_id: "document:e23fede19fb9e33c", paragraph_count: 158, processing_status: "neo4j_export_ready", reading_graph_compaction: "section_budget_compaction", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/data/uploads/d35f0dd69e3f4a73b44964b97a1f68da_test_1.md", title: "Ecosistema de aprendizaje profundo para una ciudad inteligente", visible_chunk_count: 11, visible_section_count: 6, word_count: 2914};

MERGE (n:Section {node_id: "section:e23fede19fb9e33c:graph-section-1"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 27, heading_type: "compacted", level: 1, node_id: "section:e23fede19fb9e33c:graph-section-1", order: 1, section_id: "graph-section-1", source_section_count: 5, source_section_ids: ["section-2", "section-3", "section-4", "section-5", "section-6"], source_section_titles: ["Introduccion general", "1. Marco conceptual", "1.1 Ciudad como sistema complejo", "1.2 Datos urbanos", "1.3 Aprendizaje profundo"], start_line: 3, title: "Bloque 1: Introduccion general - Marco conceptual"};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-1"})
SET n:Chunk
SET n += {character_count: 2457, chunk_id: "graph-chunk-1", chunk_type: "merged_paragraphs", end_line: 27, node_id: "chunk:e23fede19fb9e33c:graph-chunk-1", order: 1, source_chunk_count: 8, source_chunk_ids: ["chunk-1", "chunk-2", "chunk-3", "chunk-4", "chunk-5", "chunk-6", "chunk-7", "chunk-8"], source_section_count: 4, source_section_ids: ["section-2", "section-4", "section-5", "section-6"], source_section_titles: ["Introduccion general", "1.1 Ciudad como sistema complejo", "1.2 Datos urbanos", "1.3 Aprendizaje profundo"], start_line: 5, text: "Una ciudad inteligente no es solamente una ciudad llena de sensores. Es un sistema social, tecnico y administrativo que intenta convertir datos dispersos en decisiones utiles. Para que ese proceso funcione, la ciudad necesita infraestructura digital, reglas de gobernanza, modelos de analisis, equipos humanos capaces de interpretar resultados y mecanismos de participacion publica.\n\nEste documento describe un escenario amplio para probar como Lyceum procesa informacion extensa, organizada y con muchos niveles de estructura. El tema principal es el diseno de un ecosistema de aprendizaje profundo aplicado a movilidad, energia, salud publica, educacion, seguridad, agua, residuos y participacion ciudadana.\n\nUna ciudad combina flujos de personas, bienes, energia, informacion y decisiones. Cada flujo tiene patrones propios, pero tambien depende de los demas. Un cambio en transporte publico puede modificar el consumo electrico, la calidad del aire, el uso de espacios publicos y la puntualidad escolar.\n\nDesde una perspectiva de sistemas complejos, la ciudad no puede entenderse como una suma simple de edificios, avenidas y servicios. El comportamiento urbano emerge de interacciones entre actores, normas, tecnologias y restricciones materiales. Por eso, un modelo predictivo debe considerar relaciones indirectas y efectos acumulativos.\n\nLos datos urbanos provienen de fuentes heterogeneas. Algunas fuentes son continuas, como sensores de trafico, medidores de energia o estaciones de calidad del aire. Otras fuentes son periodicas, como censos, encuestas de movilidad, reportes escolares o inspecciones de infraestructura.\n\nLa calidad de los datos depende de su precision, cobertura, frecuencia, estabilidad y contexto. Un sensor puede registrar una medida exacta, pero si no se conoce su ubicacion, calibracion o periodo de mantenimiento, el dato puede producir conclusiones debiles.\n\nEl aprendizaje profundo usa redes neuronales con muchas capas para reconocer patrones en imagenes, texto, audio, series temporales y grafos. En una ciudad inteligente, estas tecnicas pueden usarse para prediccion de demanda, deteccion de anomalias, clasificacion de documentos, estimacion de riesgo y simulacion de escenarios.\n\nSin embargo, el aprendizaje profundo no reemplaza la interpretacion humana. Un modelo puede detectar correlaciones, pero la decision publica requiere explicar causas probables, evaluar impactos y justificar acciones ante la comunidad.", title: "Aprendizaje profundo", title_candidates: ["aprendizaje profundo", "ciudad inteligente", "calidad aire", "ciudad inteligente no", "inteligente no solamente"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 342};

MERGE (n:Section {node_id: "section:e23fede19fb9e33c:graph-section-3"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 203, heading_type: "compacted", level: 1, node_id: "section:e23fede19fb9e33c:graph-section-3", order: 3, section_id: "graph-section-3", source_section_count: 12, source_section_ids: ["section-31", "section-32", "section-33", "section-34", "section-35", "section-36", "section-37", "section-38", "section-39", "section-40", "section-41", "section-42"], source_section_titles: ["4. Gobernanza y etica", "4.1 Privacidad", "4.2 Explicabilidad", "4.3 Equidad", "4.4 Participacion ciudadana", "5. Ciclo de vida del modelo", "5.1 Definicion del problema", "5.2 Preparacion de datos", "5.3 Entrenamiento", "5.4 Evaluacion", "5.5 Despliegue", "5.6 Monitoreo"], start_line: 141, title: "Bloque 3: Gobernanza y etica - Ciclo de vida del modelo"};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-6"})
SET n:Chunk
SET n += {character_count: 1839, chunk_id: "graph-chunk-6", chunk_type: "merged_paragraphs", end_line: 171, node_id: "chunk:e23fede19fb9e33c:graph-chunk-6", order: 6, source_chunk_count: 9, source_chunk_ids: ["chunk-41", "chunk-42", "chunk-43", "chunk-44", "chunk-45", "chunk-46", "chunk-47", "chunk-48", "chunk-49"], source_section_count: 5, source_section_ids: ["section-32", "section-33", "section-34", "section-35", "section-37"], source_section_titles: ["4.1 Privacidad", "4.2 Explicabilidad", "4.3 Equidad", "4.4 Participacion ciudadana", "5.1 Definicion del problema"], start_line: 145, text: "La privacidad debe incorporarse desde el diseno. No basta con eliminar nombres si los datos pueden reidentificar personas por ubicacion, horarios o combinaciones raras. La minimizacion de datos reduce riesgos.\n\nUn proyecto responsable define que datos son necesarios, por cuanto tiempo se conservan, quien puede acceder a ellos y como se audita el uso. Tambien establece procedimientos para incidentes de seguridad.\n\nLa explicabilidad permite entender por que un modelo recomienda una accion. En administracion publica, la explicacion no es un lujo tecnico; es parte de la rendicion de cuentas.\n\nAlgunas tecnicas generan importancia de variables, ejemplos similares o reglas aproximadas. Ninguna explicacion es perfecta, pero una explicacion parcial puede ser mejor que una decision cerrada e incomprensible.\n\nLa equidad exige revisar impactos diferenciados. Un modelo puede ser preciso en promedio y fallar en comunidades pequenas, perifericas o historicamente subrepresentadas. Por eso, las metricas deben desagregarse.\n\nTambien se deben evaluar costos de error. Un falso positivo puede desperdiciar recursos, pero un falso negativo puede dejar sin apoyo a una comunidad vulnerable. La comparacion depende del dominio.\n\nLa participacion ciudadana permite validar prioridades, corregir supuestos y construir confianza. Los habitantes conocen problemas que no siempre aparecen en bases de datos.\n\nUn sistema urbano debe permitir reportar errores, solicitar explicaciones y proponer mejoras. La tecnologia publica funciona mejor cuando las personas pueden discutirla, no solo recibirla.\n\nAntes de entrenar un modelo, el equipo debe definir una pregunta operacional. Una pregunta como \"mejorar movilidad\" es demasiado amplia. Una pregunta como \"predecir ocupacion de estaciones cada quince minutos para ajustar frecuencia\" es mas accionable.", title: "Privacidad debe incorporarse", title_candidates: ["privacidad debe incorporarse", "privacidad debe", "debe incorporarse diseno", "incorporarse diseno no", "diseno no basta"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 259};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-7"})
SET n:Chunk
SET n += {character_count: 2253, chunk_id: "graph-chunk-7", chunk_type: "merged_paragraphs", end_line: 203, node_id: "chunk:e23fede19fb9e33c:graph-chunk-7", order: 7, source_chunk_count: 11, source_chunk_ids: ["chunk-50", "chunk-51", "chunk-52", "chunk-53", "chunk-54", "chunk-55", "chunk-56", "chunk-57", "chunk-58", "chunk-59", "chunk-60"], source_section_count: 6, source_section_ids: ["section-37", "section-38", "section-39", "section-40", "section-41", "section-42"], source_section_titles: ["5.1 Definicion del problema", "5.2 Preparacion de datos", "5.3 Entrenamiento", "5.4 Evaluacion", "5.5 Despliegue", "5.6 Monitoreo"], start_line: 173, text: "La definicion debe incluir usuarios, decisiones, limites, datos disponibles, indicadores de exito y riesgos. Si no se define la decision final, el modelo puede convertirse en una demostracion sin uso real.\n\nLa preparacion incluye limpieza, normalizacion, union de fuentes, manejo de valores faltantes, deteccion de valores extremos y construccion de variables. Esta etapa suele consumir mas tiempo que el entrenamiento.\n\nEn datos urbanos, las inconsistencias son frecuentes. Una misma colonia puede tener nombres distintos. Una estacion puede cambiar de codigo. Un sensor puede quedar fuera de servicio. La preparacion debe registrar esos casos.\n\nEl entrenamiento ajusta parametros del modelo a partir de datos historicos. Se deben separar datos de entrenamiento, validacion y prueba para estimar desempeno sin autoengano.\n\nLos modelos profundos pueden requerir GPUs, pero no siempre son necesarios. Para algunos problemas, un modelo simple y explicable puede funcionar mejor. La seleccion debe basarse en evidencia, no en prestigio tecnico.\n\nLa evaluacion mide precision, error, robustez, estabilidad y utilidad operativa. Una metrica tecnica puede no capturar el valor real. Por ejemplo, reducir error promedio en demanda no sirve si el modelo falla en horas pico.\n\nTambien se deben hacer pruebas de estres. Que pasa si falta una fuente? Que pasa si cambia el clima? Que pasa si hay un evento masivo? Las respuestas ayudan a preparar planes de contingencia.\n\nEl despliegue integra el modelo con sistemas reales. Incluye APIs, paneles, alertas, permisos, monitoreo y documentacion. Un modelo desplegado sin monitoreo puede degradarse silenciosamente.\n\nEl despliegue debe ser gradual. Primero puede operar en modo observacion, comparando predicciones con decisiones humanas. Luego puede pasar a recomendaciones asistidas. Las decisiones criticas requieren supervision.\n\nEl monitoreo detecta desviacion de datos, cambio de distribucion, caida de precision, errores de servicio y uso indebido. Tambien registra si las recomendaciones se aplican y con que resultado.\n\nUn modelo urbano vive en un ambiente cambiante. Nuevas rutas, obras, politicas, habitos y crisis pueden volver obsoleto un modelo. El monitoreo permite decidir cuando recalibrar o retirar.", title: "Definicion debe incluir", title_candidates: ["definicion debe incluir", "definicion debe", "debe incluir usuarios", "incluir usuarios decisiones", "usuarios decisiones limites"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 327};

MERGE (n:Section {node_id: "section:e23fede19fb9e33c:graph-section-4"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 255, heading_type: "compacted", level: 1, node_id: "section:e23fede19fb9e33c:graph-section-4", order: 4, section_id: "graph-section-4", source_section_count: 10, source_section_ids: ["section-43", "section-44", "section-45", "section-46", "section-47", "section-48", "section-49", "section-50", "section-51", "section-52"], source_section_titles: ["6. Infraestructura tecnica", "6.1 APIs", "6.2 Grafos de conocimiento", "6.3 Embeddings", "6.4 Paneles de control", "7. Escenarios de uso", "7.1 Evento masivo", "7.2 Ola de calor", "7.3 Reparacion de infraestructura", "7.4 Planeacion escolar"], start_line: 205, title: "Bloque 4: Infraestructura tecnica - Escenarios de uso"};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-8"})
SET n:Chunk
SET n += {character_count: 1925, chunk_id: "graph-chunk-8", chunk_type: "merged_paragraphs", end_line: 237, node_id: "chunk:e23fede19fb9e33c:graph-chunk-8", order: 8, source_chunk_count: 10, source_chunk_ids: ["chunk-61", "chunk-62", "chunk-63", "chunk-64", "chunk-65", "chunk-66", "chunk-67", "chunk-68", "chunk-69", "chunk-70"], source_section_count: 5, source_section_ids: ["section-44", "section-45", "section-46", "section-47", "section-49"], source_section_titles: ["6.1 APIs", "6.2 Grafos de conocimiento", "6.3 Embeddings", "6.4 Paneles de control", "7.1 Evento masivo"], start_line: 209, text: "Las APIs permiten que sistemas distintos compartan datos y resultados. Deben tener autenticacion, control de version, limites de uso y documentacion clara.\n\nUna API de prediccion podria recibir zona, horario y condiciones, y devolver demanda esperada junto con confianza y factores principales. Una API de consulta podria devolver historiales y metadatos.\n\nUn grafo de conocimiento representa entidades y relaciones: estaciones, rutas, barrios, escuelas, hospitales, sensores, incidentes y politicas. Este tipo de estructura ayuda a conectar informacion dispersa.\n\nLos grafos permiten preguntas como: que escuelas estan cerca de zonas con baja conectividad y alta desercion? Que rutas atraviesan areas con mayor contaminacion? Que hospitales dependen de una subestacion electrica vulnerable?\n\nLos embeddings convierten texto, imagenes o entidades en vectores numericos. Sirven para busqueda semantica, agrupamiento, recomendacion y deteccion de similitud.\n\nEn documentos urbanos, los embeddings pueden conectar reportes que usan palabras distintas para describir el mismo problema. \"falla de alumbrado\", \"lampara apagada\" y \"calle oscura\" pueden agruparse como incidentes relacionados.\n\nLos paneles muestran indicadores, mapas, series temporales y alertas. Deben evitar saturacion visual. Un buen panel permite responder preguntas concretas con rapidez.\n\nEl diseno debe distinguir informacion observada, estimada y recomendada. Si el usuario no sabe que parte proviene de un modelo, puede interpretar una prediccion como un hecho confirmado.\n\nAntes de un evento masivo, la ciudad puede estimar demanda de transporte, necesidades de seguridad, consumo de agua, residuos esperados y riesgo sanitario. Durante el evento, puede monitorear cambios y ajustar recursos.\n\nDespues del evento, se comparan predicciones con datos reales. Esa retroalimentacion mejora modelos futuros y permite evaluar si las decisiones fueron adecuadas.", title: "Apis permiten sistemas", title_candidates: ["apis permiten sistemas", "apis permiten", "permiten sistemas distintos", "sistemas distintos compartan", "distintos compartan datos"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 263};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-9"})
SET n:Chunk
SET n += {character_count: 1158, chunk_id: "graph-chunk-9", chunk_type: "merged_paragraphs", end_line: 255, node_id: "chunk:e23fede19fb9e33c:graph-chunk-9", order: 9, source_chunk_count: 6, source_chunk_ids: ["chunk-71", "chunk-72", "chunk-73", "chunk-74", "chunk-75", "chunk-76"], source_section_count: 3, source_section_ids: ["section-50", "section-51", "section-52"], source_section_titles: ["7.2 Ola de calor", "7.3 Reparacion de infraestructura", "7.4 Planeacion escolar"], start_line: 241, text: "Una ola de calor afecta salud, energia, agua, trabajo y educacion. Los modelos pueden identificar barrios con mayor riesgo por temperatura, edad de poblacion, baja vegetacion, vivienda precaria y falta de acceso a centros frescos.\n\nLa respuesta puede incluir apertura de refugios climaticos, comunicacion preventiva, redistribucion de personal medico y monitoreo electrico. El sistema debe priorizar zonas vulnerables, no solo zonas con mas reportes.\n\nCuando una avenida principal entra en reparacion, cambian rutas, tiempos de traslado, comercio local y acceso a servicios. Un modelo puede simular efectos y recomendar rutas alternas.\n\nEl analisis debe comunicarse a la poblacion con anticipacion. La calidad de la prediccion importa, pero tambien importa que las personas puedan planear.\n\nLa ciudad puede cruzar datos de crecimiento poblacional, transporte, trayectorias escolares y disponibilidad de aulas. Esto ayuda a decidir donde abrir grupos, reforzar escuelas o mejorar transporte escolar.\n\nUna decision educativa debe combinar datos con dialogo comunitario. Los numeros muestran tendencias, pero las familias y docentes explican barreras concretas.", title: "Ola calor afecta", title_candidates: ["ola calor afecta", "ola calor", "calor afecta salud", "afecta salud energia", "salud energia agua"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 163};

MERGE (n:Section {node_id: "section:e23fede19fb9e33c:graph-section-5"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 287, heading_type: "compacted", level: 1, node_id: "section:e23fede19fb9e33c:graph-section-5", order: 5, section_id: "graph-section-5", source_section_count: 9, source_section_ids: ["section-53", "section-54", "section-55", "section-56", "section-57", "section-58", "section-59", "section-60", "section-61"], source_section_titles: ["8. Riesgos frecuentes", "8.1 Dependencia excesiva del modelo", "8.2 Datos incompletos", "8.3 Fragmentacion institucional", "8.4 Mantenimiento insuficiente", "9. Indicadores de exito", "9.1 Indicadores tecnicos", "9.2 Indicadores operativos", "9.3 Indicadores sociales"], start_line: 257, title: "Bloque 5: Riesgos frecuentes - Indicadores de exito"};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-10"})
SET n:Chunk
SET n += {character_count: 1333, chunk_id: "graph-chunk-10", chunk_type: "merged_paragraphs", end_line: 287, node_id: "chunk:e23fede19fb9e33c:graph-chunk-10", order: 10, source_chunk_count: 7, source_chunk_ids: ["chunk-77", "chunk-78", "chunk-79", "chunk-80", "chunk-81", "chunk-82", "chunk-83"], source_section_count: 7, source_section_ids: ["section-54", "section-55", "section-56", "section-57", "section-59", "section-60", "section-61"], source_section_titles: ["8.1 Dependencia excesiva del modelo", "8.2 Datos incompletos", "8.3 Fragmentacion institucional", "8.4 Mantenimiento insuficiente", "9.1 Indicadores tecnicos", "9.2 Indicadores operativos", "9.3 Indicadores sociales"], start_line: 261, text: "Un riesgo comun es tratar el modelo como autoridad final. Esto puede desplazar juicio profesional y reducir responsabilidad. La recomendacion automatica debe verse como insumo, no como mandato.\n\nLa falta de datos puede ocultar necesidades. Las comunidades menos conectadas pueden producir menos registros digitales. Si el modelo aprende solo de datos visibles, refuerza desigualdades.\n\nLos datos urbanos suelen estar distribuidos entre dependencias. Si cada equipo usa formatos incompatibles, el analisis integrado se vuelve lento. La interoperabilidad requiere acuerdos, no solo software.\n\nLos proyectos de inteligencia artificial fallan cuando se financia el prototipo pero no el mantenimiento. Sensores, modelos, APIs y paneles requieren actualizacion continua.\n\nLos indicadores tecnicos incluyen disponibilidad del sistema, latencia, error predictivo, cobertura de datos, estabilidad, frecuencia de actualizacion y tasa de fallos.\n\nLos indicadores operativos incluyen reduccion de tiempos de respuesta, mejor asignacion de recursos, disminucion de incidentes, aumento de cobertura y mejora en continuidad de servicios.\n\nLos indicadores sociales incluyen confianza publica, percepcion de transparencia, equidad territorial, satisfaccion ciudadana y participacion. Estos indicadores son mas dificiles de medir, pero son esenciales.", title: "Riesgo comun tratar", title_candidates: ["riesgo comun tratar", "riesgo comun", "comun tratar modelo", "tratar modelo autoridad", "modelo autoridad final"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 175};

MERGE (n:Section {node_id: "section:e23fede19fb9e33c:graph-section-6"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 315, heading_type: "compacted", level: 1, node_id: "section:e23fede19fb9e33c:graph-section-6", order: 6, section_id: "graph-section-6", source_section_count: 7, source_section_ids: ["section-62", "section-63", "section-64", "section-65", "section-66", "section-67", "section-68"], source_section_titles: ["10. Conclusiones", "11. Glosario", "11.1 Dato crudo", "11.2 Metadato", "11.3 Modelo predictivo", "11.4 Grafo de conocimiento", "11.5 Desviacion de datos"], start_line: 289, title: "Bloque 6: Conclusiones - Glosario"};

MERGE (n:Chunk {node_id: "chunk:e23fede19fb9e33c:graph-chunk-11"})
SET n:Chunk
SET n += {character_count: 891, chunk_id: "graph-chunk-11", chunk_type: "merged_paragraphs", end_line: 315, node_id: "chunk:e23fede19fb9e33c:graph-chunk-11", order: 11, source_chunk_count: 7, source_chunk_ids: ["chunk-84", "chunk-85", "chunk-86", "chunk-87", "chunk-88", "chunk-89", "chunk-90"], source_section_count: 6, source_section_ids: ["section-62", "section-64", "section-65", "section-66", "section-67", "section-68"], source_section_titles: ["10. Conclusiones", "11.1 Dato crudo", "11.2 Metadato", "11.3 Modelo predictivo", "11.4 Grafo de conocimiento", "11.5 Desviacion de datos"], start_line: 291, text: "Un ecosistema urbano de aprendizaje profundo requiere mucho mas que algoritmos. Necesita datos confiables, instituciones coordinadas, explicaciones claras, controles eticos, monitoreo continuo y participacion ciudadana.\n\nLa inteligencia artificial puede ayudar a detectar patrones, anticipar riesgos y coordinar servicios. Su valor aparece cuando se conecta con decisiones concretas y se evalua con criterios humanos. Una ciudad inteligente debe ser tambien una ciudad legible, responsable y abierta a correccion.\n\nRegistro original antes de limpieza o transformacion.\n\nInformacion que describe origen, contexto, formato o calidad de un dato.\n\nSistema que estima un resultado futuro o desconocido a partir de patrones aprendidos.\n\nEstructura que representa entidades y relaciones para conectar informacion.\n\nCambio en la distribucion de los datos que puede reducir la precision de un modelo.", title: "Ecosistema urbano aprendizaje", title_candidates: ["ecosistema urbano aprendizaje", "ecosistema urbano", "urbano aprendizaje profundo", "aprendizaje profundo requiere", "profundo requiere mucho"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 122};

MERGE (n:Concept {node_id: "manual-node:e23fede19fb9e33c:181ce4f9526c"})
SET n:Concept
SET n += {created_at: "2026-07-03T03:23:20.819546+00:00", manual: true, node_id: "manual-node:e23fede19fb9e33c:181ce4f9526c", order: 12, text: "Ola ola ola", title: "Nodo 1"};

MERGE (n:Chunk {node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a"})
SET n:Chunk
SET n += {created_at: "2026-07-03T03:24:13.900458+00:00", manual: true, node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a", order: 13, text: "", title: "Asasa"};

MERGE (n:Concept {node_id: "manual-node:e23fede19fb9e33c:e5a9892cdc1a"})
SET n:Concept
SET n += {created_at: "2026-07-03T03:25:00.977550+00:00", manual: true, node_id: "manual-node:e23fede19fb9e33c:e5a9892cdc1a", order: 14, text: "", title: "Concepto"};

MERGE (n:Concept {node_id: "manual-node:e23fede19fb9e33c:b26237dd0b2e"})
SET n:Concept
SET n += {created_at: "2026-07-03T21:44:40.160533+00:00", manual: true, node_id: "manual-node:e23fede19fb9e33c:b26237dd0b2e", order: 15, text: "", title: "Concepto"};

MERGE (n:Section {node_id: "manual-node:e23fede19fb9e33c:e4aa5bc863a2"})
SET n:Section
SET n += {created_at: "2026-07-05T00:40:57.098929+00:00", manual: true, node_id: "manual-node:e23fede19fb9e33c:e4aa5bc863a2", order: 16, text: "", title: "Seccion"};

MATCH (source {node_id: "document:e23fede19fb9e33c"})
MATCH (target {node_id: "section:e23fede19fb9e33c:graph-section-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ac1f2cf62d96a9d1"}]->(target)
SET r += {order: 1, relationship_id: "relationship:ac1f2cf62d96a9d1", role: "contains_section"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-1"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:91b61c0cfb27ff5a"}]->(target)
SET r += {order: 1, relationship_id: "relationship:91b61c0cfb27ff5a", role: "contains_chunk"};

MATCH (source {node_id: "document:e23fede19fb9e33c"})
MATCH (target {node_id: "section:e23fede19fb9e33c:graph-section-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5741a7d510c66a4b"}]->(target)
SET r += {order: 3, relationship_id: "relationship:5741a7d510c66a4b", role: "contains_section"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-3"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:088523c83a9a94ed"}]->(target)
SET r += {order: 6, relationship_id: "relationship:088523c83a9a94ed", role: "contains_chunk"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-3"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-7"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f7780bbb14837fd2"}]->(target)
SET r += {order: 7, relationship_id: "relationship:f7780bbb14837fd2", role: "contains_chunk"};

MATCH (source {node_id: "document:e23fede19fb9e33c"})
MATCH (target {node_id: "section:e23fede19fb9e33c:graph-section-4"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:67f140651d7d6a05"}]->(target)
SET r += {order: 4, relationship_id: "relationship:67f140651d7d6a05", role: "contains_section"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-4"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-8"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d10209c7ccd2d93c"}]->(target)
SET r += {order: 8, relationship_id: "relationship:d10209c7ccd2d93c", role: "contains_chunk"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-4"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-9"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:247ecb9432fa2596"}]->(target)
SET r += {order: 9, relationship_id: "relationship:247ecb9432fa2596", role: "contains_chunk"};

MATCH (source {node_id: "document:e23fede19fb9e33c"})
MATCH (target {node_id: "section:e23fede19fb9e33c:graph-section-5"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:6d895347150055b8"}]->(target)
SET r += {order: 5, relationship_id: "relationship:6d895347150055b8", role: "contains_section"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-5"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-10"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ed4d78e03dd51806"}]->(target)
SET r += {order: 10, relationship_id: "relationship:ed4d78e03dd51806", role: "contains_chunk"};

MATCH (source {node_id: "document:e23fede19fb9e33c"})
MATCH (target {node_id: "section:e23fede19fb9e33c:graph-section-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f57a4e5b3b4b03f9"}]->(target)
SET r += {order: 6, relationship_id: "relationship:f57a4e5b3b4b03f9", role: "contains_section"};

MATCH (source {node_id: "section:e23fede19fb9e33c:graph-section-6"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-11"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3cc5dc8fa315ef70"}]->(target)
SET r += {order: 11, relationship_id: "relationship:3cc5dc8fa315ef70", role: "contains_chunk"};

MATCH (source {node_id: "chunk:e23fede19fb9e33c:graph-chunk-8"})
MATCH (target {node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:fd41cbadba48b9cc"}]->(target)
SET r += {created_at: "2026-07-03T03:24:13.997380+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:fd41cbadba48b9cc", status: "confirmed"};

MATCH (source {node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a"})
MATCH (target {node_id: "manual-node:e23fede19fb9e33c:e5a9892cdc1a"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:1770b4874f08f282"}]->(target)
SET r += {created_at: "2026-07-03T03:25:01.061337+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:1770b4874f08f282", status: "confirmed"};

MATCH (source {node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a"})
MATCH (target {node_id: "manual-node:e23fede19fb9e33c:181ce4f9526c"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c5766a1adb6b8686"}]->(target)
SET r += {created_at: "2026-07-03T21:44:17.819008+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:c5766a1adb6b8686", status: "confirmed"};

MATCH (source {node_id: "manual-node:e23fede19fb9e33c:b26237dd0b2e"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-7"})
MERGE (source)-[r:SEMANTIC {relationship_id: "relationship:c875793bb2779234"}]->(target)
SET r += {created_at: "2026-07-03T21:44:45.608613+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:c875793bb2779234", status: "confirmed", updated_at: "2026-07-03T21:44:50.637580+00:00"};

MATCH (source {node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a"})
MATCH (target {node_id: "chunk:e23fede19fb9e33c:graph-chunk-9"})
MERGE (source)-[r:BIDIRECTIONAL {relationship_id: "relationship:8d79bf885eca43ed"}]->(target)
SET r += {created_at: "2026-07-04T21:44:30.572634+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:8d79bf885eca43ed", status: "confirmed", updated_at: "2026-07-04T21:44:35.977874+00:00"};

MATCH (source {node_id: "chunk:e23fede19fb9e33c:graph-chunk-8"})
MATCH (target {node_id: "manual-node:e23fede19fb9e33c:e4aa5bc863a2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a28e40b5686627fd"}]->(target)
SET r += {created_at: "2026-07-05T00:40:58.910967+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:a28e40b5686627fd", status: "confirmed"};

MATCH (source {node_id: "manual-node:e23fede19fb9e33c:e4aa5bc863a2"})
MATCH (target {node_id: "manual-node:e23fede19fb9e33c:fe21fc67eb1a"})
MERGE (source)-[r:SEMANTIC {relationship_id: "relationship:d2f26f1ed94f2d79"}]->(target)
SET r += {created_at: "2026-07-05T00:41:00.128973+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:d2f26f1ed94f2d79", status: "confirmed", updated_at: "2026-07-05T00:41:02.877280+00:00"};

// Document: la ciudad aprende pero no se sabe bien por donde empieza todo esto
// Document ID: 97fa62eb5581dfa0
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

// Document: Ecosistema de aprendizaje profundo para una ciudad inteligente
// Document ID: 0a41ec96b7a9ed67
MERGE (n:Document {node_id: "document:0a41ec96b7a9ed67"})
SET n:Document
SET n += {document_id: "0a41ec96b7a9ed67", max_visible_sections: 7, node_id: "document:0a41ec96b7a9ed67", paragraph_count: 158, processing_status: "neo4j_export_ready", reading_graph_compaction: "section_budget_compaction", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/data/uploads/2026377bc55e4805a88665de7f77e0f9_test_1.md", title: "Ecosistema de aprendizaje profundo para una ciudad inteligente", visible_chunk_count: 11, visible_section_count: 6, word_count: 2914};

MERGE (n:Section {node_id: "section:0a41ec96b7a9ed67:graph-section-1"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 27, heading_type: "compacted", level: 1, node_id: "section:0a41ec96b7a9ed67:graph-section-1", order: 1, section_id: "graph-section-1", source_section_count: 5, source_section_ids: ["section-2", "section-3", "section-4", "section-5", "section-6"], source_section_titles: ["Introduccion general", "1. Marco conceptual", "1.1 Ciudad como sistema complejo", "1.2 Datos urbanos", "1.3 Aprendizaje profundo"], start_line: 3, title: "Bloque 1: Introduccion general - Marco conceptual"};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-1"})
SET n:Chunk
SET n += {character_count: 2457, chunk_id: "graph-chunk-1", chunk_type: "merged_paragraphs", end_line: 27, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-1", order: 1, source_chunk_count: 8, source_chunk_ids: ["chunk-1", "chunk-2", "chunk-3", "chunk-4", "chunk-5", "chunk-6", "chunk-7", "chunk-8"], source_section_count: 4, source_section_ids: ["section-2", "section-4", "section-5", "section-6"], source_section_titles: ["Introduccion general", "1.1 Ciudad como sistema complejo", "1.2 Datos urbanos", "1.3 Aprendizaje profundo"], start_line: 5, text: "Una ciudad inteligente no es solamente una ciudad llena de sensores. Es un sistema social, tecnico y administrativo que intenta convertir datos dispersos en decisiones utiles. Para que ese proceso funcione, la ciudad necesita infraestructura digital, reglas de gobernanza, modelos de analisis, equipos humanos capaces de interpretar resultados y mecanismos de participacion publica.\n\nEste documento describe un escenario amplio para probar como Lyceum procesa informacion extensa, organizada y con muchos niveles de estructura. El tema principal es el diseno de un ecosistema de aprendizaje profundo aplicado a movilidad, energia, salud publica, educacion, seguridad, agua, residuos y participacion ciudadana.\n\nUna ciudad combina flujos de personas, bienes, energia, informacion y decisiones. Cada flujo tiene patrones propios, pero tambien depende de los demas. Un cambio en transporte publico puede modificar el consumo electrico, la calidad del aire, el uso de espacios publicos y la puntualidad escolar.\n\nDesde una perspectiva de sistemas complejos, la ciudad no puede entenderse como una suma simple de edificios, avenidas y servicios. El comportamiento urbano emerge de interacciones entre actores, normas, tecnologias y restricciones materiales. Por eso, un modelo predictivo debe considerar relaciones indirectas y efectos acumulativos.\n\nLos datos urbanos provienen de fuentes heterogeneas. Algunas fuentes son continuas, como sensores de trafico, medidores de energia o estaciones de calidad del aire. Otras fuentes son periodicas, como censos, encuestas de movilidad, reportes escolares o inspecciones de infraestructura.\n\nLa calidad de los datos depende de su precision, cobertura, frecuencia, estabilidad y contexto. Un sensor puede registrar una medida exacta, pero si no se conoce su ubicacion, calibracion o periodo de mantenimiento, el dato puede producir conclusiones debiles.\n\nEl aprendizaje profundo usa redes neuronales con muchas capas para reconocer patrones en imagenes, texto, audio, series temporales y grafos. En una ciudad inteligente, estas tecnicas pueden usarse para prediccion de demanda, deteccion de anomalias, clasificacion de documentos, estimacion de riesgo y simulacion de escenarios.\n\nSin embargo, el aprendizaje profundo no reemplaza la interpretacion humana. Un modelo puede detectar correlaciones, pero la decision publica requiere explicar causas probables, evaluar impactos y justificar acciones ante la comunidad.", title: "Aprendizaje profundo", title_candidates: ["aprendizaje profundo", "ciudad inteligente", "calidad aire", "ciudad inteligente no", "inteligente no solamente"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 342};

MERGE (n:Section {node_id: "section:0a41ec96b7a9ed67:graph-section-2"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 139, heading_type: "compacted", level: 1, node_id: "section:0a41ec96b7a9ed67:graph-section-2", order: 2, section_id: "graph-section-2", source_section_count: 24, source_section_ids: ["section-7", "section-8", "section-9", "section-10", "section-11", "section-12", "section-13", "section-14", "section-15", "section-16", "section-17", "section-18", "section-19", "section-20", "section-21", "section-22", "section-23", "section-24", "section-25", "section-26", "section-27", "section-28", "section-29", "section-30"], source_section_titles: ["2. Arquitectura de datos", "2.1 Captura", "2.2 Ingestion", "2.3 Almacenamiento", "2.4 Catalogacion", "3. Modelos por dominio", "3.1 Movilidad", "3.1.1 Prediccion de demanda", "3.1.2 Optimizacion de rutas", "3.2 Energia", "3.2.1 Demanda electrica", "3.2.2 Generacion distribuida", "3.3 Salud publica", "3.3.1 Vigilancia epidemiologica", "3.3.2 Distribucion de recursos", "3.4 Educacion", "3.4.1 Trayectorias escolares", "3.4.2 Recursos de aprendizaje", "3.5 Seguridad y proteccion civil", "3.5.1 Deteccion de incidentes", "3.5.2 Riesgos naturales", "3.6 Agua y residuos", "3.6.1 Gestion del agua", "3.6.2 Residuos urbanos"], start_line: 29, title: "Bloque 2: Arquitectura de datos - Modelos por dominio"};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-2"})
SET n:Chunk
SET n += {character_count: 2052, chunk_id: "graph-chunk-2", chunk_type: "merged_paragraphs", end_line: 53, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-2", order: 2, source_chunk_count: 8, source_chunk_ids: ["chunk-9", "chunk-10", "chunk-11", "chunk-12", "chunk-13", "chunk-14", "chunk-15", "chunk-16"], source_section_count: 4, source_section_ids: ["section-8", "section-9", "section-10", "section-11"], source_section_titles: ["2.1 Captura", "2.2 Ingestion", "2.3 Almacenamiento", "2.4 Catalogacion"], start_line: 33, text: "La captura de datos comienza en dispositivos, formularios, sistemas administrativos y reportes ciudadanos. Cada fuente debe registrar metadatos basicos: fecha, ubicacion, responsable, metodo de recoleccion, unidad de medida y condiciones relevantes.\n\nEn movilidad, por ejemplo, la captura puede incluir conteo vehicular, velocidad promedio, uso de bicicleta publica, ocupacion de autobuses, incidentes viales y tiempos de traslado. En energia, puede incluir consumo por zona, carga maxima, generacion distribuida y fallas de suministro.\n\nLa ingestion transforma datos crudos en registros almacenables. Este proceso valida formatos, elimina duplicados evidentes, normaliza unidades y asigna identificadores. Una ingestion robusta evita que errores pequenos contaminen analisis posteriores.\n\nUn sistema urbano debe aceptar archivos CSV, documentos de texto, imagenes, flujos de eventos, bases relacionales y datos geoespaciales. Tambien debe registrar errores sin detener todo el proceso, porque las fuentes publicas suelen ser irregulares.\n\nEl almacenamiento puede organizarse en capas. Una capa conserva datos originales para auditoria. Otra capa contiene datos limpios y normalizados. Una tercera capa almacena representaciones analiticas, como vectores, embeddings, grafos o agregados temporales.\n\nLa separacion de capas permite reproducibilidad. Si un modelo produce una prediccion incorrecta, el equipo puede volver al dato original, revisar la limpieza, examinar la transformacion y detectar en que punto se genero el problema.\n\nLa catalogacion describe los conjuntos de datos disponibles. Incluye origen, propietario, licencia, sensibilidad, cobertura temporal, cobertura geografica, actualizacion, calidad y dependencias. Sin catalogo, los equipos terminan repitiendo trabajo o usando datos obsoletos.\n\nUn buen catalogo no solo lista tablas. Tambien explica conceptos. Por ejemplo, \"viaje\" puede significar una tarjeta validada, un desplazamiento completo, una ruta segmentada o una solicitud de transporte. Esas diferencias cambian el analisis.", title: "Debe registrar", title_candidates: ["debe registrar", "captura datos", "dispositivos formularios sistemas", "formularios sistemas administrativos", "sistemas administrativos reportes"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 270};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-3"})
SET n:Chunk
SET n += {character_count: 1995, chunk_id: "graph-chunk-3", chunk_type: "merged_paragraphs", end_line: 89, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-3", order: 3, source_chunk_count: 9, source_chunk_ids: ["chunk-17", "chunk-18", "chunk-19", "chunk-20", "chunk-21", "chunk-22", "chunk-23", "chunk-24", "chunk-25"], source_section_count: 5, source_section_ids: ["section-14", "section-15", "section-17", "section-18", "section-20"], source_section_titles: ["3.1.1 Prediccion de demanda", "3.1.2 Optimizacion de rutas", "3.2.1 Demanda electrica", "3.2.2 Generacion distribuida", "3.3.1 Vigilancia epidemiologica"], start_line: 61, text: "La prediccion de demanda estima cuantos usuarios usaran una linea, una estacion o una ruta en diferentes horarios. Puede combinar series temporales, clima, calendario escolar, eventos masivos y cambios operativos.\n\nUn modelo de demanda debe distinguir patrones normales de eventos excepcionales. La lluvia puede aumentar ciertos viajes y reducir otros. Un concierto puede saturar una estacion cercana durante una ventana corta, mientras que una obra vial puede modificar rutas durante semanas.\n\nLa optimizacion de rutas busca reducir tiempos de espera, mejorar cobertura y equilibrar costos. Los modelos pueden sugerir cambios de frecuencia, redistribucion de unidades o ajustes de paradas.\n\nPero una ruta no debe evaluarse solo por eficiencia promedio. Tambien importa la equidad. Una colonia con menos pasajeros puede necesitar servicio porque conecta a poblaciones con menor acceso a empleo, salud o educacion.\n\nLa demanda electrica cambia por temperatura, actividad economica, densidad habitacional, horarios laborales y adopcion de tecnologias. Los modelos pueden anticipar picos, detectar anomalias y estimar necesidades de mantenimiento.\n\nLa prediccion energetica debe considerar incertidumbre. Una ola de calor puede elevar el uso de aire acondicionado y tensionar la red. Un modelo que entregue intervalos de confianza ayuda a planear respuestas preventivas.\n\nLos paneles solares, baterias y microredes generan nuevos patrones. La ciudad puede pasar de un esquema centralizado a uno mixto, donde algunos barrios producen parte de su energia.\n\nEl aprendizaje profundo puede ayudar a estimar generacion esperada, identificar fallas y coordinar almacenamiento. Aun asi, las decisiones deben alinearse con regulaciones, seguridad y capacidad financiera de los usuarios.\n\nLa vigilancia epidemiologica analiza consultas, sintomas reportados, ventas de medicamentos, ausentismo escolar y datos ambientales. El objetivo es detectar cambios tempranos que indiquen un brote o un riesgo emergente.", title: "Prediccion demanda estima", title_candidates: ["prediccion demanda estima", "prediccion demanda", "demanda estima cuantos", "estima cuantos usuarios", "cuantos usuarios usaran"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 280};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-4"})
SET n:Chunk
SET n += {character_count: 1988, chunk_id: "graph-chunk-4", chunk_type: "merged_paragraphs", end_line: 119, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-4", order: 4, source_chunk_count: 9, source_chunk_ids: ["chunk-26", "chunk-27", "chunk-28", "chunk-29", "chunk-30", "chunk-31", "chunk-32", "chunk-33", "chunk-34"], source_section_count: 5, source_section_ids: ["section-20", "section-21", "section-23", "section-24", "section-26"], source_section_titles: ["3.3.1 Vigilancia epidemiologica", "3.3.2 Distribucion de recursos", "3.4.1 Trayectorias escolares", "3.4.2 Recursos de aprendizaje", "3.5.1 Deteccion de incidentes"], start_line: 91, text: "Los modelos deben manejar sesgos. Una zona con pocos reportes no necesariamente tiene menos enfermedad; puede tener menor acceso a clinicas o menor confianza en instituciones. Por eso, los resultados deben contrastarse con conocimiento local.\n\nLa distribucion de recursos decide donde ubicar brigadas, vacunas, medicamentos o personal. Un sistema predictivo puede priorizar zonas con mayor riesgo, pero debe explicar criterios para evitar decisiones opacas.\n\nLa transparencia es especialmente importante en salud, porque los errores pueden afectar vidas. Una recomendacion automatica debe ser revisada por profesionales y documentada con evidencia comprensible.\n\nLos datos educativos pueden incluir asistencia, calificaciones, evaluaciones diagnosticas, conectividad, movilidad, apoyos sociales y participacion familiar. El objetivo no es etiquetar estudiantes, sino detectar necesidades de apoyo.\n\nUn modelo puede identificar patrones de abandono probable, pero la intervencion debe ser cuidadosa. Si el sistema solo produce alertas, puede aumentar carga administrativa. Si produce explicaciones y sugerencias, puede apoyar mejor a docentes y orientadores.\n\nLos sistemas de recomendacion pueden sugerir materiales segun brechas de aprendizaje. Para ser utiles, deben considerar nivel, idioma, accesibilidad, contexto cultural y disponibilidad tecnologica.\n\nLa recomendacion educativa no debe reducirse a maximizar clics. Debe promover comprension, practica sostenida y autonomia. Un recurso popular no siempre es el recurso correcto para una dificultad especifica.\n\nLos sistemas pueden integrar llamadas de emergencia, reportes ciudadanos, camaras, sensores ambientales y datos meteorologicos. El objetivo es mejorar tiempos de respuesta y prevenir riesgos.\n\nEl uso de datos de seguridad requiere limites claros. Debe evitar vigilancia invasiva, discriminacion y decisiones automaticas sin supervisiion. La proteccion civil debe orientarse a cuidado publico, no a control indiscriminado.", title: "Debe ser", title_candidates: ["debe ser", "modelos deben manejar", "modelos deben", "deben manejar sesgos", "manejar sesgos zona"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 262};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-5"})
SET n:Chunk
SET n += {character_count: 1162, chunk_id: "graph-chunk-5", chunk_type: "merged_paragraphs", end_line: 139, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-5", order: 5, source_chunk_count: 6, source_chunk_ids: ["chunk-35", "chunk-36", "chunk-37", "chunk-38", "chunk-39", "chunk-40"], source_section_count: 3, source_section_ids: ["section-27", "section-29", "section-30"], source_section_titles: ["3.5.2 Riesgos naturales", "3.6.1 Gestion del agua", "3.6.2 Residuos urbanos"], start_line: 123, text: "Inundaciones, incendios, deslizamientos y olas de calor pueden modelarse con datos geograficos, historicos y climaticos. Las redes neuronales pueden reconocer patrones complejos, pero la comunicacion del riesgo debe ser sencilla.\n\nUna alerta efectiva indica que ocurre, donde ocurre, que tan urgente es y que acciones debe tomar la poblacion. El mejor modelo pierde valor si la alerta llega tarde o no se entiende.\n\nLa gestion del agua incluye captacion, potabilizacion, distribucion, consumo, fugas y tratamiento. Los modelos pueden detectar perdidas probables, estimar demanda y priorizar reparaciones.\n\nLas fugas no siempre se observan directamente. Se infieren por presion, consumo anomalo, reportes vecinales y cambios en el terreno. La combinacion de datos mejora la deteccion.\n\nLa recoleccion de residuos depende de densidad, actividad comercial, habitos de consumo, calendario y rutas. Un modelo puede estimar volumen por zona y ajustar frecuencia de recoleccion.\n\nTambien puede apoyar reciclaje al identificar materiales, ubicar puntos de acopio y detectar zonas con baja separacion. Pero el cambio requiere educacion, incentivos y servicios confiables.", title: "Inundaciones incendios deslizamientos", title_candidates: ["inundaciones incendios deslizamientos", "inundaciones incendios", "incendios deslizamientos olas", "deslizamientos olas calor", "modelarse datos geograficos"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 166};

MERGE (n:Section {node_id: "section:0a41ec96b7a9ed67:graph-section-3"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 203, heading_type: "compacted", level: 1, node_id: "section:0a41ec96b7a9ed67:graph-section-3", order: 3, section_id: "graph-section-3", source_section_count: 12, source_section_ids: ["section-31", "section-32", "section-33", "section-34", "section-35", "section-36", "section-37", "section-38", "section-39", "section-40", "section-41", "section-42"], source_section_titles: ["4. Gobernanza y etica", "4.1 Privacidad", "4.2 Explicabilidad", "4.3 Equidad", "4.4 Participacion ciudadana", "5. Ciclo de vida del modelo", "5.1 Definicion del problema", "5.2 Preparacion de datos", "5.3 Entrenamiento", "5.4 Evaluacion", "5.5 Despliegue", "5.6 Monitoreo"], start_line: 141, title: "Bloque 3: Gobernanza y etica - Ciclo de vida del modelo"};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-6"})
SET n:Chunk
SET n += {character_count: 1839, chunk_id: "graph-chunk-6", chunk_type: "merged_paragraphs", end_line: 171, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-6", order: 6, source_chunk_count: 9, source_chunk_ids: ["chunk-41", "chunk-42", "chunk-43", "chunk-44", "chunk-45", "chunk-46", "chunk-47", "chunk-48", "chunk-49"], source_section_count: 5, source_section_ids: ["section-32", "section-33", "section-34", "section-35", "section-37"], source_section_titles: ["4.1 Privacidad", "4.2 Explicabilidad", "4.3 Equidad", "4.4 Participacion ciudadana", "5.1 Definicion del problema"], start_line: 145, text: "La privacidad debe incorporarse desde el diseno. No basta con eliminar nombres si los datos pueden reidentificar personas por ubicacion, horarios o combinaciones raras. La minimizacion de datos reduce riesgos.\n\nUn proyecto responsable define que datos son necesarios, por cuanto tiempo se conservan, quien puede acceder a ellos y como se audita el uso. Tambien establece procedimientos para incidentes de seguridad.\n\nLa explicabilidad permite entender por que un modelo recomienda una accion. En administracion publica, la explicacion no es un lujo tecnico; es parte de la rendicion de cuentas.\n\nAlgunas tecnicas generan importancia de variables, ejemplos similares o reglas aproximadas. Ninguna explicacion es perfecta, pero una explicacion parcial puede ser mejor que una decision cerrada e incomprensible.\n\nLa equidad exige revisar impactos diferenciados. Un modelo puede ser preciso en promedio y fallar en comunidades pequenas, perifericas o historicamente subrepresentadas. Por eso, las metricas deben desagregarse.\n\nTambien se deben evaluar costos de error. Un falso positivo puede desperdiciar recursos, pero un falso negativo puede dejar sin apoyo a una comunidad vulnerable. La comparacion depende del dominio.\n\nLa participacion ciudadana permite validar prioridades, corregir supuestos y construir confianza. Los habitantes conocen problemas que no siempre aparecen en bases de datos.\n\nUn sistema urbano debe permitir reportar errores, solicitar explicaciones y proponer mejoras. La tecnologia publica funciona mejor cuando las personas pueden discutirla, no solo recibirla.\n\nAntes de entrenar un modelo, el equipo debe definir una pregunta operacional. Una pregunta como \"mejorar movilidad\" es demasiado amplia. Una pregunta como \"predecir ocupacion de estaciones cada quince minutos para ajustar frecuencia\" es mas accionable.", title: "Privacidad debe incorporarse", title_candidates: ["privacidad debe incorporarse", "privacidad debe", "debe incorporarse diseno", "incorporarse diseno no", "diseno no basta"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 259};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-7"})
SET n:Chunk
SET n += {character_count: 2253, chunk_id: "graph-chunk-7", chunk_type: "merged_paragraphs", end_line: 203, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-7", order: 7, source_chunk_count: 11, source_chunk_ids: ["chunk-50", "chunk-51", "chunk-52", "chunk-53", "chunk-54", "chunk-55", "chunk-56", "chunk-57", "chunk-58", "chunk-59", "chunk-60"], source_section_count: 6, source_section_ids: ["section-37", "section-38", "section-39", "section-40", "section-41", "section-42"], source_section_titles: ["5.1 Definicion del problema", "5.2 Preparacion de datos", "5.3 Entrenamiento", "5.4 Evaluacion", "5.5 Despliegue", "5.6 Monitoreo"], start_line: 173, text: "La definicion debe incluir usuarios, decisiones, limites, datos disponibles, indicadores de exito y riesgos. Si no se define la decision final, el modelo puede convertirse en una demostracion sin uso real.\n\nLa preparacion incluye limpieza, normalizacion, union de fuentes, manejo de valores faltantes, deteccion de valores extremos y construccion de variables. Esta etapa suele consumir mas tiempo que el entrenamiento.\n\nEn datos urbanos, las inconsistencias son frecuentes. Una misma colonia puede tener nombres distintos. Una estacion puede cambiar de codigo. Un sensor puede quedar fuera de servicio. La preparacion debe registrar esos casos.\n\nEl entrenamiento ajusta parametros del modelo a partir de datos historicos. Se deben separar datos de entrenamiento, validacion y prueba para estimar desempeno sin autoengano.\n\nLos modelos profundos pueden requerir GPUs, pero no siempre son necesarios. Para algunos problemas, un modelo simple y explicable puede funcionar mejor. La seleccion debe basarse en evidencia, no en prestigio tecnico.\n\nLa evaluacion mide precision, error, robustez, estabilidad y utilidad operativa. Una metrica tecnica puede no capturar el valor real. Por ejemplo, reducir error promedio en demanda no sirve si el modelo falla en horas pico.\n\nTambien se deben hacer pruebas de estres. Que pasa si falta una fuente? Que pasa si cambia el clima? Que pasa si hay un evento masivo? Las respuestas ayudan a preparar planes de contingencia.\n\nEl despliegue integra el modelo con sistemas reales. Incluye APIs, paneles, alertas, permisos, monitoreo y documentacion. Un modelo desplegado sin monitoreo puede degradarse silenciosamente.\n\nEl despliegue debe ser gradual. Primero puede operar en modo observacion, comparando predicciones con decisiones humanas. Luego puede pasar a recomendaciones asistidas. Las decisiones criticas requieren supervision.\n\nEl monitoreo detecta desviacion de datos, cambio de distribucion, caida de precision, errores de servicio y uso indebido. Tambien registra si las recomendaciones se aplican y con que resultado.\n\nUn modelo urbano vive en un ambiente cambiante. Nuevas rutas, obras, politicas, habitos y crisis pueden volver obsoleto un modelo. El monitoreo permite decidir cuando recalibrar o retirar.", title: "Definicion debe incluir", title_candidates: ["definicion debe incluir", "definicion debe", "debe incluir usuarios", "incluir usuarios decisiones", "usuarios decisiones limites"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 327};

MERGE (n:Section {node_id: "section:0a41ec96b7a9ed67:graph-section-4"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 255, heading_type: "compacted", level: 1, node_id: "section:0a41ec96b7a9ed67:graph-section-4", order: 4, section_id: "graph-section-4", source_section_count: 10, source_section_ids: ["section-43", "section-44", "section-45", "section-46", "section-47", "section-48", "section-49", "section-50", "section-51", "section-52"], source_section_titles: ["6. Infraestructura tecnica", "6.1 APIs", "6.2 Grafos de conocimiento", "6.3 Embeddings", "6.4 Paneles de control", "7. Escenarios de uso", "7.1 Evento masivo", "7.2 Ola de calor", "7.3 Reparacion de infraestructura", "7.4 Planeacion escolar"], start_line: 205, title: "Bloque 4: Infraestructura tecnica - Escenarios de uso"};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-8"})
SET n:Chunk
SET n += {character_count: 1925, chunk_id: "graph-chunk-8", chunk_type: "merged_paragraphs", end_line: 237, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-8", order: 8, source_chunk_count: 10, source_chunk_ids: ["chunk-61", "chunk-62", "chunk-63", "chunk-64", "chunk-65", "chunk-66", "chunk-67", "chunk-68", "chunk-69", "chunk-70"], source_section_count: 5, source_section_ids: ["section-44", "section-45", "section-46", "section-47", "section-49"], source_section_titles: ["6.1 APIs", "6.2 Grafos de conocimiento", "6.3 Embeddings", "6.4 Paneles de control", "7.1 Evento masivo"], start_line: 209, text: "Las APIs permiten que sistemas distintos compartan datos y resultados. Deben tener autenticacion, control de version, limites de uso y documentacion clara.\n\nUna API de prediccion podria recibir zona, horario y condiciones, y devolver demanda esperada junto con confianza y factores principales. Una API de consulta podria devolver historiales y metadatos.\n\nUn grafo de conocimiento representa entidades y relaciones: estaciones, rutas, barrios, escuelas, hospitales, sensores, incidentes y politicas. Este tipo de estructura ayuda a conectar informacion dispersa.\n\nLos grafos permiten preguntas como: que escuelas estan cerca de zonas con baja conectividad y alta desercion? Que rutas atraviesan areas con mayor contaminacion? Que hospitales dependen de una subestacion electrica vulnerable?\n\nLos embeddings convierten texto, imagenes o entidades en vectores numericos. Sirven para busqueda semantica, agrupamiento, recomendacion y deteccion de similitud.\n\nEn documentos urbanos, los embeddings pueden conectar reportes que usan palabras distintas para describir el mismo problema. \"falla de alumbrado\", \"lampara apagada\" y \"calle oscura\" pueden agruparse como incidentes relacionados.\n\nLos paneles muestran indicadores, mapas, series temporales y alertas. Deben evitar saturacion visual. Un buen panel permite responder preguntas concretas con rapidez.\n\nEl diseno debe distinguir informacion observada, estimada y recomendada. Si el usuario no sabe que parte proviene de un modelo, puede interpretar una prediccion como un hecho confirmado.\n\nAntes de un evento masivo, la ciudad puede estimar demanda de transporte, necesidades de seguridad, consumo de agua, residuos esperados y riesgo sanitario. Durante el evento, puede monitorear cambios y ajustar recursos.\n\nDespues del evento, se comparan predicciones con datos reales. Esa retroalimentacion mejora modelos futuros y permite evaluar si las decisiones fueron adecuadas.", title: "Apis permiten sistemas", title_candidates: ["apis permiten sistemas", "apis permiten", "permiten sistemas distintos", "sistemas distintos compartan", "distintos compartan datos"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 263};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-9"})
SET n:Chunk
SET n += {character_count: 1158, chunk_id: "graph-chunk-9", chunk_type: "merged_paragraphs", end_line: 255, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-9", order: 9, source_chunk_count: 6, source_chunk_ids: ["chunk-71", "chunk-72", "chunk-73", "chunk-74", "chunk-75", "chunk-76"], source_section_count: 3, source_section_ids: ["section-50", "section-51", "section-52"], source_section_titles: ["7.2 Ola de calor", "7.3 Reparacion de infraestructura", "7.4 Planeacion escolar"], start_line: 241, text: "Una ola de calor afecta salud, energia, agua, trabajo y educacion. Los modelos pueden identificar barrios con mayor riesgo por temperatura, edad de poblacion, baja vegetacion, vivienda precaria y falta de acceso a centros frescos.\n\nLa respuesta puede incluir apertura de refugios climaticos, comunicacion preventiva, redistribucion de personal medico y monitoreo electrico. El sistema debe priorizar zonas vulnerables, no solo zonas con mas reportes.\n\nCuando una avenida principal entra en reparacion, cambian rutas, tiempos de traslado, comercio local y acceso a servicios. Un modelo puede simular efectos y recomendar rutas alternas.\n\nEl analisis debe comunicarse a la poblacion con anticipacion. La calidad de la prediccion importa, pero tambien importa que las personas puedan planear.\n\nLa ciudad puede cruzar datos de crecimiento poblacional, transporte, trayectorias escolares y disponibilidad de aulas. Esto ayuda a decidir donde abrir grupos, reforzar escuelas o mejorar transporte escolar.\n\nUna decision educativa debe combinar datos con dialogo comunitario. Los numeros muestran tendencias, pero las familias y docentes explican barreras concretas.", title: "Ola calor afecta", title_candidates: ["ola calor afecta", "ola calor", "calor afecta salud", "afecta salud energia", "salud energia agua"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 163};

MERGE (n:Section {node_id: "section:0a41ec96b7a9ed67:graph-section-5"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 287, heading_type: "compacted", level: 1, node_id: "section:0a41ec96b7a9ed67:graph-section-5", order: 5, section_id: "graph-section-5", source_section_count: 9, source_section_ids: ["section-53", "section-54", "section-55", "section-56", "section-57", "section-58", "section-59", "section-60", "section-61"], source_section_titles: ["8. Riesgos frecuentes", "8.1 Dependencia excesiva del modelo", "8.2 Datos incompletos", "8.3 Fragmentacion institucional", "8.4 Mantenimiento insuficiente", "9. Indicadores de exito", "9.1 Indicadores tecnicos", "9.2 Indicadores operativos", "9.3 Indicadores sociales"], start_line: 257, title: "Bloque 5: Riesgos frecuentes - Indicadores de exito"};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-10"})
SET n:Chunk
SET n += {character_count: 1333, chunk_id: "graph-chunk-10", chunk_type: "merged_paragraphs", end_line: 287, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-10", order: 10, source_chunk_count: 7, source_chunk_ids: ["chunk-77", "chunk-78", "chunk-79", "chunk-80", "chunk-81", "chunk-82", "chunk-83"], source_section_count: 7, source_section_ids: ["section-54", "section-55", "section-56", "section-57", "section-59", "section-60", "section-61"], source_section_titles: ["8.1 Dependencia excesiva del modelo", "8.2 Datos incompletos", "8.3 Fragmentacion institucional", "8.4 Mantenimiento insuficiente", "9.1 Indicadores tecnicos", "9.2 Indicadores operativos", "9.3 Indicadores sociales"], start_line: 261, text: "Un riesgo comun es tratar el modelo como autoridad final. Esto puede desplazar juicio profesional y reducir responsabilidad. La recomendacion automatica debe verse como insumo, no como mandato.\n\nLa falta de datos puede ocultar necesidades. Las comunidades menos conectadas pueden producir menos registros digitales. Si el modelo aprende solo de datos visibles, refuerza desigualdades.\n\nLos datos urbanos suelen estar distribuidos entre dependencias. Si cada equipo usa formatos incompatibles, el analisis integrado se vuelve lento. La interoperabilidad requiere acuerdos, no solo software.\n\nLos proyectos de inteligencia artificial fallan cuando se financia el prototipo pero no el mantenimiento. Sensores, modelos, APIs y paneles requieren actualizacion continua.\n\nLos indicadores tecnicos incluyen disponibilidad del sistema, latencia, error predictivo, cobertura de datos, estabilidad, frecuencia de actualizacion y tasa de fallos.\n\nLos indicadores operativos incluyen reduccion de tiempos de respuesta, mejor asignacion de recursos, disminucion de incidentes, aumento de cobertura y mejora en continuidad de servicios.\n\nLos indicadores sociales incluyen confianza publica, percepcion de transparencia, equidad territorial, satisfaccion ciudadana y participacion. Estos indicadores son mas dificiles de medir, pero son esenciales.", title: "Riesgo comun tratar", title_candidates: ["riesgo comun tratar", "riesgo comun", "comun tratar modelo", "tratar modelo autoridad", "modelo autoridad final"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 175};

MERGE (n:Section {node_id: "section:0a41ec96b7a9ed67:graph-section-6"})
SET n:Section
SET n += {compaction_method: "merged_adjacent_sections", end_line: 315, heading_type: "compacted", level: 1, node_id: "section:0a41ec96b7a9ed67:graph-section-6", order: 6, section_id: "graph-section-6", source_section_count: 7, source_section_ids: ["section-62", "section-63", "section-64", "section-65", "section-66", "section-67", "section-68"], source_section_titles: ["10. Conclusiones", "11. Glosario", "11.1 Dato crudo", "11.2 Metadato", "11.3 Modelo predictivo", "11.4 Grafo de conocimiento", "11.5 Desviacion de datos"], start_line: 289, title: "Bloque 6: Conclusiones - Glosario"};

MERGE (n:Chunk {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-11"})
SET n:Chunk
SET n += {character_count: 891, chunk_id: "graph-chunk-11", chunk_type: "merged_paragraphs", end_line: 315, node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-11", order: 11, source_chunk_count: 7, source_chunk_ids: ["chunk-84", "chunk-85", "chunk-86", "chunk-87", "chunk-88", "chunk-89", "chunk-90"], source_section_count: 6, source_section_ids: ["section-62", "section-64", "section-65", "section-66", "section-67", "section-68"], source_section_titles: ["10. Conclusiones", "11.1 Dato crudo", "11.2 Metadato", "11.3 Modelo predictivo", "11.4 Grafo de conocimiento", "11.5 Desviacion de datos"], start_line: 291, text: "Un ecosistema urbano de aprendizaje profundo requiere mucho mas que algoritmos. Necesita datos confiables, instituciones coordinadas, explicaciones claras, controles eticos, monitoreo continuo y participacion ciudadana.\n\nLa inteligencia artificial puede ayudar a detectar patrones, anticipar riesgos y coordinar servicios. Su valor aparece cuando se conecta con decisiones concretas y se evalua con criterios humanos. Una ciudad inteligente debe ser tambien una ciudad legible, responsable y abierta a correccion.\n\nRegistro original antes de limpieza o transformacion.\n\nInformacion que describe origen, contexto, formato o calidad de un dato.\n\nSistema que estima un resultado futuro o desconocido a partir de patrones aprendidos.\n\nEstructura que representa entidades y relaciones para conectar informacion.\n\nCambio en la distribucion de los datos que puede reducir la precision de un modelo.", title: "Ecosistema urbano aprendizaje", title_candidates: ["ecosistema urbano aprendizaje", "ecosistema urbano", "urbano aprendizaje profundo", "aprendizaje profundo requiere", "profundo requiere mucho"], title_reason: "Selected as the clearest cue for this compact reading chunk.", title_source: "local_ngram", word_count: 122};

MERGE (n:Section {node_id: "manual-node:0a41ec96b7a9ed67:99a30e37e3a2"})
SET n:Section
SET n += {created_at: "2026-07-04T02:31:10.742437+00:00", manual: true, node_id: "manual-node:0a41ec96b7a9ed67:99a30e37e3a2", order: 12, text: "As", title: "Sección 45"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "section:0a41ec96b7a9ed67:graph-section-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:db806ec2f4034e30"}]->(target)
SET r += {order: 1, relationship_id: "relationship:db806ec2f4034e30", role: "contains_section"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-1"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5ca0ae7e7967ac92"}]->(target)
SET r += {order: 1, relationship_id: "relationship:5ca0ae7e7967ac92", role: "contains_chunk"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "section:0a41ec96b7a9ed67:graph-section-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:331c159953d2a7d6"}]->(target)
SET r += {order: 2, relationship_id: "relationship:331c159953d2a7d6", role: "contains_section"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-2"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:8f3d06575aba405c"}]->(target)
SET r += {order: 2, relationship_id: "relationship:8f3d06575aba405c", role: "contains_chunk"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-2"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a327f8e46cd9f213"}]->(target)
SET r += {order: 3, relationship_id: "relationship:a327f8e46cd9f213", role: "contains_chunk"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-2"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-4"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7da46a005a5f9267"}]->(target)
SET r += {order: 4, relationship_id: "relationship:7da46a005a5f9267", role: "contains_chunk"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-2"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-5"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:88a2bf91b2dc2c64"}]->(target)
SET r += {order: 5, relationship_id: "relationship:88a2bf91b2dc2c64", role: "contains_chunk"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "section:0a41ec96b7a9ed67:graph-section-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2c08212c0df41f0e"}]->(target)
SET r += {order: 3, relationship_id: "relationship:2c08212c0df41f0e", role: "contains_section"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-3"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:6097f5f0d6dca992"}]->(target)
SET r += {order: 6, relationship_id: "relationship:6097f5f0d6dca992", role: "contains_chunk"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-3"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-7"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a258bb6f2278fea3"}]->(target)
SET r += {order: 7, relationship_id: "relationship:a258bb6f2278fea3", role: "contains_chunk"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "section:0a41ec96b7a9ed67:graph-section-4"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:8a51eee7abded474"}]->(target)
SET r += {order: 4, relationship_id: "relationship:8a51eee7abded474", role: "contains_section"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-4"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-8"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7dc423625f4455b3"}]->(target)
SET r += {order: 8, relationship_id: "relationship:7dc423625f4455b3", role: "contains_chunk"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-4"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-9"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:88da8b7bc90bda31"}]->(target)
SET r += {order: 9, relationship_id: "relationship:88da8b7bc90bda31", role: "contains_chunk"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "section:0a41ec96b7a9ed67:graph-section-5"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:0d42b2acc8a4c11e"}]->(target)
SET r += {order: 5, relationship_id: "relationship:0d42b2acc8a4c11e", role: "contains_section"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-5"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-10"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ad5f124032db1953"}]->(target)
SET r += {order: 10, relationship_id: "relationship:ad5f124032db1953", role: "contains_chunk"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "section:0a41ec96b7a9ed67:graph-section-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:db3de7ed02f864e7"}]->(target)
SET r += {order: 6, relationship_id: "relationship:db3de7ed02f864e7", role: "contains_section"};

MATCH (source {node_id: "section:0a41ec96b7a9ed67:graph-section-6"})
MATCH (target {node_id: "chunk:0a41ec96b7a9ed67:graph-chunk-11"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b8c6ef1036c9f87f"}]->(target)
SET r += {order: 11, relationship_id: "relationship:b8c6ef1036c9f87f", role: "contains_chunk"};

MATCH (source {node_id: "document:0a41ec96b7a9ed67"})
MATCH (target {node_id: "manual-node:0a41ec96b7a9ed67:99a30e37e3a2"})
MERGE (source)-[r:SEMANTIC {relationship_id: "relationship:a9d02e130769225c"}]->(target)
SET r += {created_at: "2026-07-04T02:31:24.694296+00:00", manual: true, reason: "Conexion creada desde el canvas", relationship_id: "relationship:a9d02e130769225c", status: "confirmed", updated_at: "2026-07-04T02:31:31.129578+00:00"};

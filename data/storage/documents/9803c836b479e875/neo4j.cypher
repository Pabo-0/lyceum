MERGE (n:Document {node_id: "document:9803c836b479e875"})
SET n:Document
SET n += {document_id: "9803c836b479e875", node_id: "document:9803c836b479e875", paragraph_count: 158, processing_status: "neo4j_export_ready", source_extension: ".md", source_path: "D:/PABLO/Lyceum Project/lyceum/backend/../data/uploads/d35f0dd69e3f4a73b44964b97a1f68da_test_1.md", title: "Ecosistema de aprendizaje profundo para una ciudad inteligente", word_count: 2914};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-2"})
SET n:Section
SET n += {end_line: 7, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-2", order: 2, section_id: "section-2", start_line: 3, title: "Introduccion general"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-1"})
SET n:Chunk
SET n += {character_count: 382, chunk_id: "chunk-1", chunk_type: "paragraph", end_line: 5, node_id: "chunk:9803c836b479e875:chunk-1", order: 1, start_line: 5, text: "Una ciudad inteligente no es solamente una ciudad llena de sensores. Es un sistema social, tecnico y administrativo que intenta convertir datos dispersos en decisiones utiles. Para que ese proceso funcione, la ciudad necesita infraestructura digital, reglas de gobernanza, modelos de analisis, equipos humanos capaces de interpretar resultados y mecanismos de participacion publica.", title: "Ciudad inteligente no", title_candidates: ["ciudad inteligente no", "ciudad inteligente", "inteligente no solamente", "no solamente ciudad", "solamente ciudad llena"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 53};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-2"})
SET n:Chunk
SET n += {character_count: 325, chunk_id: "chunk-2", chunk_type: "paragraph", end_line: 7, node_id: "chunk:9803c836b479e875:chunk-2", order: 2, start_line: 7, text: "Este documento describe un escenario amplio para probar como Lyceum procesa informacion extensa, organizada y con muchos niveles de estructura. El tema principal es el diseno de un ecosistema de aprendizaje profundo aplicado a movilidad, energia, salud publica, educacion, seguridad, agua, residuos y participacion ciudadana.", title: "Documento describe escenario", title_candidates: ["documento describe escenario", "documento describe", "describe escenario amplio", "escenario amplio probar", "amplio probar lyceum"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 45};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-3"})
SET n:Section
SET n += {end_line: 9, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-3", numbering: "1", order: 3, section_id: "section-3", start_line: 9, title: "1. Marco conceptual"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-4"})
SET n:Section
SET n += {end_line: 15, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-4", numbering: "1.1", order: 4, section_id: "section-4", start_line: 11, title: "1.1 Ciudad como sistema complejo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-3"})
SET n:Chunk
SET n += {character_count: 296, chunk_id: "chunk-3", chunk_type: "paragraph", end_line: 13, node_id: "chunk:9803c836b479e875:chunk-3", order: 3, start_line: 13, text: "Una ciudad combina flujos de personas, bienes, energia, informacion y decisiones. Cada flujo tiene patrones propios, pero tambien depende de los demas. Un cambio en transporte publico puede modificar el consumo electrico, la calidad del aire, el uso de espacios publicos y la puntualidad escolar.", title: "Ciudad combina flujos", title_candidates: ["ciudad combina flujos", "ciudad combina", "combina flujos personas", "flujos personas bienes", "personas bienes energia"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 45};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-4"})
SET n:Chunk
SET n += {character_count: 335, chunk_id: "chunk-4", chunk_type: "paragraph", end_line: 15, node_id: "chunk:9803c836b479e875:chunk-4", order: 4, start_line: 15, text: "Desde una perspectiva de sistemas complejos, la ciudad no puede entenderse como una suma simple de edificios, avenidas y servicios. El comportamiento urbano emerge de interacciones entre actores, normas, tecnologias y restricciones materiales. Por eso, un modelo predictivo debe considerar relaciones indirectas y efectos acumulativos.", title: "Perspectiva sistemas complejos", title_candidates: ["perspectiva sistemas complejos", "perspectiva sistemas", "sistemas complejos ciudad", "complejos ciudad no", "entenderse suma simple"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 45};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-5"})
SET n:Section
SET n += {end_line: 21, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-5", numbering: "1.2", order: 5, section_id: "section-5", start_line: 17, title: "1.2 Datos urbanos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-5"})
SET n:Chunk
SET n += {character_count: 285, chunk_id: "chunk-5", chunk_type: "paragraph", end_line: 19, node_id: "chunk:9803c836b479e875:chunk-5", order: 5, start_line: 19, text: "Los datos urbanos provienen de fuentes heterogeneas. Algunas fuentes son continuas, como sensores de trafico, medidores de energia o estaciones de calidad del aire. Otras fuentes son periodicas, como censos, encuestas de movilidad, reportes escolares o inspecciones de infraestructura.", title: "Datos urbanos provienen", title_candidates: ["datos urbanos provienen", "datos urbanos", "urbanos provienen fuentes", "provienen fuentes heterogeneas", "fuentes heterogeneas algunas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 39};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-6"})
SET n:Chunk
SET n += {character_count: 260, chunk_id: "chunk-6", chunk_type: "paragraph", end_line: 21, node_id: "chunk:9803c836b479e875:chunk-6", order: 6, start_line: 21, text: "La calidad de los datos depende de su precision, cobertura, frecuencia, estabilidad y contexto. Un sensor puede registrar una medida exacta, pero si no se conoce su ubicacion, calibracion o periodo de mantenimiento, el dato puede producir conclusiones debiles.", title: "Calidad datos depende", title_candidates: ["calidad datos depende", "calidad datos", "datos depende precision", "depende precision cobertura", "precision cobertura frecuencia"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 39};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-6"})
SET n:Section
SET n += {end_line: 27, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-6", numbering: "1.3", order: 6, section_id: "section-6", start_line: 23, title: "1.3 Aprendizaje profundo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-7"})
SET n:Chunk
SET n += {character_count: 326, chunk_id: "chunk-7", chunk_type: "paragraph", end_line: 25, node_id: "chunk:9803c836b479e875:chunk-7", order: 7, start_line: 25, text: "El aprendizaje profundo usa redes neuronales con muchas capas para reconocer patrones en imagenes, texto, audio, series temporales y grafos. En una ciudad inteligente, estas tecnicas pueden usarse para prediccion de demanda, deteccion de anomalias, clasificacion de documentos, estimacion de riesgo y simulacion de escenarios.", title: "Aprendizaje profundo usa", title_candidates: ["aprendizaje profundo usa", "aprendizaje profundo", "profundo usa redes", "usa redes neuronales", "redes neuronales muchas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 45};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-8"})
SET n:Chunk
SET n += {character_count: 234, chunk_id: "chunk-8", chunk_type: "paragraph", end_line: 27, node_id: "chunk:9803c836b479e875:chunk-8", order: 8, start_line: 27, text: "Sin embargo, el aprendizaje profundo no reemplaza la interpretacion humana. Un modelo puede detectar correlaciones, pero la decision publica requiere explicar causas probables, evaluar impactos y justificar acciones ante la comunidad.", title: "Embargo aprendizaje profundo", title_candidates: ["embargo aprendizaje profundo", "embargo aprendizaje", "aprendizaje profundo no", "profundo no reemplaza", "no reemplaza interpretacion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 31};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-7"})
SET n:Section
SET n += {end_line: 29, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-7", numbering: "2", order: 7, section_id: "section-7", start_line: 29, title: "2. Arquitectura de datos"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-8"})
SET n:Section
SET n += {end_line: 35, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-8", numbering: "2.1", order: 8, section_id: "section-8", start_line: 31, title: "2.1 Captura"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-9"})
SET n:Chunk
SET n += {character_count: 249, chunk_id: "chunk-9", chunk_type: "paragraph", end_line: 33, node_id: "chunk:9803c836b479e875:chunk-9", order: 9, start_line: 33, text: "La captura de datos comienza en dispositivos, formularios, sistemas administrativos y reportes ciudadanos. Cada fuente debe registrar metadatos basicos: fecha, ubicacion, responsable, metodo de recoleccion, unidad de medida y condiciones relevantes.", title: "Captura datos", title_candidates: ["captura datos", "dispositivos formularios sistemas", "formularios sistemas administrativos", "sistemas administrativos reportes", "administrativos reportes ciudadanos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 31};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-10"})
SET n:Chunk
SET n += {character_count: 285, chunk_id: "chunk-10", chunk_type: "paragraph", end_line: 35, node_id: "chunk:9803c836b479e875:chunk-10", order: 10, start_line: 35, text: "En movilidad, por ejemplo, la captura puede incluir conteo vehicular, velocidad promedio, uso de bicicleta publica, ocupacion de autobuses, incidentes viales y tiempos de traslado. En energia, puede incluir consumo por zona, carga maxima, generacion distribuida y fallas de suministro.", title: "Movilidad captura", title_candidates: ["movilidad captura", "incluir conteo vehicular", "conteo vehicular velocidad", "vehicular velocidad promedio", "velocidad promedio uso"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 40};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-9"})
SET n:Section
SET n += {end_line: 41, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-9", numbering: "2.2", order: 9, section_id: "section-9", start_line: 37, title: "2.2 Ingestion"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-11"})
SET n:Chunk
SET n += {character_count: 250, chunk_id: "chunk-11", chunk_type: "paragraph", end_line: 39, node_id: "chunk:9803c836b479e875:chunk-11", order: 11, start_line: 39, text: "La ingestion transforma datos crudos en registros almacenables. Este proceso valida formatos, elimina duplicados evidentes, normaliza unidades y asigna identificadores. Una ingestion robusta evita que errores pequenos contaminen analisis posteriores.", title: "Ingestion transforma datos", title_candidates: ["ingestion transforma datos", "ingestion transforma", "transforma datos crudos", "datos crudos registros", "crudos registros almacenables"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 30};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-12"})
SET n:Chunk
SET n += {character_count: 248, chunk_id: "chunk-12", chunk_type: "paragraph", end_line: 41, node_id: "chunk:9803c836b479e875:chunk-12", order: 12, start_line: 41, text: "Un sistema urbano debe aceptar archivos CSV, documentos de texto, imagenes, flujos de eventos, bases relacionales y datos geoespaciales. Tambien debe registrar errores sin detener todo el proceso, porque las fuentes publicas suelen ser irregulares.", title: "Sistema urbano debe", title_candidates: ["sistema urbano debe", "sistema urbano", "urbano debe aceptar", "debe aceptar archivos", "aceptar archivos csv"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 35};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-10"})
SET n:Section
SET n += {end_line: 47, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-10", numbering: "2.3", order: 10, section_id: "section-10", start_line: 43, title: "2.3 Almacenamiento"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-13"})
SET n:Chunk
SET n += {character_count: 258, chunk_id: "chunk-13", chunk_type: "paragraph", end_line: 45, node_id: "chunk:9803c836b479e875:chunk-13", order: 13, start_line: 45, text: "El almacenamiento puede organizarse en capas. Una capa conserva datos originales para auditoria. Otra capa contiene datos limpios y normalizados. Una tercera capa almacena representaciones analiticas, como vectores, embeddings, grafos o agregados temporales.", title: "Organizarse capas capa", title_candidates: ["organizarse capas capa", "capas capa conserva", "capa conserva datos", "conserva datos originales", "datos originales auditoria"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 33};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-14"})
SET n:Chunk
SET n += {character_count: 232, chunk_id: "chunk-14", chunk_type: "paragraph", end_line: 47, node_id: "chunk:9803c836b479e875:chunk-14", order: 14, start_line: 47, text: "La separacion de capas permite reproducibilidad. Si un modelo produce una prediccion incorrecta, el equipo puede volver al dato original, revisar la limpieza, examinar la transformacion y detectar en que punto se genero el problema.", title: "Separacion capas", title_candidates: ["separacion capas", "modelo produce prediccion", "produce prediccion incorrecta", "prediccion incorrecta equipo", "volver dato original"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 35};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-11"})
SET n:Section
SET n += {end_line: 53, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-11", numbering: "2.4", order: 11, section_id: "section-11", start_line: 49, title: "2.4 Catalogacion"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-15"})
SET n:Chunk
SET n += {character_count: 274, chunk_id: "chunk-15", chunk_type: "paragraph", end_line: 51, node_id: "chunk:9803c836b479e875:chunk-15", order: 15, start_line: 51, text: "La catalogacion describe los conjuntos de datos disponibles. Incluye origen, propietario, licencia, sensibilidad, cobertura temporal, cobertura geografica, actualizacion, calidad y dependencias. Sin catalogo, los equipos terminan repitiendo trabajo o usando datos obsoletos.", title: "Catalogacion describe conjuntos", title_candidates: ["catalogacion describe conjuntos", "catalogacion describe", "describe conjuntos datos", "conjuntos datos disponibles", "origen propietario licencia"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 32};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-16"})
SET n:Chunk
SET n += {character_count: 242, chunk_id: "chunk-16", chunk_type: "paragraph", end_line: 53, node_id: "chunk:9803c836b479e875:chunk-16", order: 16, start_line: 53, text: "Un buen catalogo no solo lista tablas. Tambien explica conceptos. Por ejemplo, \"viaje\" puede significar una tarjeta validada, un desplazamiento completo, una ruta segmentada o una solicitud de transporte. Esas diferencias cambian el analisis.", title: "Buen catalogo no", title_candidates: ["buen catalogo no", "buen catalogo", "catalogo no solo", "no solo lista", "solo lista tablas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 34};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-12"})
SET n:Section
SET n += {end_line: 55, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-12", numbering: "3", order: 12, section_id: "section-12", start_line: 55, title: "3. Modelos por dominio"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-13"})
SET n:Section
SET n += {end_line: 57, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-13", numbering: "3.1", order: 13, section_id: "section-13", start_line: 57, title: "3.1 Movilidad"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-14"})
SET n:Section
SET n += {end_line: 63, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-14", numbering: "3.1.1", order: 14, section_id: "section-14", start_line: 59, title: "3.1.1 Prediccion de demanda"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-17"})
SET n:Chunk
SET n += {character_count: 213, chunk_id: "chunk-17", chunk_type: "paragraph", end_line: 61, node_id: "chunk:9803c836b479e875:chunk-17", order: 17, start_line: 61, text: "La prediccion de demanda estima cuantos usuarios usaran una linea, una estacion o una ruta en diferentes horarios. Puede combinar series temporales, clima, calendario escolar, eventos masivos y cambios operativos.", title: "Prediccion demanda estima", title_candidates: ["prediccion demanda estima", "prediccion demanda", "demanda estima cuantos", "estima cuantos usuarios", "cuantos usuarios usaran"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 30};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-18"})
SET n:Chunk
SET n += {character_count: 278, chunk_id: "chunk-18", chunk_type: "paragraph", end_line: 63, node_id: "chunk:9803c836b479e875:chunk-18", order: 18, start_line: 63, text: "Un modelo de demanda debe distinguir patrones normales de eventos excepcionales. La lluvia puede aumentar ciertos viajes y reducir otros. Un concierto puede saturar una estacion cercana durante una ventana corta, mientras que una obra vial puede modificar rutas durante semanas.", title: "Modelo demanda debe", title_candidates: ["modelo demanda debe", "modelo demanda", "demanda debe distinguir", "debe distinguir patrones", "distinguir patrones normales"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 41};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-15"})
SET n:Section
SET n += {end_line: 69, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-15", numbering: "3.1.2", order: 15, section_id: "section-15", start_line: 65, title: "3.1.2 Optimizacion de rutas"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-19"})
SET n:Chunk
SET n += {character_count: 195, chunk_id: "chunk-19", chunk_type: "paragraph", end_line: 67, node_id: "chunk:9803c836b479e875:chunk-19", order: 19, start_line: 67, text: "La optimizacion de rutas busca reducir tiempos de espera, mejorar cobertura y equilibrar costos. Los modelos pueden sugerir cambios de frecuencia, redistribucion de unidades o ajustes de paradas.", title: "Optimizacion rutas busca", title_candidates: ["optimizacion rutas busca", "optimizacion rutas", "rutas busca reducir", "busca reducir tiempos", "reducir tiempos espera"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-20"})
SET n:Chunk
SET n += {character_count: 221, chunk_id: "chunk-20", chunk_type: "paragraph", end_line: 69, node_id: "chunk:9803c836b479e875:chunk-20", order: 20, start_line: 69, text: "Pero una ruta no debe evaluarse solo por eficiencia promedio. Tambien importa la equidad. Una colonia con menos pasajeros puede necesitar servicio porque conecta a poblaciones con menor acceso a empleo, salud o educacion.", title: "Ruta no debe", title_candidates: ["ruta no debe", "ruta no", "no debe evaluarse", "debe evaluarse solo", "evaluarse solo eficiencia"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 34};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-16"})
SET n:Section
SET n += {end_line: 71, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-16", numbering: "3.2", order: 16, section_id: "section-16", start_line: 71, title: "3.2 Energia"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-17"})
SET n:Section
SET n += {end_line: 77, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-17", numbering: "3.2.1", order: 17, section_id: "section-17", start_line: 73, title: "3.2.1 Demanda electrica"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-21"})
SET n:Chunk
SET n += {character_count: 229, chunk_id: "chunk-21", chunk_type: "paragraph", end_line: 75, node_id: "chunk:9803c836b479e875:chunk-21", order: 21, start_line: 75, text: "La demanda electrica cambia por temperatura, actividad economica, densidad habitacional, horarios laborales y adopcion de tecnologias. Los modelos pueden anticipar picos, detectar anomalias y estimar necesidades de mantenimiento.", title: "Demanda electrica cambia", title_candidates: ["demanda electrica cambia", "demanda electrica", "electrica cambia temperatura", "cambia temperatura economica", "temperatura economica densidad"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-22"})
SET n:Chunk
SET n += {character_count: 221, chunk_id: "chunk-22", chunk_type: "paragraph", end_line: 77, node_id: "chunk:9803c836b479e875:chunk-22", order: 22, start_line: 77, text: "La prediccion energetica debe considerar incertidumbre. Una ola de calor puede elevar el uso de aire acondicionado y tensionar la red. Un modelo que entregue intervalos de confianza ayuda a planear respuestas preventivas.", title: "Prediccion energetica debe", title_candidates: ["prediccion energetica debe", "prediccion energetica", "energetica debe considerar", "debe considerar incertidumbre", "considerar incertidumbre ola"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 33};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-18"})
SET n:Section
SET n += {end_line: 83, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-18", numbering: "3.2.2", order: 18, section_id: "section-18", start_line: 79, title: "3.2.2 Generacion distribuida"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-23"})
SET n:Chunk
SET n += {character_count: 181, chunk_id: "chunk-23", chunk_type: "paragraph", end_line: 81, node_id: "chunk:9803c836b479e875:chunk-23", order: 23, start_line: 81, text: "Los paneles solares, baterias y microredes generan nuevos patrones. La ciudad puede pasar de un esquema centralizado a uno mixto, donde algunos barrios producen parte de su energia.", title: "Paneles solares baterias", title_candidates: ["paneles solares baterias", "paneles solares", "solares baterias microredes", "baterias microredes generan", "microredes generan nuevos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-24"})
SET n:Chunk
SET n += {character_count: 222, chunk_id: "chunk-24", chunk_type: "paragraph", end_line: 83, node_id: "chunk:9803c836b479e875:chunk-24", order: 24, start_line: 83, text: "El aprendizaje profundo puede ayudar a estimar generacion esperada, identificar fallas y coordinar almacenamiento. Aun asi, las decisiones deben alinearse con regulaciones, seguridad y capacidad financiera de los usuarios.", title: "Aprendizaje profundo", title_candidates: ["aprendizaje profundo", "ayudar estimar generacion", "estimar generacion esperada", "generacion esperada identificar", "esperada identificar fallas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-19"})
SET n:Section
SET n += {end_line: 85, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-19", numbering: "3.3", order: 19, section_id: "section-19", start_line: 85, title: "3.3 Salud publica"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-20"})
SET n:Section
SET n += {end_line: 91, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-20", numbering: "3.3.1", order: 20, section_id: "section-20", start_line: 87, title: "3.3.1 Vigilancia epidemiologica"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-25"})
SET n:Chunk
SET n += {character_count: 219, chunk_id: "chunk-25", chunk_type: "paragraph", end_line: 89, node_id: "chunk:9803c836b479e875:chunk-25", order: 25, start_line: 89, text: "La vigilancia epidemiologica analiza consultas, sintomas reportados, ventas de medicamentos, ausentismo escolar y datos ambientales. El objetivo es detectar cambios tempranos que indiquen un brote o un riesgo emergente.", title: "Vigilancia epidemiologica analiza", title_candidates: ["vigilancia epidemiologica analiza", "vigilancia epidemiologica", "epidemiologica analiza consultas", "analiza consultas sintomas", "consultas sintomas reportados"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-26"})
SET n:Chunk
SET n += {character_count: 242, chunk_id: "chunk-26", chunk_type: "paragraph", end_line: 91, node_id: "chunk:9803c836b479e875:chunk-26", order: 26, start_line: 91, text: "Los modelos deben manejar sesgos. Una zona con pocos reportes no necesariamente tiene menos enfermedad; puede tener menor acceso a clinicas o menor confianza en instituciones. Por eso, los resultados deben contrastarse con conocimiento local.", title: "Modelos deben manejar", title_candidates: ["modelos deben manejar", "modelos deben", "deben manejar sesgos", "manejar sesgos zona", "sesgos zona pocos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 35};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-21"})
SET n:Section
SET n += {end_line: 97, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-21", numbering: "3.3.2", order: 21, section_id: "section-21", start_line: 93, title: "3.3.2 Distribucion de recursos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-27"})
SET n:Chunk
SET n += {character_count: 213, chunk_id: "chunk-27", chunk_type: "paragraph", end_line: 95, node_id: "chunk:9803c836b479e875:chunk-27", order: 27, start_line: 95, text: "La distribucion de recursos decide donde ubicar brigadas, vacunas, medicamentos o personal. Un sistema predictivo puede priorizar zonas con mayor riesgo, pero debe explicar criterios para evitar decisiones opacas.", title: "Distribucion recursos decide", title_candidates: ["distribucion recursos decide", "distribucion recursos", "recursos decide ubicar", "decide ubicar brigadas", "ubicar brigadas vacunas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-28"})
SET n:Chunk
SET n += {character_count: 202, chunk_id: "chunk-28", chunk_type: "paragraph", end_line: 97, node_id: "chunk:9803c836b479e875:chunk-28", order: 28, start_line: 97, text: "La transparencia es especialmente importante en salud, porque los errores pueden afectar vidas. Una recomendacion automatica debe ser revisada por profesionales y documentada con evidencia comprensible.", title: "Transparencia especialmente importante", title_candidates: ["transparencia especialmente importante", "transparencia especialmente", "especialmente importante salud", "importante salud errores", "afectar vidas recomendacion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 26};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-22"})
SET n:Section
SET n += {end_line: 99, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-22", numbering: "3.4", order: 22, section_id: "section-22", start_line: 99, title: "3.4 Educacion"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-23"})
SET n:Section
SET n += {end_line: 105, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-23", numbering: "3.4.1", order: 23, section_id: "section-23", start_line: 101, title: "3.4.1 Trayectorias escolares"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-29"})
SET n:Chunk
SET n += {character_count: 234, chunk_id: "chunk-29", chunk_type: "paragraph", end_line: 103, node_id: "chunk:9803c836b479e875:chunk-29", order: 29, start_line: 103, text: "Los datos educativos pueden incluir asistencia, calificaciones, evaluaciones diagnosticas, conectividad, movilidad, apoyos sociales y participacion familiar. El objetivo no es etiquetar estudiantes, sino detectar necesidades de apoyo.", title: "Datos educativos", title_candidates: ["datos educativos", "incluir asistencia calificaciones", "asistencia calificaciones evaluaciones", "calificaciones evaluaciones diagnosticas", "evaluaciones diagnosticas conectividad"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 27};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-30"})
SET n:Chunk
SET n += {character_count: 258, chunk_id: "chunk-30", chunk_type: "paragraph", end_line: 105, node_id: "chunk:9803c836b479e875:chunk-30", order: 30, start_line: 105, text: "Un modelo puede identificar patrones de abandono probable, pero la intervencion debe ser cuidadosa. Si el sistema solo produce alertas, puede aumentar carga administrativa. Si produce explicaciones y sugerencias, puede apoyar mejor a docentes y orientadores.", title: "Identificar patrones abandono", title_candidates: ["identificar patrones abandono", "patrones abandono probable", "abandono probable intervencion", "probable intervencion debe", "intervencion debe ser"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 36};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-24"})
SET n:Section
SET n += {end_line: 111, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-24", numbering: "3.4.2", order: 24, section_id: "section-24", start_line: 107, title: "3.4.2 Recursos de aprendizaje"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-31"})
SET n:Chunk
SET n += {character_count: 197, chunk_id: "chunk-31", chunk_type: "paragraph", end_line: 109, node_id: "chunk:9803c836b479e875:chunk-31", order: 31, start_line: 109, text: "Los sistemas de recomendacion pueden sugerir materiales segun brechas de aprendizaje. Para ser utiles, deben considerar nivel, idioma, accesibilidad, contexto cultural y disponibilidad tecnologica.", title: "Sistemas recomendacion", title_candidates: ["sistemas recomendacion", "sugerir materiales segun", "materiales segun brechas", "segun brechas aprendizaje", "brechas aprendizaje ser"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 24};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-32"})
SET n:Chunk
SET n += {character_count: 207, chunk_id: "chunk-32", chunk_type: "paragraph", end_line: 111, node_id: "chunk:9803c836b479e875:chunk-32", order: 32, start_line: 111, text: "La recomendacion educativa no debe reducirse a maximizar clics. Debe promover comprension, practica sostenida y autonomia. Un recurso popular no siempre es el recurso correcto para una dificultad especifica.", title: "Recomendacion educativa no", title_candidates: ["recomendacion educativa no", "recomendacion educativa", "educativa no debe", "no debe reducirse", "debe reducirse maximizar"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-25"})
SET n:Section
SET n += {end_line: 113, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-25", numbering: "3.5", order: 25, section_id: "section-25", start_line: 113, title: "3.5 Seguridad y proteccion civil"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-26"})
SET n:Section
SET n += {end_line: 119, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-26", numbering: "3.5.1", order: 26, section_id: "section-26", start_line: 115, title: "3.5.1 Deteccion de incidentes"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-33"})
SET n:Chunk
SET n += {character_count: 191, chunk_id: "chunk-33", chunk_type: "paragraph", end_line: 117, node_id: "chunk:9803c836b479e875:chunk-33", order: 33, start_line: 117, text: "Los sistemas pueden integrar llamadas de emergencia, reportes ciudadanos, camaras, sensores ambientales y datos meteorologicos. El objetivo es mejorar tiempos de respuesta y prevenir riesgos.", title: "Integrar llamadas emergencia", title_candidates: ["integrar llamadas emergencia", "llamadas emergencia reportes", "emergencia reportes ciudadanos", "reportes ciudadanos camaras", "ciudadanos camaras sensores"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-34"})
SET n:Chunk
SET n += {character_count: 228, chunk_id: "chunk-34", chunk_type: "paragraph", end_line: 119, node_id: "chunk:9803c836b479e875:chunk-34", order: 34, start_line: 119, text: "El uso de datos de seguridad requiere limites claros. Debe evitar vigilancia invasiva, discriminacion y decisiones automaticas sin supervisiion. La proteccion civil debe orientarse a cuidado publico, no a control indiscriminado.", title: "Uso datos seguridad", title_candidates: ["uso datos seguridad", "uso datos", "datos seguridad requiere", "seguridad requiere limites", "requiere limites claros"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 31};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-27"})
SET n:Section
SET n += {end_line: 125, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-27", numbering: "3.5.2", order: 27, section_id: "section-27", start_line: 121, title: "3.5.2 Riesgos naturales"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-35"})
SET n:Chunk
SET n += {character_count: 229, chunk_id: "chunk-35", chunk_type: "paragraph", end_line: 123, node_id: "chunk:9803c836b479e875:chunk-35", order: 35, start_line: 123, text: "Inundaciones, incendios, deslizamientos y olas de calor pueden modelarse con datos geograficos, historicos y climaticos. Las redes neuronales pueden reconocer patrones complejos, pero la comunicacion del riesgo debe ser sencilla.", title: "Inundaciones incendios deslizamientos", title_candidates: ["inundaciones incendios deslizamientos", "inundaciones incendios", "incendios deslizamientos olas", "deslizamientos olas calor", "modelarse datos geograficos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 30};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-36"})
SET n:Chunk
SET n += {character_count: 183, chunk_id: "chunk-36", chunk_type: "paragraph", end_line: 125, node_id: "chunk:9803c836b479e875:chunk-36", order: 36, start_line: 125, text: "Una alerta efectiva indica que ocurre, donde ocurre, que tan urgente es y que acciones debe tomar la poblacion. El mejor modelo pierde valor si la alerta llega tarde o no se entiende.", title: "Alerta efectiva indica", title_candidates: ["alerta efectiva indica", "alerta efectiva", "debe tomar poblacion", "tomar poblacion mejor", "poblacion mejor modelo"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 33};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-28"})
SET n:Section
SET n += {end_line: 127, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-28", numbering: "3.6", order: 28, section_id: "section-28", start_line: 127, title: "3.6 Agua y residuos"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-29"})
SET n:Section
SET n += {end_line: 133, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-29", numbering: "3.6.1", order: 29, section_id: "section-29", start_line: 129, title: "3.6.1 Gestion del agua"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-37"})
SET n:Chunk
SET n += {character_count: 188, chunk_id: "chunk-37", chunk_type: "paragraph", end_line: 131, node_id: "chunk:9803c836b479e875:chunk-37", order: 37, start_line: 131, text: "La gestion del agua incluye captacion, potabilizacion, distribucion, consumo, fugas y tratamiento. Los modelos pueden detectar perdidas probables, estimar demanda y priorizar reparaciones.", title: "Captacion potabilizacion distribucion", title_candidates: ["gestion agua", "captacion potabilizacion distribucion", "potabilizacion distribucion consumo", "distribucion consumo fugas", "consumo fugas tratamiento"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-38"})
SET n:Chunk
SET n += {character_count: 177, chunk_id: "chunk-38", chunk_type: "paragraph", end_line: 133, node_id: "chunk:9803c836b479e875:chunk-38", order: 38, start_line: 133, text: "Las fugas no siempre se observan directamente. Se infieren por presion, consumo anomalo, reportes vecinales y cambios en el terreno. La combinacion de datos mejora la deteccion.", title: "Fugas no siempre", title_candidates: ["fugas no siempre", "fugas no", "no siempre observan", "siempre observan directamente", "observan directamente infieren"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 27};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-30"})
SET n:Section
SET n += {end_line: 139, heading_type: "markdown", level: 4, node_id: "section:9803c836b479e875:section-30", numbering: "3.6.2", order: 30, section_id: "section-30", start_line: 135, title: "3.6.2 Residuos urbanos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-39"})
SET n:Chunk
SET n += {character_count: 186, chunk_id: "chunk-39", chunk_type: "paragraph", end_line: 137, node_id: "chunk:9803c836b479e875:chunk-39", order: 39, start_line: 137, text: "La recoleccion de residuos depende de densidad, actividad comercial, habitos de consumo, calendario y rutas. Un modelo puede estimar volumen por zona y ajustar frecuencia de recoleccion.", title: "Recoleccion residuos depende", title_candidates: ["recoleccion residuos depende", "recoleccion residuos", "residuos depende densidad", "depende densidad comercial", "densidad comercial habitos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 27};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-40"})
SET n:Chunk
SET n += {character_count: 189, chunk_id: "chunk-40", chunk_type: "paragraph", end_line: 139, node_id: "chunk:9803c836b479e875:chunk-40", order: 40, start_line: 139, text: "Tambien puede apoyar reciclaje al identificar materiales, ubicar puntos de acopio y detectar zonas con baja separacion. Pero el cambio requiere educacion, incentivos y servicios confiables.", title: "Apoyar reciclaje identificar", title_candidates: ["apoyar reciclaje identificar", "reciclaje identificar materiales", "identificar materiales ubicar", "materiales ubicar puntos", "ubicar puntos acopio"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 26};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-31"})
SET n:Section
SET n += {end_line: 141, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-31", numbering: "4", order: 31, section_id: "section-31", start_line: 141, title: "4. Gobernanza y etica"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-32"})
SET n:Section
SET n += {end_line: 147, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-32", numbering: "4.1", order: 32, section_id: "section-32", start_line: 143, title: "4.1 Privacidad"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-41"})
SET n:Chunk
SET n += {character_count: 209, chunk_id: "chunk-41", chunk_type: "paragraph", end_line: 145, node_id: "chunk:9803c836b479e875:chunk-41", order: 41, start_line: 145, text: "La privacidad debe incorporarse desde el diseno. No basta con eliminar nombres si los datos pueden reidentificar personas por ubicacion, horarios o combinaciones raras. La minimizacion de datos reduce riesgos.", title: "Privacidad debe incorporarse", title_candidates: ["privacidad debe incorporarse", "privacidad debe", "debe incorporarse diseno", "incorporarse diseno no", "diseno no basta"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 30};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-42"})
SET n:Chunk
SET n += {character_count: 204, chunk_id: "chunk-42", chunk_type: "paragraph", end_line: 147, node_id: "chunk:9803c836b479e875:chunk-42", order: 42, start_line: 147, text: "Un proyecto responsable define que datos son necesarios, por cuanto tiempo se conservan, quien puede acceder a ellos y como se audita el uso. Tambien establece procedimientos para incidentes de seguridad.", title: "Proyecto responsable define", title_candidates: ["proyecto responsable define", "proyecto responsable", "responsable define datos", "define datos necesarios", "datos necesarios cuanto"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 31};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-33"})
SET n:Section
SET n += {end_line: 153, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-33", numbering: "4.2", order: 33, section_id: "section-33", start_line: 149, title: "4.2 Explicabilidad"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-43"})
SET n:Chunk
SET n += {character_count: 177, chunk_id: "chunk-43", chunk_type: "paragraph", end_line: 151, node_id: "chunk:9803c836b479e875:chunk-43", order: 43, start_line: 151, text: "La explicabilidad permite entender por que un modelo recomienda una accion. En administracion publica, la explicacion no es un lujo tecnico; es parte de la rendicion de cuentas.", title: "Entender modelo recomienda", title_candidates: ["entender modelo recomienda", "modelo recomienda accion", "recomienda accion administracion", "accion administracion publica", "administracion publica explicacion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-44"})
SET n:Chunk
SET n += {character_count: 212, chunk_id: "chunk-44", chunk_type: "paragraph", end_line: 153, node_id: "chunk:9803c836b479e875:chunk-44", order: 44, start_line: 153, text: "Algunas tecnicas generan importancia de variables, ejemplos similares o reglas aproximadas. Ninguna explicacion es perfecta, pero una explicacion parcial puede ser mejor que una decision cerrada e incomprensible.", title: "Algunas tecnicas generan", title_candidates: ["algunas tecnicas generan", "algunas tecnicas", "tecnicas generan importancia", "generan importancia variables", "importancia variables ejemplos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-34"})
SET n:Section
SET n += {end_line: 159, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-34", numbering: "4.3", order: 34, section_id: "section-34", start_line: 155, title: "4.3 Equidad"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-45"})
SET n:Chunk
SET n += {character_count: 211, chunk_id: "chunk-45", chunk_type: "paragraph", end_line: 157, node_id: "chunk:9803c836b479e875:chunk-45", order: 45, start_line: 157, text: "La equidad exige revisar impactos diferenciados. Un modelo puede ser preciso en promedio y fallar en comunidades pequenas, perifericas o historicamente subrepresentadas. Por eso, las metricas deben desagregarse.", title: "Equidad exige revisar", title_candidates: ["equidad exige revisar", "equidad exige", "exige revisar impactos", "revisar impactos diferenciados", "impactos diferenciados modelo"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-46"})
SET n:Chunk
SET n += {character_count: 197, chunk_id: "chunk-46", chunk_type: "paragraph", end_line: 159, node_id: "chunk:9803c836b479e875:chunk-46", order: 46, start_line: 159, text: "Tambien se deben evaluar costos de error. Un falso positivo puede desperdiciar recursos, pero un falso negativo puede dejar sin apoyo a una comunidad vulnerable. La comparacion depende del dominio.", title: "Deben evaluar costos", title_candidates: ["deben evaluar costos", "deben evaluar", "evaluar costos error", "costos error falso", "error falso positivo"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 30};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-35"})
SET n:Section
SET n += {end_line: 165, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-35", numbering: "4.4", order: 35, section_id: "section-35", start_line: 161, title: "4.4 Participacion ciudadana"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-47"})
SET n:Chunk
SET n += {character_count: 173, chunk_id: "chunk-47", chunk_type: "paragraph", end_line: 163, node_id: "chunk:9803c836b479e875:chunk-47", order: 47, start_line: 163, text: "La participacion ciudadana permite validar prioridades, corregir supuestos y construir confianza. Los habitantes conocen problemas que no siempre aparecen en bases de datos.", title: "Validar prioridades corregir", title_candidates: ["participacion ciudadana", "validar prioridades corregir", "prioridades corregir supuestos", "corregir supuestos construir", "supuestos construir confianza"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-48"})
SET n:Chunk
SET n += {character_count: 188, chunk_id: "chunk-48", chunk_type: "paragraph", end_line: 165, node_id: "chunk:9803c836b479e875:chunk-48", order: 48, start_line: 165, text: "Un sistema urbano debe permitir reportar errores, solicitar explicaciones y proponer mejoras. La tecnologia publica funciona mejor cuando las personas pueden discutirla, no solo recibirla.", title: "Sistema urbano", title_candidates: ["sistema urbano debe", "sistema urbano", "urbano debe permitir", "debe permitir reportar", "permitir reportar errores"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-36"})
SET n:Section
SET n += {end_line: 167, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-36", numbering: "5", order: 36, section_id: "section-36", start_line: 167, title: "5. Ciclo de vida del modelo"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-37"})
SET n:Section
SET n += {end_line: 173, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-37", numbering: "5.1", order: 37, section_id: "section-37", start_line: 169, title: "5.1 Definicion del problema"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-49"})
SET n:Chunk
SET n += {character_count: 252, chunk_id: "chunk-49", chunk_type: "paragraph", end_line: 171, node_id: "chunk:9803c836b479e875:chunk-49", order: 49, start_line: 171, text: "Antes de entrenar un modelo, el equipo debe definir una pregunta operacional. Una pregunta como \"mejorar movilidad\" es demasiado amplia. Una pregunta como \"predecir ocupacion de estaciones cada quince minutos para ajustar frecuencia\" es mas accionable.", title: "Entrenar modelo equipo", title_candidates: ["entrenar modelo equipo", "entrenar modelo", "modelo equipo debe", "equipo debe definir", "debe definir pregunta"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 36};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-50"})
SET n:Chunk
SET n += {character_count: 205, chunk_id: "chunk-50", chunk_type: "paragraph", end_line: 173, node_id: "chunk:9803c836b479e875:chunk-50", order: 50, start_line: 173, text: "La definicion debe incluir usuarios, decisiones, limites, datos disponibles, indicadores de exito y riesgos. Si no se define la decision final, el modelo puede convertirse en una demostracion sin uso real.", title: "Definicion debe incluir", title_candidates: ["definicion debe incluir", "definicion debe", "debe incluir usuarios", "incluir usuarios decisiones", "usuarios decisiones limites"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 31};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-38"})
SET n:Section
SET n += {end_line: 179, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-38", numbering: "5.2", order: 38, section_id: "section-38", start_line: 175, title: "5.2 Preparacion de datos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-51"})
SET n:Chunk
SET n += {character_count: 212, chunk_id: "chunk-51", chunk_type: "paragraph", end_line: 177, node_id: "chunk:9803c836b479e875:chunk-51", order: 51, start_line: 177, text: "La preparacion incluye limpieza, normalizacion, union de fuentes, manejo de valores faltantes, deteccion de valores extremos y construccion de variables. Esta etapa suele consumir mas tiempo que el entrenamiento.", title: "Limpieza normalizacion union", title_candidates: ["limpieza normalizacion union", "normalizacion union fuentes", "union fuentes manejo", "fuentes manejo valores", "manejo valores faltantes"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-52"})
SET n:Chunk
SET n += {character_count: 224, chunk_id: "chunk-52", chunk_type: "paragraph", end_line: 179, node_id: "chunk:9803c836b479e875:chunk-52", order: 52, start_line: 179, text: "En datos urbanos, las inconsistencias son frecuentes. Una misma colonia puede tener nombres distintos. Una estacion puede cambiar de codigo. Un sensor puede quedar fuera de servicio. La preparacion debe registrar esos casos.", title: "Datos urbanos inconsistencias", title_candidates: ["datos urbanos inconsistencias", "datos urbanos", "urbanos inconsistencias frecuentes", "inconsistencias frecuentes misma", "frecuentes misma colonia"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 33};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-39"})
SET n:Section
SET n += {end_line: 185, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-39", numbering: "5.3", order: 39, section_id: "section-39", start_line: 181, title: "5.3 Entrenamiento"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-53"})
SET n:Chunk
SET n += {character_count: 175, chunk_id: "chunk-53", chunk_type: "paragraph", end_line: 183, node_id: "chunk:9803c836b479e875:chunk-53", order: 53, start_line: 183, text: "El entrenamiento ajusta parametros del modelo a partir de datos historicos. Se deben separar datos de entrenamiento, validacion y prueba para estimar desempeno sin autoengano.", title: "Entrenamiento ajusta parametros", title_candidates: ["entrenamiento ajusta parametros", "entrenamiento ajusta", "ajusta parametros modelo", "parametros modelo partir", "modelo partir datos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-54"})
SET n:Chunk
SET n += {character_count: 217, chunk_id: "chunk-54", chunk_type: "paragraph", end_line: 185, node_id: "chunk:9803c836b479e875:chunk-54", order: 54, start_line: 185, text: "Los modelos profundos pueden requerir GPUs, pero no siempre son necesarios. Para algunos problemas, un modelo simple y explicable puede funcionar mejor. La seleccion debe basarse en evidencia, no en prestigio tecnico.", title: "Modelos profundos", title_candidates: ["modelos profundos", "requerir gpus no", "gpus no siempre", "no siempre necesarios", "siempre necesarios algunos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 32};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-40"})
SET n:Section
SET n += {end_line: 191, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-40", numbering: "5.4", order: 40, section_id: "section-40", start_line: 187, title: "5.4 Evaluacion"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-55"})
SET n:Chunk
SET n += {character_count: 223, chunk_id: "chunk-55", chunk_type: "paragraph", end_line: 189, node_id: "chunk:9803c836b479e875:chunk-55", order: 55, start_line: 189, text: "La evaluacion mide precision, error, robustez, estabilidad y utilidad operativa. Una metrica tecnica puede no capturar el valor real. Por ejemplo, reducir error promedio en demanda no sirve si el modelo falla en horas pico.", title: "Evaluacion mide precision", title_candidates: ["evaluacion mide precision", "evaluacion mide", "mide precision error", "precision error robustez", "error robustez estabilidad"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 35};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-56"})
SET n:Chunk
SET n += {character_count: 191, chunk_id: "chunk-56", chunk_type: "paragraph", end_line: 191, node_id: "chunk:9803c836b479e875:chunk-56", order: 56, start_line: 191, text: "Tambien se deben hacer pruebas de estres. Que pasa si falta una fuente? Que pasa si cambia el clima? Que pasa si hay un evento masivo? Las respuestas ayudan a preparar planes de contingencia.", title: "Deben hacer pruebas", title_candidates: ["deben hacer pruebas", "deben hacer", "hacer pruebas estres", "pruebas estres pasa", "falta fuente pasa"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 34};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-41"})
SET n:Section
SET n += {end_line: 197, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-41", numbering: "5.5", order: 41, section_id: "section-41", start_line: 193, title: "5.5 Despliegue"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-57"})
SET n:Chunk
SET n += {character_count: 190, chunk_id: "chunk-57", chunk_type: "paragraph", end_line: 195, node_id: "chunk:9803c836b479e875:chunk-57", order: 57, start_line: 195, text: "El despliegue integra el modelo con sistemas reales. Incluye APIs, paneles, alertas, permisos, monitoreo y documentacion. Un modelo desplegado sin monitoreo puede degradarse silenciosamente.", title: "Despliegue integra modelo", title_candidates: ["despliegue integra modelo", "despliegue integra", "integra modelo sistemas", "modelo sistemas reales", "apis paneles alertas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 24};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-58"})
SET n:Chunk
SET n += {character_count: 215, chunk_id: "chunk-58", chunk_type: "paragraph", end_line: 197, node_id: "chunk:9803c836b479e875:chunk-58", order: 58, start_line: 197, text: "El despliegue debe ser gradual. Primero puede operar en modo observacion, comparando predicciones con decisiones humanas. Luego puede pasar a recomendaciones asistidas. Las decisiones criticas requieren supervision.", title: "Despliegue debe ser", title_candidates: ["despliegue debe ser", "despliegue debe", "debe ser gradual", "ser gradual primero", "operar modo observacion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 27};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-42"})
SET n:Section
SET n += {end_line: 203, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-42", numbering: "5.6", order: 42, section_id: "section-42", start_line: 199, title: "5.6 Monitoreo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-59"})
SET n:Chunk
SET n += {character_count: 193, chunk_id: "chunk-59", chunk_type: "paragraph", end_line: 201, node_id: "chunk:9803c836b479e875:chunk-59", order: 59, start_line: 201, text: "El monitoreo detecta desviacion de datos, cambio de distribucion, caida de precision, errores de servicio y uso indebido. Tambien registra si las recomendaciones se aplican y con que resultado.", title: "Monitoreo detecta desviacion", title_candidates: ["monitoreo detecta desviacion", "monitoreo detecta", "detecta desviacion datos", "desviacion datos cambio", "datos cambio distribucion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-60"})
SET n:Chunk
SET n += {character_count: 188, chunk_id: "chunk-60", chunk_type: "paragraph", end_line: 203, node_id: "chunk:9803c836b479e875:chunk-60", order: 60, start_line: 203, text: "Un modelo urbano vive en un ambiente cambiante. Nuevas rutas, obras, politicas, habitos y crisis pueden volver obsoleto un modelo. El monitoreo permite decidir cuando recalibrar o retirar.", title: "Modelo urbano vive", title_candidates: ["modelo urbano vive", "modelo urbano", "urbano vive ambiente", "vive ambiente cambiante", "ambiente cambiante nuevas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-43"})
SET n:Section
SET n += {end_line: 205, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-43", numbering: "6", order: 43, section_id: "section-43", start_line: 205, title: "6. Infraestructura tecnica"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-44"})
SET n:Section
SET n += {end_line: 211, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-44", numbering: "6.1", order: 44, section_id: "section-44", start_line: 207, title: "6.1 APIs"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-61"})
SET n:Chunk
SET n += {character_count: 155, chunk_id: "chunk-61", chunk_type: "paragraph", end_line: 209, node_id: "chunk:9803c836b479e875:chunk-61", order: 61, start_line: 209, text: "Las APIs permiten que sistemas distintos compartan datos y resultados. Deben tener autenticacion, control de version, limites de uso y documentacion clara.", title: "Apis permiten sistemas", title_candidates: ["apis permiten sistemas", "apis permiten", "permiten sistemas distintos", "sistemas distintos compartan", "distintos compartan datos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 22};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-62"})
SET n:Chunk
SET n += {character_count: 198, chunk_id: "chunk-62", chunk_type: "paragraph", end_line: 211, node_id: "chunk:9803c836b479e875:chunk-62", order: 62, start_line: 211, text: "Una API de prediccion podria recibir zona, horario y condiciones, y devolver demanda esperada junto con confianza y factores principales. Una API de consulta podria devolver historiales y metadatos.", title: "Api prediccion podria", title_candidates: ["api prediccion podria", "api prediccion", "prediccion podria recibir", "podria recibir zona", "recibir zona horario"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-45"})
SET n:Section
SET n += {end_line: 217, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-45", numbering: "6.2", order: 45, section_id: "section-45", start_line: 213, title: "6.2 Grafos de conocimiento"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-63"})
SET n:Chunk
SET n += {character_count: 206, chunk_id: "chunk-63", chunk_type: "paragraph", end_line: 215, node_id: "chunk:9803c836b479e875:chunk-63", order: 63, start_line: 215, text: "Un grafo de conocimiento representa entidades y relaciones: estaciones, rutas, barrios, escuelas, hospitales, sensores, incidentes y politicas. Este tipo de estructura ayuda a conectar informacion dispersa.", title: "Grafo conocimiento representa", title_candidates: ["grafo conocimiento representa", "grafo conocimiento", "conocimiento representa entidades", "representa entidades relaciones", "entidades relaciones estaciones"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 26};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-64"})
SET n:Chunk
SET n += {character_count: 226, chunk_id: "chunk-64", chunk_type: "paragraph", end_line: 217, node_id: "chunk:9803c836b479e875:chunk-64", order: 64, start_line: 217, text: "Los grafos permiten preguntas como: que escuelas estan cerca de zonas con baja conectividad y alta desercion? Que rutas atraviesan areas con mayor contaminacion? Que hospitales dependen de una subestacion electrica vulnerable?", title: "Grafos permiten preguntas", title_candidates: ["grafos permiten preguntas", "grafos permiten", "permiten preguntas escuelas", "preguntas escuelas estan", "escuelas estan cerca"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 32};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-46"})
SET n:Section
SET n += {end_line: 223, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-46", numbering: "6.3", order: 46, section_id: "section-46", start_line: 219, title: "6.3 Embeddings"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-65"})
SET n:Chunk
SET n += {character_count: 162, chunk_id: "chunk-65", chunk_type: "paragraph", end_line: 221, node_id: "chunk:9803c836b479e875:chunk-65", order: 65, start_line: 221, text: "Los embeddings convierten texto, imagenes o entidades en vectores numericos. Sirven para busqueda semantica, agrupamiento, recomendacion y deteccion de similitud.", title: "Embeddings convierten imagenes", title_candidates: ["embeddings convierten imagenes", "embeddings convierten", "convierten imagenes entidades", "imagenes entidades vectores", "entidades vectores numericos"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 20};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-66"})
SET n:Chunk
SET n += {character_count: 228, chunk_id: "chunk-66", chunk_type: "paragraph", end_line: 223, node_id: "chunk:9803c836b479e875:chunk-66", order: 66, start_line: 223, text: "En documentos urbanos, los embeddings pueden conectar reportes que usan palabras distintas para describir el mismo problema. \"falla de alumbrado\", \"lampara apagada\" y \"calle oscura\" pueden agruparse como incidentes relacionados.", title: "Documentos urbanos embeddings", title_candidates: ["documentos urbanos embeddings", "documentos urbanos", "conectar reportes usan", "reportes usan palabras", "usan palabras distintas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 30};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-47"})
SET n:Section
SET n += {end_line: 229, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-47", numbering: "6.4", order: 47, section_id: "section-47", start_line: 225, title: "6.4 Paneles de control"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-67"})
SET n:Chunk
SET n += {character_count: 166, chunk_id: "chunk-67", chunk_type: "paragraph", end_line: 227, node_id: "chunk:9803c836b479e875:chunk-67", order: 67, start_line: 227, text: "Los paneles muestran indicadores, mapas, series temporales y alertas. Deben evitar saturacion visual. Un buen panel permite responder preguntas concretas con rapidez.", title: "Paneles muestran indicadores", title_candidates: ["paneles muestran indicadores", "paneles muestran", "muestran indicadores mapas", "indicadores mapas series", "mapas series temporales"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 22};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-68"})
SET n:Chunk
SET n += {character_count: 186, chunk_id: "chunk-68", chunk_type: "paragraph", end_line: 229, node_id: "chunk:9803c836b479e875:chunk-68", order: 68, start_line: 229, text: "El diseno debe distinguir informacion observada, estimada y recomendada. Si el usuario no sabe que parte proviene de un modelo, puede interpretar una prediccion como un hecho confirmado.", title: "Diseno debe distinguir", title_candidates: ["diseno debe distinguir", "diseno debe", "debe distinguir observada", "distinguir observada estimada", "observada estimada recomendada"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-48"})
SET n:Section
SET n += {end_line: 231, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-48", numbering: "7", order: 48, section_id: "section-48", start_line: 231, title: "7. Escenarios de uso"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-49"})
SET n:Section
SET n += {end_line: 237, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-49", numbering: "7.1", order: 49, section_id: "section-49", start_line: 233, title: "7.1 Evento masivo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-69"})
SET n:Chunk
SET n += {character_count: 219, chunk_id: "chunk-69", chunk_type: "paragraph", end_line: 235, node_id: "chunk:9803c836b479e875:chunk-69", order: 69, start_line: 235, text: "Antes de un evento masivo, la ciudad puede estimar demanda de transporte, necesidades de seguridad, consumo de agua, residuos esperados y riesgo sanitario. Durante el evento, puede monitorear cambios y ajustar recursos.", title: "Evento masivo ciudad", title_candidates: ["evento masivo ciudad", "evento masivo", "estimar demanda transporte", "demanda transporte necesidades", "transporte necesidades seguridad"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 32};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-70"})
SET n:Chunk
SET n += {character_count: 161, chunk_id: "chunk-70", chunk_type: "paragraph", end_line: 237, node_id: "chunk:9803c836b479e875:chunk-70", order: 70, start_line: 237, text: "Despues del evento, se comparan predicciones con datos reales. Esa retroalimentacion mejora modelos futuros y permite evaluar si las decisiones fueron adecuadas.", title: "Despues evento comparan", title_candidates: ["despues evento comparan", "despues evento", "evento comparan predicciones", "comparan predicciones datos", "predicciones datos reales"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 22};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-50"})
SET n:Section
SET n += {end_line: 243, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-50", numbering: "7.2", order: 50, section_id: "section-50", start_line: 239, title: "7.2 Ola de calor"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-71"})
SET n:Chunk
SET n += {character_count: 230, chunk_id: "chunk-71", chunk_type: "paragraph", end_line: 241, node_id: "chunk:9803c836b479e875:chunk-71", order: 71, start_line: 241, text: "Una ola de calor afecta salud, energia, agua, trabajo y educacion. Los modelos pueden identificar barrios con mayor riesgo por temperatura, edad de poblacion, baja vegetacion, vivienda precaria y falta de acceso a centros frescos.", title: "Ola calor afecta", title_candidates: ["ola calor afecta", "ola calor", "calor afecta salud", "afecta salud energia", "salud energia agua"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 35};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-72"})
SET n:Chunk
SET n += {character_count: 218, chunk_id: "chunk-72", chunk_type: "paragraph", end_line: 243, node_id: "chunk:9803c836b479e875:chunk-72", order: 72, start_line: 243, text: "La respuesta puede incluir apertura de refugios climaticos, comunicacion preventiva, redistribucion de personal medico y monitoreo electrico. El sistema debe priorizar zonas vulnerables, no solo zonas con mas reportes.", title: "Incluir apertura refugios", title_candidates: ["incluir apertura refugios", "apertura refugios climaticos", "refugios climaticos comunicacion", "climaticos comunicacion preventiva", "comunicacion preventiva redistribucion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 29};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-51"})
SET n:Section
SET n += {end_line: 249, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-51", numbering: "7.3", order: 51, section_id: "section-51", start_line: 245, title: "7.3 Reparacion de infraestructura"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-73"})
SET n:Chunk
SET n += {character_count: 183, chunk_id: "chunk-73", chunk_type: "paragraph", end_line: 247, node_id: "chunk:9803c836b479e875:chunk-73", order: 73, start_line: 247, text: "Cuando una avenida principal entra en reparacion, cambian rutas, tiempos de traslado, comercio local y acceso a servicios. Un modelo puede simular efectos y recomendar rutas alternas.", title: "Avenida principal entra", title_candidates: ["avenida principal entra", "avenida principal", "principal entra reparacion", "entra reparacion cambian", "reparacion cambian rutas"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 27};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-74"})
SET n:Chunk
SET n += {character_count: 152, chunk_id: "chunk-74", chunk_type: "paragraph", end_line: 249, node_id: "chunk:9803c836b479e875:chunk-74", order: 74, start_line: 249, text: "El analisis debe comunicarse a la poblacion con anticipacion. La calidad de la prediccion importa, pero tambien importa que las personas puedan planear.", title: "Debe comunicarse poblacion", title_candidates: ["debe comunicarse poblacion", "debe comunicarse", "comunicarse poblacion anticipacion", "poblacion anticipacion calidad", "anticipacion calidad prediccion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-52"})
SET n:Section
SET n += {end_line: 255, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-52", numbering: "7.4", order: 52, section_id: "section-52", start_line: 251, title: "7.4 Planeacion escolar"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-75"})
SET n:Chunk
SET n += {character_count: 207, chunk_id: "chunk-75", chunk_type: "paragraph", end_line: 253, node_id: "chunk:9803c836b479e875:chunk-75", order: 75, start_line: 253, text: "La ciudad puede cruzar datos de crecimiento poblacional, transporte, trayectorias escolares y disponibilidad de aulas. Esto ayuda a decidir donde abrir grupos, reforzar escuelas o mejorar transporte escolar.", title: "Cruzar datos crecimiento", title_candidates: ["cruzar datos crecimiento", "datos crecimiento poblacional", "crecimiento poblacional transporte", "poblacional transporte trayectorias", "transporte trayectorias escolares"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-76"})
SET n:Chunk
SET n += {character_count: 158, chunk_id: "chunk-76", chunk_type: "paragraph", end_line: 255, node_id: "chunk:9803c836b479e875:chunk-76", order: 76, start_line: 255, text: "Una decision educativa debe combinar datos con dialogo comunitario. Los numeros muestran tendencias, pero las familias y docentes explican barreras concretas.", title: "Decision educativa debe", title_candidates: ["decision educativa debe", "decision educativa", "educativa debe combinar", "debe combinar datos", "combinar datos dialogo"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 21};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-53"})
SET n:Section
SET n += {end_line: 257, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-53", numbering: "8", order: 53, section_id: "section-53", start_line: 257, title: "8. Riesgos frecuentes"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-54"})
SET n:Section
SET n += {end_line: 261, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-54", numbering: "8.1", order: 54, section_id: "section-54", start_line: 259, title: "8.1 Dependencia excesiva del modelo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-77"})
SET n:Chunk
SET n += {character_count: 193, chunk_id: "chunk-77", chunk_type: "paragraph", end_line: 261, node_id: "chunk:9803c836b479e875:chunk-77", order: 77, start_line: 261, text: "Un riesgo comun es tratar el modelo como autoridad final. Esto puede desplazar juicio profesional y reducir responsabilidad. La recomendacion automatica debe verse como insumo, no como mandato.", title: "Riesgo comun tratar", title_candidates: ["riesgo comun tratar", "riesgo comun", "comun tratar modelo", "tratar modelo autoridad", "modelo autoridad final"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 28};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-55"})
SET n:Section
SET n += {end_line: 265, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-55", numbering: "8.2", order: 55, section_id: "section-55", start_line: 263, title: "8.2 Datos incompletos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-78"})
SET n:Chunk
SET n += {character_count: 189, chunk_id: "chunk-78", chunk_type: "paragraph", end_line: 265, node_id: "chunk:9803c836b479e875:chunk-78", order: 78, start_line: 265, text: "La falta de datos puede ocultar necesidades. Las comunidades menos conectadas pueden producir menos registros digitales. Si el modelo aprende solo de datos visibles, refuerza desigualdades.", title: "Falta datos", title_candidates: ["falta datos", "ocultar necesidades comunidades", "necesidades comunidades menos", "comunidades menos conectadas", "producir menos registros"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 26};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-56"})
SET n:Section
SET n += {end_line: 269, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-56", numbering: "8.3", order: 56, section_id: "section-56", start_line: 267, title: "8.3 Fragmentacion institucional"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-79"})
SET n:Chunk
SET n += {character_count: 203, chunk_id: "chunk-79", chunk_type: "paragraph", end_line: 269, node_id: "chunk:9803c836b479e875:chunk-79", order: 79, start_line: 269, text: "Los datos urbanos suelen estar distribuidos entre dependencias. Si cada equipo usa formatos incompatibles, el analisis integrado se vuelve lento. La interoperabilidad requiere acuerdos, no solo software.", title: "Datos urbanos suelen", title_candidates: ["datos urbanos suelen", "datos urbanos", "urbanos suelen estar", "suelen estar distribuidos", "estar distribuidos dependencias"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 27};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-57"})
SET n:Section
SET n += {end_line: 273, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-57", numbering: "8.4", order: 57, section_id: "section-57", start_line: 271, title: "8.4 Mantenimiento insuficiente"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-80"})
SET n:Chunk
SET n += {character_count: 173, chunk_id: "chunk-80", chunk_type: "paragraph", end_line: 273, node_id: "chunk:9803c836b479e875:chunk-80", order: 80, start_line: 273, text: "Los proyectos de inteligencia artificial fallan cuando se financia el prototipo pero no el mantenimiento. Sensores, modelos, APIs y paneles requieren actualizacion continua.", title: "Proyectos inteligencia artificial", title_candidates: ["proyectos inteligencia artificial", "proyectos inteligencia", "inteligencia artificial fallan", "artificial fallan financia", "fallan financia prototipo"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 23};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-58"})
SET n:Section
SET n += {end_line: 275, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-58", numbering: "9", order: 58, section_id: "section-58", start_line: 275, title: "9. Indicadores de exito"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-59"})
SET n:Section
SET n += {end_line: 279, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-59", numbering: "9.1", order: 59, section_id: "section-59", start_line: 277, title: "9.1 Indicadores tecnicos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-81"})
SET n:Chunk
SET n += {character_count: 168, chunk_id: "chunk-81", chunk_type: "paragraph", end_line: 279, node_id: "chunk:9803c836b479e875:chunk-81", order: 81, start_line: 279, text: "Los indicadores tecnicos incluyen disponibilidad del sistema, latencia, error predictivo, cobertura de datos, estabilidad, frecuencia de actualizacion y tasa de fallos.", title: "Indicadores tecnicos incluyen", title_candidates: ["indicadores tecnicos incluyen", "indicadores tecnicos", "tecnicos incluyen disponibilidad", "incluyen disponibilidad sistema", "disponibilidad sistema latencia"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 21};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-60"})
SET n:Section
SET n += {end_line: 283, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-60", numbering: "9.2", order: 60, section_id: "section-60", start_line: 281, title: "9.2 Indicadores operativos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-82"})
SET n:Chunk
SET n += {character_count: 186, chunk_id: "chunk-82", chunk_type: "paragraph", end_line: 283, node_id: "chunk:9803c836b479e875:chunk-82", order: 82, start_line: 283, text: "Los indicadores operativos incluyen reduccion de tiempos de respuesta, mejor asignacion de recursos, disminucion de incidentes, aumento de cobertura y mejora en continuidad de servicios.", title: "Indicadores operativos incluyen", title_candidates: ["indicadores operativos incluyen", "indicadores operativos", "operativos incluyen reduccion", "incluyen reduccion tiempos", "reduccion tiempos respuesta"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-61"})
SET n:Section
SET n += {end_line: 287, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-61", numbering: "9.3", order: 61, section_id: "section-61", start_line: 285, title: "9.3 Indicadores sociales"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-83"})
SET n:Chunk
SET n += {character_count: 209, chunk_id: "chunk-83", chunk_type: "paragraph", end_line: 287, node_id: "chunk:9803c836b479e875:chunk-83", order: 83, start_line: 287, text: "Los indicadores sociales incluyen confianza publica, percepcion de transparencia, equidad territorial, satisfaccion ciudadana y participacion. Estos indicadores son mas dificiles de medir, pero son esenciales.", title: "Indicadores sociales incluyen", title_candidates: ["indicadores sociales incluyen", "indicadores sociales", "sociales incluyen confianza", "incluyen confianza publica", "confianza publica percepcion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-62"})
SET n:Section
SET n += {end_line: 293, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-62", numbering: "10", order: 62, section_id: "section-62", start_line: 289, title: "10. Conclusiones"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-84"})
SET n:Chunk
SET n += {character_count: 219, chunk_id: "chunk-84", chunk_type: "paragraph", end_line: 291, node_id: "chunk:9803c836b479e875:chunk-84", order: 84, start_line: 291, text: "Un ecosistema urbano de aprendizaje profundo requiere mucho mas que algoritmos. Necesita datos confiables, instituciones coordinadas, explicaciones claras, controles eticos, monitoreo continuo y participacion ciudadana.", title: "Ecosistema urbano aprendizaje", title_candidates: ["ecosistema urbano aprendizaje", "ecosistema urbano", "urbano aprendizaje profundo", "aprendizaje profundo requiere", "profundo requiere mucho"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 25};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-85"})
SET n:Chunk
SET n += {character_count: 292, chunk_id: "chunk-85", chunk_type: "paragraph", end_line: 293, node_id: "chunk:9803c836b479e875:chunk-85", order: 85, start_line: 293, text: "La inteligencia artificial puede ayudar a detectar patrones, anticipar riesgos y coordinar servicios. Su valor aparece cuando se conecta con decisiones concretas y se evalua con criterios humanos. Una ciudad inteligente debe ser tambien una ciudad legible, responsable y abierta a correccion.", title: "Inteligencia artificial", title_candidates: ["inteligencia artificial", "ayudar detectar patrones", "detectar patrones anticipar", "patrones anticipar riesgos", "anticipar riesgos coordinar"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 42};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-63"})
SET n:Section
SET n += {end_line: 295, heading_type: "markdown", level: 2, node_id: "section:9803c836b479e875:section-63", numbering: "11", order: 63, section_id: "section-63", start_line: 295, title: "11. Glosario"};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-64"})
SET n:Section
SET n += {end_line: 299, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-64", numbering: "11.1", order: 64, section_id: "section-64", start_line: 297, title: "11.1 Dato crudo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-86"})
SET n:Chunk
SET n += {character_count: 53, chunk_id: "chunk-86", chunk_type: "paragraph", end_line: 299, node_id: "chunk:9803c836b479e875:chunk-86", order: 86, start_line: 299, text: "Registro original antes de limpieza o transformacion.", title: "Registro original limpieza", title_candidates: ["registro original limpieza", "registro original", "original limpieza transformacion", "original limpieza", "limpieza transformacion"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 7};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-65"})
SET n:Section
SET n += {end_line: 303, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-65", numbering: "11.2", order: 65, section_id: "section-65", start_line: 301, title: "11.2 Metadato"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-87"})
SET n:Chunk
SET n += {character_count: 72, chunk_id: "chunk-87", chunk_type: "paragraph", end_line: 303, node_id: "chunk:9803c836b479e875:chunk-87", order: 87, start_line: 303, text: "Informacion que describe origen, contexto, formato o calidad de un dato.", title: "Describe origen contexto", title_candidates: ["describe origen contexto", "describe origen", "origen contexto formato", "contexto formato calidad", "formato calidad dato"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 11};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-66"})
SET n:Section
SET n += {end_line: 307, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-66", numbering: "11.3", order: 66, section_id: "section-66", start_line: 305, title: "11.3 Modelo predictivo"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-88"})
SET n:Chunk
SET n += {character_count: 85, chunk_id: "chunk-88", chunk_type: "paragraph", end_line: 307, node_id: "chunk:9803c836b479e875:chunk-88", order: 88, start_line: 307, text: "Sistema que estima un resultado futuro o desconocido a partir de patrones aprendidos.", title: "Sistema estima futuro", title_candidates: ["sistema estima futuro", "sistema estima", "estima futuro desconocido", "futuro desconocido partir", "desconocido partir patrones"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 13};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-67"})
SET n:Section
SET n += {end_line: 311, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-67", numbering: "11.4", order: 67, section_id: "section-67", start_line: 309, title: "11.4 Grafo de conocimiento"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-89"})
SET n:Chunk
SET n += {character_count: 75, chunk_id: "chunk-89", chunk_type: "paragraph", end_line: 311, node_id: "chunk:9803c836b479e875:chunk-89", order: 89, start_line: 311, text: "Estructura que representa entidades y relaciones para conectar informacion.", title: "Estructura representa entidades", title_candidates: ["estructura representa entidades", "estructura representa", "representa entidades relaciones", "entidades relaciones conectar", "representa entidades"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 9};

MERGE (n:Section {node_id: "section:9803c836b479e875:section-68"})
SET n:Section
SET n += {end_line: 315, heading_type: "markdown", level: 3, node_id: "section:9803c836b479e875:section-68", numbering: "11.5", order: 68, section_id: "section-68", start_line: 313, title: "11.5 Desviacion de datos"};

MERGE (n:Chunk {node_id: "chunk:9803c836b479e875:chunk-90"})
SET n:Chunk
SET n += {character_count: 83, chunk_id: "chunk-90", chunk_type: "paragraph", end_line: 315, node_id: "chunk:9803c836b479e875:chunk-90", order: 90, start_line: 315, text: "Cambio en la distribucion de los datos que puede reducir la precision de un modelo.", title: "Cambio distribucion datos", title_candidates: ["cambio distribucion datos", "cambio distribucion", "reducir precision modelo", "distribucion datos", "reducir precision"], title_reason: "Selected as the clearest local cue for this paragraph.", title_source: "local_ngram", word_count: 15};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e0fef4b7cb502879"}]->(target)
SET r += {order: 2, relationship_id: "relationship:e0fef4b7cb502879", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-2"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-1"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7d60774b3a5bd40e"}]->(target)
SET r += {order: 1, relationship_id: "relationship:7d60774b3a5bd40e", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-2"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-2"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b8add8863c9b9e7a"}]->(target)
SET r += {order: 2, relationship_id: "relationship:b8add8863c9b9e7a", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:cb986b5518403cc0"}]->(target)
SET r += {order: 3, relationship_id: "relationship:cb986b5518403cc0", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-3"})
MATCH (target {node_id: "section:9803c836b479e875:section-4"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c8a36d792b12b71f"}]->(target)
SET r += {order: 4, relationship_id: "relationship:c8a36d792b12b71f", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-4"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-3"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3e05ec200152ed1b"}]->(target)
SET r += {order: 3, relationship_id: "relationship:3e05ec200152ed1b", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-4"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-4"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:cc4f331704252c06"}]->(target)
SET r += {order: 4, relationship_id: "relationship:cc4f331704252c06", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-3"})
MATCH (target {node_id: "section:9803c836b479e875:section-5"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e6a09401abc62860"}]->(target)
SET r += {order: 5, relationship_id: "relationship:e6a09401abc62860", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-5"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-5"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4df19fcfa187765a"}]->(target)
SET r += {order: 5, relationship_id: "relationship:4df19fcfa187765a", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-5"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a77d82cc95f235c0"}]->(target)
SET r += {order: 6, relationship_id: "relationship:a77d82cc95f235c0", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-3"})
MATCH (target {node_id: "section:9803c836b479e875:section-6"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c6fcd79f1cf2ef0a"}]->(target)
SET r += {order: 6, relationship_id: "relationship:c6fcd79f1cf2ef0a", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-6"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-7"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:23165d1c8952a9af"}]->(target)
SET r += {order: 7, relationship_id: "relationship:23165d1c8952a9af", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-6"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-8"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:76a4cdc65ae03b4a"}]->(target)
SET r += {order: 8, relationship_id: "relationship:76a4cdc65ae03b4a", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-7"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:61ff2abb5fa77af6"}]->(target)
SET r += {order: 7, relationship_id: "relationship:61ff2abb5fa77af6", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-7"})
MATCH (target {node_id: "section:9803c836b479e875:section-8"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:99d3758f7c608d4f"}]->(target)
SET r += {order: 8, relationship_id: "relationship:99d3758f7c608d4f", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-8"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-9"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:07e32c1950f1f542"}]->(target)
SET r += {order: 9, relationship_id: "relationship:07e32c1950f1f542", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-8"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-10"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c3ff2fbbfb89830d"}]->(target)
SET r += {order: 10, relationship_id: "relationship:c3ff2fbbfb89830d", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-7"})
MATCH (target {node_id: "section:9803c836b479e875:section-9"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e38dc7a23772e04f"}]->(target)
SET r += {order: 9, relationship_id: "relationship:e38dc7a23772e04f", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-9"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-11"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2879a14b7417851b"}]->(target)
SET r += {order: 11, relationship_id: "relationship:2879a14b7417851b", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-9"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-12"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:947c35da00a8c5cf"}]->(target)
SET r += {order: 12, relationship_id: "relationship:947c35da00a8c5cf", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-7"})
MATCH (target {node_id: "section:9803c836b479e875:section-10"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2bb270fa90d604a8"}]->(target)
SET r += {order: 10, relationship_id: "relationship:2bb270fa90d604a8", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-10"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-13"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f7c13c022956722f"}]->(target)
SET r += {order: 13, relationship_id: "relationship:f7c13c022956722f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-10"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-14"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:904d85cb73c5cf82"}]->(target)
SET r += {order: 14, relationship_id: "relationship:904d85cb73c5cf82", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-7"})
MATCH (target {node_id: "section:9803c836b479e875:section-11"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:6b1123d0f5d5915b"}]->(target)
SET r += {order: 11, relationship_id: "relationship:6b1123d0f5d5915b", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-11"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-15"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9be6a7c5edb952f5"}]->(target)
SET r += {order: 15, relationship_id: "relationship:9be6a7c5edb952f5", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-11"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-16"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b8ee419abca08c44"}]->(target)
SET r += {order: 16, relationship_id: "relationship:b8ee419abca08c44", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-12"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:eaa54761988347db"}]->(target)
SET r += {order: 12, relationship_id: "relationship:eaa54761988347db", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-12"})
MATCH (target {node_id: "section:9803c836b479e875:section-13"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a2d7cf5e58f304cf"}]->(target)
SET r += {order: 13, relationship_id: "relationship:a2d7cf5e58f304cf", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-13"})
MATCH (target {node_id: "section:9803c836b479e875:section-14"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:72145fa2844efd7e"}]->(target)
SET r += {order: 14, relationship_id: "relationship:72145fa2844efd7e", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-14"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-17"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a5bc7d24c61c04ac"}]->(target)
SET r += {order: 17, relationship_id: "relationship:a5bc7d24c61c04ac", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-14"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-18"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:0329ce3bcadec515"}]->(target)
SET r += {order: 18, relationship_id: "relationship:0329ce3bcadec515", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-13"})
MATCH (target {node_id: "section:9803c836b479e875:section-15"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:031488b681036d67"}]->(target)
SET r += {order: 15, relationship_id: "relationship:031488b681036d67", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-15"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-19"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:51adaa92770da9ab"}]->(target)
SET r += {order: 19, relationship_id: "relationship:51adaa92770da9ab", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-15"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-20"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:bdc611d42b8193a4"}]->(target)
SET r += {order: 20, relationship_id: "relationship:bdc611d42b8193a4", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-12"})
MATCH (target {node_id: "section:9803c836b479e875:section-16"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:57429a0a7045e1bb"}]->(target)
SET r += {order: 16, relationship_id: "relationship:57429a0a7045e1bb", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-16"})
MATCH (target {node_id: "section:9803c836b479e875:section-17"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2d4c79683567d857"}]->(target)
SET r += {order: 17, relationship_id: "relationship:2d4c79683567d857", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-17"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-21"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:1ddf25bd8a1d2f39"}]->(target)
SET r += {order: 21, relationship_id: "relationship:1ddf25bd8a1d2f39", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-17"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-22"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:90e37ebe9c6cdf3e"}]->(target)
SET r += {order: 22, relationship_id: "relationship:90e37ebe9c6cdf3e", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-16"})
MATCH (target {node_id: "section:9803c836b479e875:section-18"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:01a9e5abc9242a13"}]->(target)
SET r += {order: 18, relationship_id: "relationship:01a9e5abc9242a13", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-18"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-23"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:22dc5edfb11106e3"}]->(target)
SET r += {order: 23, relationship_id: "relationship:22dc5edfb11106e3", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-18"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-24"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:cd02ed690ce7c88f"}]->(target)
SET r += {order: 24, relationship_id: "relationship:cd02ed690ce7c88f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-12"})
MATCH (target {node_id: "section:9803c836b479e875:section-19"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:17a114a118dc9c87"}]->(target)
SET r += {order: 19, relationship_id: "relationship:17a114a118dc9c87", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-19"})
MATCH (target {node_id: "section:9803c836b479e875:section-20"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:163fa85267f5d07f"}]->(target)
SET r += {order: 20, relationship_id: "relationship:163fa85267f5d07f", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-20"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-25"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4793e5d7e27ad82f"}]->(target)
SET r += {order: 25, relationship_id: "relationship:4793e5d7e27ad82f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-20"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-26"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f55d0feea0a035f5"}]->(target)
SET r += {order: 26, relationship_id: "relationship:f55d0feea0a035f5", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-19"})
MATCH (target {node_id: "section:9803c836b479e875:section-21"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:20b31a166082a2f6"}]->(target)
SET r += {order: 21, relationship_id: "relationship:20b31a166082a2f6", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-21"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-27"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:040a06db41273001"}]->(target)
SET r += {order: 27, relationship_id: "relationship:040a06db41273001", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-21"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-28"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:257c7193572d910b"}]->(target)
SET r += {order: 28, relationship_id: "relationship:257c7193572d910b", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-12"})
MATCH (target {node_id: "section:9803c836b479e875:section-22"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:06e583049c6dd98e"}]->(target)
SET r += {order: 22, relationship_id: "relationship:06e583049c6dd98e", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-22"})
MATCH (target {node_id: "section:9803c836b479e875:section-23"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3e0eace0f21259b2"}]->(target)
SET r += {order: 23, relationship_id: "relationship:3e0eace0f21259b2", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-23"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-29"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7d010892be1eeeb8"}]->(target)
SET r += {order: 29, relationship_id: "relationship:7d010892be1eeeb8", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-23"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-30"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b58d84966210c139"}]->(target)
SET r += {order: 30, relationship_id: "relationship:b58d84966210c139", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-22"})
MATCH (target {node_id: "section:9803c836b479e875:section-24"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:79c91b947e530b89"}]->(target)
SET r += {order: 24, relationship_id: "relationship:79c91b947e530b89", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-24"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-31"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:829a212604f12929"}]->(target)
SET r += {order: 31, relationship_id: "relationship:829a212604f12929", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-24"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-32"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f7e78c03869e1e8d"}]->(target)
SET r += {order: 32, relationship_id: "relationship:f7e78c03869e1e8d", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-12"})
MATCH (target {node_id: "section:9803c836b479e875:section-25"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d4aa91afea4b20b8"}]->(target)
SET r += {order: 25, relationship_id: "relationship:d4aa91afea4b20b8", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-25"})
MATCH (target {node_id: "section:9803c836b479e875:section-26"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:33762bebe3fc0e28"}]->(target)
SET r += {order: 26, relationship_id: "relationship:33762bebe3fc0e28", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-26"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-33"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c5a19d7b5358542f"}]->(target)
SET r += {order: 33, relationship_id: "relationship:c5a19d7b5358542f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-26"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-34"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c61f745ba4543857"}]->(target)
SET r += {order: 34, relationship_id: "relationship:c61f745ba4543857", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-25"})
MATCH (target {node_id: "section:9803c836b479e875:section-27"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e33ff43820c939cc"}]->(target)
SET r += {order: 27, relationship_id: "relationship:e33ff43820c939cc", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-27"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-35"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ffe8c97b222f6ac2"}]->(target)
SET r += {order: 35, relationship_id: "relationship:ffe8c97b222f6ac2", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-27"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-36"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:60a9096bee557b0b"}]->(target)
SET r += {order: 36, relationship_id: "relationship:60a9096bee557b0b", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-12"})
MATCH (target {node_id: "section:9803c836b479e875:section-28"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:06f82266f6fd90d7"}]->(target)
SET r += {order: 28, relationship_id: "relationship:06f82266f6fd90d7", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-28"})
MATCH (target {node_id: "section:9803c836b479e875:section-29"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:38deca0c77d73a43"}]->(target)
SET r += {order: 29, relationship_id: "relationship:38deca0c77d73a43", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-29"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-37"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4e7196400f776b36"}]->(target)
SET r += {order: 37, relationship_id: "relationship:4e7196400f776b36", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-29"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-38"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:6c760ca51a051cab"}]->(target)
SET r += {order: 38, relationship_id: "relationship:6c760ca51a051cab", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-28"})
MATCH (target {node_id: "section:9803c836b479e875:section-30"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:0d1b98fe61b32751"}]->(target)
SET r += {order: 30, relationship_id: "relationship:0d1b98fe61b32751", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-30"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-39"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:675febb124a3e839"}]->(target)
SET r += {order: 39, relationship_id: "relationship:675febb124a3e839", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-30"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-40"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:441a7d68c10b2f65"}]->(target)
SET r += {order: 40, relationship_id: "relationship:441a7d68c10b2f65", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-31"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:599967119fb150df"}]->(target)
SET r += {order: 31, relationship_id: "relationship:599967119fb150df", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-31"})
MATCH (target {node_id: "section:9803c836b479e875:section-32"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7995f06207c1b457"}]->(target)
SET r += {order: 32, relationship_id: "relationship:7995f06207c1b457", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-32"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-41"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:fafd1e05cc53482d"}]->(target)
SET r += {order: 41, relationship_id: "relationship:fafd1e05cc53482d", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-32"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-42"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d0303d358bd91fb4"}]->(target)
SET r += {order: 42, relationship_id: "relationship:d0303d358bd91fb4", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-31"})
MATCH (target {node_id: "section:9803c836b479e875:section-33"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:688bed4fe74b3b5f"}]->(target)
SET r += {order: 33, relationship_id: "relationship:688bed4fe74b3b5f", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-33"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-43"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:034d3ac828d5bcb8"}]->(target)
SET r += {order: 43, relationship_id: "relationship:034d3ac828d5bcb8", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-33"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-44"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c86ef68317f9f08d"}]->(target)
SET r += {order: 44, relationship_id: "relationship:c86ef68317f9f08d", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-31"})
MATCH (target {node_id: "section:9803c836b479e875:section-34"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:968faf3f61f9f7fe"}]->(target)
SET r += {order: 34, relationship_id: "relationship:968faf3f61f9f7fe", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-34"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-45"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b8826f2321bfe263"}]->(target)
SET r += {order: 45, relationship_id: "relationship:b8826f2321bfe263", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-34"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-46"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3d71dd8c2f9de941"}]->(target)
SET r += {order: 46, relationship_id: "relationship:3d71dd8c2f9de941", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-31"})
MATCH (target {node_id: "section:9803c836b479e875:section-35"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e50998cf5f450a4e"}]->(target)
SET r += {order: 35, relationship_id: "relationship:e50998cf5f450a4e", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-35"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-47"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9390956692480890"}]->(target)
SET r += {order: 47, relationship_id: "relationship:9390956692480890", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-35"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-48"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:65f3324255ded4fa"}]->(target)
SET r += {order: 48, relationship_id: "relationship:65f3324255ded4fa", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-36"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:6a790661cfa00b7b"}]->(target)
SET r += {order: 36, relationship_id: "relationship:6a790661cfa00b7b", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-36"})
MATCH (target {node_id: "section:9803c836b479e875:section-37"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9ab7d0142a0b9ca6"}]->(target)
SET r += {order: 37, relationship_id: "relationship:9ab7d0142a0b9ca6", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-37"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-49"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:befe8988c2d9804f"}]->(target)
SET r += {order: 49, relationship_id: "relationship:befe8988c2d9804f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-37"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-50"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:eaac63dba86833ab"}]->(target)
SET r += {order: 50, relationship_id: "relationship:eaac63dba86833ab", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-36"})
MATCH (target {node_id: "section:9803c836b479e875:section-38"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:8b4a4a50308a6f24"}]->(target)
SET r += {order: 38, relationship_id: "relationship:8b4a4a50308a6f24", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-38"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-51"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:88785941a7847819"}]->(target)
SET r += {order: 51, relationship_id: "relationship:88785941a7847819", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-38"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-52"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2b50281fa8c4340c"}]->(target)
SET r += {order: 52, relationship_id: "relationship:2b50281fa8c4340c", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-36"})
MATCH (target {node_id: "section:9803c836b479e875:section-39"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4aa83b776eb86f92"}]->(target)
SET r += {order: 39, relationship_id: "relationship:4aa83b776eb86f92", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-39"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-53"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:25db71ad9de7a573"}]->(target)
SET r += {order: 53, relationship_id: "relationship:25db71ad9de7a573", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-39"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-54"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ddbc119d1cce2427"}]->(target)
SET r += {order: 54, relationship_id: "relationship:ddbc119d1cce2427", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-36"})
MATCH (target {node_id: "section:9803c836b479e875:section-40"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f7dbc865aa6f3fe7"}]->(target)
SET r += {order: 40, relationship_id: "relationship:f7dbc865aa6f3fe7", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-40"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-55"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:52322b476e41ecf4"}]->(target)
SET r += {order: 55, relationship_id: "relationship:52322b476e41ecf4", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-40"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-56"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3452b4adf7f9cbcc"}]->(target)
SET r += {order: 56, relationship_id: "relationship:3452b4adf7f9cbcc", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-36"})
MATCH (target {node_id: "section:9803c836b479e875:section-41"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ffae6a63f96d382c"}]->(target)
SET r += {order: 41, relationship_id: "relationship:ffae6a63f96d382c", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-41"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-57"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:cebb828b0b158848"}]->(target)
SET r += {order: 57, relationship_id: "relationship:cebb828b0b158848", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-41"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-58"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:b893b68afe8bda32"}]->(target)
SET r += {order: 58, relationship_id: "relationship:b893b68afe8bda32", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-36"})
MATCH (target {node_id: "section:9803c836b479e875:section-42"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c20dab327f76b8d2"}]->(target)
SET r += {order: 42, relationship_id: "relationship:c20dab327f76b8d2", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-42"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-59"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:74959f0eed73930f"}]->(target)
SET r += {order: 59, relationship_id: "relationship:74959f0eed73930f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-42"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-60"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2a1d427db571d491"}]->(target)
SET r += {order: 60, relationship_id: "relationship:2a1d427db571d491", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-43"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:c5e1ffaca353b361"}]->(target)
SET r += {order: 43, relationship_id: "relationship:c5e1ffaca353b361", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-43"})
MATCH (target {node_id: "section:9803c836b479e875:section-44"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7ebaea5059aa03f0"}]->(target)
SET r += {order: 44, relationship_id: "relationship:7ebaea5059aa03f0", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-44"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-61"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:be3832a66a9743f0"}]->(target)
SET r += {order: 61, relationship_id: "relationship:be3832a66a9743f0", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-44"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-62"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5187527b61164b39"}]->(target)
SET r += {order: 62, relationship_id: "relationship:5187527b61164b39", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-43"})
MATCH (target {node_id: "section:9803c836b479e875:section-45"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5ff1fbbbffae6360"}]->(target)
SET r += {order: 45, relationship_id: "relationship:5ff1fbbbffae6360", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-45"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-63"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:47c346e95c000915"}]->(target)
SET r += {order: 63, relationship_id: "relationship:47c346e95c000915", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-45"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-64"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9273a82ff1222c2c"}]->(target)
SET r += {order: 64, relationship_id: "relationship:9273a82ff1222c2c", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-43"})
MATCH (target {node_id: "section:9803c836b479e875:section-46"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:78c8ba7dd1b86a3d"}]->(target)
SET r += {order: 46, relationship_id: "relationship:78c8ba7dd1b86a3d", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-46"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-65"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:09d3fe37c0e9dc5c"}]->(target)
SET r += {order: 65, relationship_id: "relationship:09d3fe37c0e9dc5c", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-46"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-66"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a4ca95a5a99f4837"}]->(target)
SET r += {order: 66, relationship_id: "relationship:a4ca95a5a99f4837", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-43"})
MATCH (target {node_id: "section:9803c836b479e875:section-47"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:509a65788ac38d77"}]->(target)
SET r += {order: 47, relationship_id: "relationship:509a65788ac38d77", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-47"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-67"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:87fafabd9c53da65"}]->(target)
SET r += {order: 67, relationship_id: "relationship:87fafabd9c53da65", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-47"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-68"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:0a1e120a4061783e"}]->(target)
SET r += {order: 68, relationship_id: "relationship:0a1e120a4061783e", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-48"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ae35cf1c762b4c7c"}]->(target)
SET r += {order: 48, relationship_id: "relationship:ae35cf1c762b4c7c", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-48"})
MATCH (target {node_id: "section:9803c836b479e875:section-49"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:17072738105392f9"}]->(target)
SET r += {order: 49, relationship_id: "relationship:17072738105392f9", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-49"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-69"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:775b506fcf235544"}]->(target)
SET r += {order: 69, relationship_id: "relationship:775b506fcf235544", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-49"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-70"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:04c51ac9f403d395"}]->(target)
SET r += {order: 70, relationship_id: "relationship:04c51ac9f403d395", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-48"})
MATCH (target {node_id: "section:9803c836b479e875:section-50"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:af6765df56557421"}]->(target)
SET r += {order: 50, relationship_id: "relationship:af6765df56557421", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-50"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-71"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5a8876430d7572d3"}]->(target)
SET r += {order: 71, relationship_id: "relationship:5a8876430d7572d3", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-50"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-72"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:38702fcf92137e4f"}]->(target)
SET r += {order: 72, relationship_id: "relationship:38702fcf92137e4f", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-48"})
MATCH (target {node_id: "section:9803c836b479e875:section-51"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:4e6ce45cbf817cc8"}]->(target)
SET r += {order: 51, relationship_id: "relationship:4e6ce45cbf817cc8", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-51"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-73"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a0bd9dde04a4aa97"}]->(target)
SET r += {order: 73, relationship_id: "relationship:a0bd9dde04a4aa97", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-51"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-74"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:7a7f700880d5e4c0"}]->(target)
SET r += {order: 74, relationship_id: "relationship:7a7f700880d5e4c0", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-48"})
MATCH (target {node_id: "section:9803c836b479e875:section-52"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:85d8fc22ad4de66d"}]->(target)
SET r += {order: 52, relationship_id: "relationship:85d8fc22ad4de66d", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-52"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-75"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:ca2160b53f4b5d57"}]->(target)
SET r += {order: 75, relationship_id: "relationship:ca2160b53f4b5d57", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-52"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-76"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:8fa2b54f7b513773"}]->(target)
SET r += {order: 76, relationship_id: "relationship:8fa2b54f7b513773", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-53"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:19abce2f921eb52c"}]->(target)
SET r += {order: 53, relationship_id: "relationship:19abce2f921eb52c", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-53"})
MATCH (target {node_id: "section:9803c836b479e875:section-54"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:a4cc6b22d09b1690"}]->(target)
SET r += {order: 54, relationship_id: "relationship:a4cc6b22d09b1690", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-54"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-77"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f04b88e8ab1d4417"}]->(target)
SET r += {order: 77, relationship_id: "relationship:f04b88e8ab1d4417", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-53"})
MATCH (target {node_id: "section:9803c836b479e875:section-55"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:95b22b0c05c52ab6"}]->(target)
SET r += {order: 55, relationship_id: "relationship:95b22b0c05c52ab6", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-55"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-78"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:2fc9f640ca1eb7b1"}]->(target)
SET r += {order: 78, relationship_id: "relationship:2fc9f640ca1eb7b1", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-53"})
MATCH (target {node_id: "section:9803c836b479e875:section-56"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e53969a44b85b837"}]->(target)
SET r += {order: 56, relationship_id: "relationship:e53969a44b85b837", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-56"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-79"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:437bb1d59380e83a"}]->(target)
SET r += {order: 79, relationship_id: "relationship:437bb1d59380e83a", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-53"})
MATCH (target {node_id: "section:9803c836b479e875:section-57"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:665ad3f2afe6fcf2"}]->(target)
SET r += {order: 57, relationship_id: "relationship:665ad3f2afe6fcf2", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-57"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-80"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3e0ee240731ab388"}]->(target)
SET r += {order: 80, relationship_id: "relationship:3e0ee240731ab388", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-58"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:6000148cfffc39d4"}]->(target)
SET r += {order: 58, relationship_id: "relationship:6000148cfffc39d4", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-58"})
MATCH (target {node_id: "section:9803c836b479e875:section-59"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:bd49eb9b5aac09c0"}]->(target)
SET r += {order: 59, relationship_id: "relationship:bd49eb9b5aac09c0", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-59"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-81"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9a163a6c4ff585d2"}]->(target)
SET r += {order: 81, relationship_id: "relationship:9a163a6c4ff585d2", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-58"})
MATCH (target {node_id: "section:9803c836b479e875:section-60"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:e8f49e4d520ef540"}]->(target)
SET r += {order: 60, relationship_id: "relationship:e8f49e4d520ef540", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-60"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-82"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f308c6eb08beba1e"}]->(target)
SET r += {order: 82, relationship_id: "relationship:f308c6eb08beba1e", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-58"})
MATCH (target {node_id: "section:9803c836b479e875:section-61"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:0db0b725f7789afb"}]->(target)
SET r += {order: 61, relationship_id: "relationship:0db0b725f7789afb", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-61"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-83"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:f55ecb6e42e86522"}]->(target)
SET r += {order: 83, relationship_id: "relationship:f55ecb6e42e86522", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-62"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3725867c483272bc"}]->(target)
SET r += {order: 62, relationship_id: "relationship:3725867c483272bc", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-62"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-84"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:434e8dbacf50555a"}]->(target)
SET r += {order: 84, relationship_id: "relationship:434e8dbacf50555a", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-62"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-85"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3294f30b1effb4cd"}]->(target)
SET r += {order: 85, relationship_id: "relationship:3294f30b1effb4cd", role: "contains_chunk"};

MATCH (source {node_id: "document:9803c836b479e875"})
MATCH (target {node_id: "section:9803c836b479e875:section-63"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:d298b8ededfcd688"}]->(target)
SET r += {order: 63, relationship_id: "relationship:d298b8ededfcd688", role: "contains_section"};

MATCH (source {node_id: "section:9803c836b479e875:section-63"})
MATCH (target {node_id: "section:9803c836b479e875:section-64"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:cd1cee88e60ffa4a"}]->(target)
SET r += {order: 64, relationship_id: "relationship:cd1cee88e60ffa4a", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-64"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-86"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:9d5f5638a641a89c"}]->(target)
SET r += {order: 86, relationship_id: "relationship:9d5f5638a641a89c", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-63"})
MATCH (target {node_id: "section:9803c836b479e875:section-65"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:70176e90fd705f05"}]->(target)
SET r += {order: 65, relationship_id: "relationship:70176e90fd705f05", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-65"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-87"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:70cffce537687592"}]->(target)
SET r += {order: 87, relationship_id: "relationship:70cffce537687592", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-63"})
MATCH (target {node_id: "section:9803c836b479e875:section-66"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:3c69e62974bada61"}]->(target)
SET r += {order: 66, relationship_id: "relationship:3c69e62974bada61", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-66"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-88"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:65c968c9e9819795"}]->(target)
SET r += {order: 88, relationship_id: "relationship:65c968c9e9819795", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-63"})
MATCH (target {node_id: "section:9803c836b479e875:section-67"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:dfa434867e6df69a"}]->(target)
SET r += {order: 67, relationship_id: "relationship:dfa434867e6df69a", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-67"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-89"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:dfe818e0da9b7403"}]->(target)
SET r += {order: 89, relationship_id: "relationship:dfe818e0da9b7403", role: "contains_chunk"};

MATCH (source {node_id: "section:9803c836b479e875:section-63"})
MATCH (target {node_id: "section:9803c836b479e875:section-68"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:0c11967235a75150"}]->(target)
SET r += {order: 68, relationship_id: "relationship:0c11967235a75150", role: "contains_subsection"};

MATCH (source {node_id: "section:9803c836b479e875:section-68"})
MATCH (target {node_id: "chunk:9803c836b479e875:chunk-90"})
MERGE (source)-[r:DIRECTIONAL {relationship_id: "relationship:5e816b4616f3c44f"}]->(target)
SET r += {order: 90, relationship_id: "relationship:5e816b4616f3c44f", role: "contains_chunk"};

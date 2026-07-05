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

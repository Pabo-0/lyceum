# Documento de prueba fase 2: fundamentos de Machine Learning

## 1. Proposito y contexto educativo

Este documento es una muestra extensa para evaluar la fase 2 del sistema de interpretacion de documentos. El tema elegido es Machine Learning porque combina definiciones formales, razonamiento matematico, tablas comparativas, procedimientos tecnicos y criterios pedagogicos que aparecen con frecuencia en materiales educativos reales.

Machine Learning, o aprendizaje automatico, es una rama de la inteligencia artificial que estudia metodos capaces de mejorar su desempeno en una tarea a partir de datos. En lugar de programar reglas explicitas para cada caso, se define una familia de modelos, se proporciona evidencia en forma de ejemplos y se ajustan parametros para reducir una funcion de perdida.

En un curso introductorio, el objetivo no es memorizar algoritmos aislados, sino entender la estructura comun que comparten: un conjunto de datos, una representacion, una hipotesis, un criterio de evaluacion y un procedimiento de optimizacion. Esta estructura permite comparar modelos simples como regresion lineal con modelos mas flexibles como bosques aleatorios o redes neuronales.

### 1.1 Objetivos de aprendizaje

Al estudiar este documento, una persona deberia poder reconocer los elementos centrales de un flujo de trabajo de Machine Learning y explicar por que cada etapa afecta el desempeno final del sistema. La separacion por secciones busca que el grafo resultante refleje una progresion pedagogica clara.

- Definir Machine Learning con precision conceptual.
- Diferenciar aprendizaje supervisado, no supervisado y por refuerzo.
- Interpretar funciones de perdida y metricas de evaluacion.
- Reconocer riesgos como sobreajuste, fuga de informacion y sesgo de datos.
- Comprender el papel de la validacion y la explicabilidad en entornos educativos.

El documento tambien incluye bloques Markdown que deben conservarse dentro de los chunks. La fase 2 debe mostrar tablas, formulas, listas, citas y codigo sin perder estructura visual.

## 2. Definicion formal de Machine Learning

Una definicion clasica sostiene que un programa aprende de la experiencia `E` con respecto a una clase de tareas `T` y una medida de desempeno `P` si su desempeno en `T`, medido por `P`, mejora con la experiencia `E`. Esta formulacion es util porque separa tres preguntas: que tarea se resuelve, que datos alimentan el proceso y como se decide si hubo mejora.

En la practica, una tarea puede ser clasificar correos como deseados o no deseados, estimar el precio de una vivienda, recomendar ejercicios a un estudiante o detectar patrones en senales medicas. La experiencia suele representarse como un conjunto de observaciones con atributos, etiquetas, relaciones temporales o interacciones.

$$
ML = (T, E, P)
$$

Donde `T` representa la tarea, `E` la experiencia disponible y `P` la medida de desempeno. Aunque la notacion es compacta, ayuda a evitar una confusion comun: un modelo no "aprende" de manera abstracta, aprende en relacion con una tarea concreta y una evaluacion definida.

### 2.1 Componentes de una tarea predictiva

Una tarea predictiva supervisada se puede describir mediante entradas `x`, salidas esperadas `y` y una funcion aproximadora `f_theta`. El subindice `theta` representa los parametros del modelo. Durante el entrenamiento, se busca un valor de `theta` que produzca predicciones cercanas a las etiquetas observadas.

| Componente | Simbolo comun | Pregunta educativa | Ejemplo |
| --- | --- | --- | --- |
| Entrada | `x` | Que informacion recibe el modelo | horas de estudio, asistencia, puntajes previos |
| Etiqueta | `y` | Que se desea predecir | resultado aprobado o no aprobado |
| Modelo | `f_theta` | Que familia de funciones se ajusta | regresion logistica |
| Perdida | `L` | Como se penalizan errores | entropia cruzada |
| Metrica | `M` | Como se reporta desempeno | exactitud o F1 |

La tabla anterior debe permanecer como tabla Markdown. Si se aplana, se pierde la relacion entre simbolo, pregunta y ejemplo.

## 3. Datos, representacion y calidad

Los datos son la materia prima del aprendizaje automatico. Sin embargo, no basta con acumular muchos registros. La calidad de los datos depende de su pertinencia, cobertura, consistencia, temporalidad y relacion con la tarea. Un conjunto de datos grande pero sesgado puede producir un modelo convincente en apariencia y deficiente en situaciones reales.

En educacion, los datos pueden provenir de plataformas de aprendizaje, evaluaciones, interacciones con materiales, registros de asistencia o respuestas abiertas. Cada fuente introduce supuestos. Por ejemplo, el tiempo en pantalla no siempre significa atencion, y un puntaje bajo no siempre indica falta de comprension; puede reflejar ansiedad, ambiguedad en la pregunta o falta de acceso a recursos.

### 3.1 Tipos de variables

La representacion transforma observaciones del mundo en variables que un algoritmo puede procesar. Algunas variables son numericas, otras categoricas, ordinales, textuales o temporales. El diseno de esta representacion influye de manera directa en lo que el modelo puede aprender.

| Tipo de variable | Descripcion | Transformacion frecuente | Riesgo comun |
| --- | --- | --- | --- |
| Numerica continua | Valores medidos en escala | normalizacion o estandarizacion | unidades inconsistentes |
| Categorica nominal | Clases sin orden natural | one-hot encoding | categorias raras o nuevas |
| Ordinal | Categorias con orden | codificacion ordinal | asumir distancias falsas |
| Texto | Secuencias de palabras | bolsa de palabras, embeddings | perdida de contexto |
| Temporal | Eventos ordenados | ventanas, rezagos, tendencias | fuga de informacion futura |

Una representacion adecuada no solo mejora la precision; tambien facilita interpretar errores. Cuando las variables se documentan con claridad, un docente o analista puede entender por que un modelo falla en ciertos grupos o situaciones.

### 3.2 Limpieza y preparacion

La preparacion de datos incluye detectar valores faltantes, corregir formatos, eliminar duplicados, revisar outliers y separar conjuntos de entrenamiento, validacion y prueba. Esta etapa suele ocupar una gran parte del trabajo aplicado porque los modelos son sensibles a detalles aparentemente pequenos.

Puntos clave para una preparacion responsable:

- Registrar las reglas de limpieza usadas.
- Evitar usar informacion del conjunto de prueba durante el entrenamiento.
- Documentar variables eliminadas y la razon de eliminacion.
- Conservar versiones de datos y codigo de preparacion.
- Revisar si los datos representan adecuadamente a la poblacion objetivo.

> En Machine Learning educativo, preparar datos no es una tarea mecanica. Es una decision pedagogica y etica porque determina que aspectos del aprendizaje se vuelven visibles para el modelo.

## 4. Aprendizaje supervisado

El aprendizaje supervisado utiliza ejemplos en los que se conoce la respuesta esperada. El algoritmo recibe pares `(x_i, y_i)` y busca una funcion que generalice a casos nuevos. Dos tareas supervisadas frecuentes son clasificacion y regresion.

En clasificacion, la salida pertenece a un conjunto discreto de clases. Por ejemplo, predecir si una respuesta escrita muestra comprension conceptual, error procedimental o ausencia de evidencia. En regresion, la salida es numerica, como estimar el tiempo necesario para completar una unidad o el puntaje esperado en una evaluacion.

### 4.1 Regresion lineal

La regresion lineal modela la relacion entre variables de entrada y una salida continua mediante una combinacion ponderada de atributos. Aunque es simple, sigue siendo importante porque ofrece una base conceptual para entender parametros, perdida y optimizacion.

$$
\hat{y} = w_0 + w_1x_1 + w_2x_2 + \cdots + w_px_p
$$

La prediccion `\hat{y}` se obtiene sumando una interseccion `w_0` y productos entre pesos `w_j` y atributos `x_j`. Si el objetivo es minimizar error cuadratico medio, la perdida para `n` observaciones puede escribirse asi:

$$
MSE = \frac{1}{n}\sum_{i=1}^{n}(y_i - \hat{y}_i)^2
$$

En el aula, esta formula permite discutir por que errores grandes pesan mas que errores pequenos. Tambien permite mostrar que una metrica aparentemente tecnica contiene una decision: penalizar de manera cuadratica.

### 4.2 Regresion logistica

La regresion logistica se usa con frecuencia para clasificacion binaria. A pesar de su nombre, no predice una cantidad continua sin restricciones, sino una probabilidad entre 0 y 1. Esto se logra aplicando la funcion sigmoide a una combinacion lineal.

$$
\sigma(z) = \frac{1}{1 + e^{-z}}
$$

La salida se interpreta como `P(y = 1 | x)`. En un contexto educativo, podria estimar la probabilidad de que un estudiante necesite apoyo adicional en un tema. Esa probabilidad no debe confundirse con una etiqueta definitiva. La decision final depende de un umbral, del costo de falsos positivos y falsos negativos, y de la intervencion disponible.

### 4.3 Arboles de decision

Un arbol de decision divide el espacio de atributos mediante reglas simples. Cada nodo interno plantea una condicion y cada hoja produce una prediccion. Su atractivo pedagogico es que permite visualizar una secuencia de decisiones.

Ejemplo simplificado:

```text
si dominio_de_prerrequisitos < 0.50:
    recomendar repaso guiado
si no, si practica_reciente < 3 sesiones:
    recomendar ejercicios graduados
si no:
    recomendar desafio aplicado
```

Aunque los arboles son interpretables, pueden sobreajustarse si crecen sin restricciones. Por eso suelen limitarse con profundidad maxima, numero minimo de muestras por hoja o poda posterior.

## 5. Aprendizaje no supervisado

El aprendizaje no supervisado busca estructura en datos sin etiquetas explicitas. No intenta predecir una respuesta conocida, sino descubrir agrupamientos, dimensiones latentes o patrones frecuentes. Esto es util cuando se quiere explorar una poblacion de estudiantes o materiales sin imponer categorias previas.

### 5.1 Agrupamiento

El agrupamiento, o clustering, asigna observaciones a grupos segun similitud. Un ejemplo clasico es `k-means`, que busca `k` centroides y asigna cada punto al centro mas cercano.

$$
J = \sum_{i=1}^{n} \min_{c \in \{1,\dots,k\}} ||x_i - \mu_c||^2
$$

La formula expresa que se minimiza la distancia de cada punto al centroide de su grupo. En educacion, el agrupamiento puede revelar perfiles de interaccion, como estudiantes que consultan teoria antes de practicar, estudiantes que saltan directo a ejercicios o estudiantes que repiten intentos sin revisar retroalimentacion.

| Metodo | Idea principal | Uso educativo posible | Precaucion |
| --- | --- | --- | --- |
| k-means | centroides y distancia euclidiana | perfiles de actividad | requiere elegir `k` |
| clustering jerarquico | fusion progresiva de grupos | explorar niveles de similitud | puede ser costoso |
| DBSCAN | regiones densas | detectar patrones no esfericos | sensible a parametros |
| modelos de mezcla | grupos probabilisticos | incertidumbre de pertenencia | supuestos distribucionales |

### 5.2 Reduccion de dimensionalidad

La reduccion de dimensionalidad transforma datos con muchos atributos en representaciones mas compactas. Esto puede ayudar a visualizar datos, eliminar ruido o preparar entradas para otros modelos. Tecnicas como PCA buscan direcciones de maxima varianza, mientras metodos no lineales capturan estructuras mas complejas.

PCA se puede presentar como un cambio de coordenadas:

$$
Z = XW
$$

Donde `X` es la matriz de datos centrada, `W` contiene vectores principales y `Z` es la representacion proyectada. La interpretacion debe hacerse con cuidado: una proyeccion util para visualizar no siempre conserva todas las relaciones pedagogicamente relevantes.

## 6. Aprendizaje por refuerzo

El aprendizaje por refuerzo estudia agentes que interactuan con un entorno mediante acciones. El agente recibe recompensas y aprende una politica para maximizar recompensa acumulada. A diferencia del aprendizaje supervisado, no se le entrega la respuesta correcta para cada estado; debe explorar consecuencias.

Los elementos principales son:

- Estado `s`: informacion disponible sobre la situacion actual.
- Accion `a`: decision que toma el agente.
- Recompensa `r`: senal de evaluacion inmediata.
- Politica `\pi(a|s)`: regla para elegir acciones.
- Valor `V(s)`: estimacion de recompensa futura desde un estado.

La ecuacion de Bellman para una politica fija puede escribirse asi:

$$
V^\pi(s) = \mathbb{E}_\pi \left[ r_{t+1} + \gamma V^\pi(s_{t+1}) \mid s_t = s \right]
$$

En contextos educativos, el aprendizaje por refuerzo puede inspirar sistemas adaptativos que deciden que actividad recomendar despues. Sin embargo, su aplicacion requiere cautela porque explorar acciones suboptimas con estudiantes reales puede tener costos formativos.

## 7. Entrenamiento, perdida y optimizacion

Entrenar un modelo significa ajustar parametros para reducir una funcion de perdida. El procedimiento exacto depende del modelo, pero muchas tecnicas modernas usan variantes de descenso por gradiente. La idea general es modificar parametros en la direccion que reduce la perdida.

$$
\theta_{t+1} = \theta_t - \eta \nabla_\theta L(\theta_t)
$$

Donde `\eta` es la tasa de aprendizaje y `\nabla_\theta L` es el gradiente de la perdida respecto a los parametros. Si `\eta` es demasiado grande, el entrenamiento puede oscilar; si es demasiado pequena, puede avanzar muy lento.

### 7.1 Funcion de perdida

La funcion de perdida define que significa equivocarse. Por eso no es un detalle tecnico menor. En clasificacion binaria, una perdida comun es la entropia cruzada:

$$
L(y, \hat{p}) = -y \log(\hat{p}) - (1-y)\log(1-\hat{p})
$$

Esta perdida penaliza fuertemente predicciones confiadas pero incorrectas. En tareas educativas, elegir la perdida adecuada puede depender del objetivo: no es lo mismo detectar riesgo academico, estimar dominio conceptual o recomendar materiales.

### 7.2 Regularizacion

La regularizacion agrega restricciones o penalizaciones para mejorar la generalizacion. En modelos lineales, dos penalizaciones frecuentes son L1 y L2.

| Regularizacion | Penalizacion | Efecto usual | Interpretacion |
| --- | --- | --- | --- |
| L1 | `\lambda \sum_j |w_j|` | induce pesos cero | seleccion de variables |
| L2 | `\lambda \sum_j w_j^2` | reduce magnitudes | estabilidad numerica |
| Dropout | apaga unidades aleatorias | reduce coadaptacion | robustez en redes |
| Early stopping | detiene entrenamiento | evita deterioro en validacion | control empirico |

La regularizacion no corrige datos mal definidos ni objetivos confusos. Solo controla la complejidad del modelo dentro de una formulacion dada.

## 8. Generalizacion y sobreajuste

La generalizacion es la capacidad de un modelo para funcionar en datos no vistos. Un modelo sobreajustado aprende detalles accidentales del conjunto de entrenamiento y falla al enfrentar nuevos casos. Un modelo subajustado, en cambio, es demasiado simple para capturar la estructura relevante.

La tension entre sesgo y varianza suele presentarse como un equilibrio. Modelos simples tienen alto sesgo si no representan patrones importantes. Modelos muy flexibles pueden tener alta varianza si se adaptan demasiado a ruido.

### 8.1 Separacion de datos

Una practica fundamental es separar los datos en entrenamiento, validacion y prueba. Cada particion tiene un papel distinto:

- Entrenamiento: ajustar parametros.
- Validacion: elegir hiperparametros y comparar variantes.
- Prueba: estimar desempeno final en datos no usados durante decisiones.

Si se usa el conjunto de prueba para tomar decisiones, deja de ser una prueba independiente. Este problema se llama fuga de informacion evaluativa.

### 8.2 Validacion cruzada

La validacion cruzada divide los datos en varios pliegues. El modelo se entrena varias veces, usando un pliegue como validacion y los demas como entrenamiento. Esto produce una estimacion mas estable cuando los datos son limitados.

| Variante | Descripcion | Ventaja | Desventaja |
| --- | --- | --- | --- |
| k-fold | divide en `k` partes | buen equilibrio | entrena `k` modelos |
| estratificada | conserva proporciones de clase | util en clases desbalanceadas | requiere etiquetas |
| leave-one-out | un caso por validacion | maximo uso de datos | costo alto |
| temporal | respeta orden cronologico | evita mirar el futuro | menos aleatoria |

En datos educativos con dimension temporal, la particion debe respetar el orden de eventos. Entrenar con informacion posterior para predecir eventos anteriores produce resultados irreales.

## 9. Metricas de evaluacion

Las metricas traducen desempeno en numeros. Elegir una metrica implica decidir que errores importan mas. En clasificacion binaria, exactitud puede ser enganosa si las clases estan desbalanceadas. Por eso se usan precision, recall, F1, AUC y matrices de confusion.

### 9.1 Matriz de confusion

La matriz de confusion resume aciertos y errores segun clase real y clase predicha.

| Real / Predicho | Positivo | Negativo |
| --- | ---: | ---: |
| Positivo | Verdadero positivo | Falso negativo |
| Negativo | Falso positivo | Verdadero negativo |

A partir de esta tabla se derivan varias metricas:

$$
Precision = \frac{TP}{TP + FP}
$$

$$
Recall = \frac{TP}{TP + FN}
$$

$$
F1 = 2 \cdot \frac{Precision \cdot Recall}{Precision + Recall}
$$

En un sistema de apoyo educativo, un falso negativo puede significar no detectar a un estudiante que necesita ayuda. Un falso positivo puede asignar apoyo innecesario. La importancia relativa depende de la intervencion.

### 9.2 Evaluacion en regresion

Para regresion se usan metricas como MAE, MSE y RMSE. MAE mide error absoluto promedio, mientras RMSE penaliza mas los errores grandes.

| Metrica | Formula | Sensibilidad | Uso comun |
| --- | --- | --- | --- |
| MAE | `mean(|y - y_hat|)` | lineal | interpretacion directa |
| MSE | `mean((y - y_hat)^2)` | alta a outliers | optimizacion matematica |
| RMSE | `sqrt(MSE)` | alta a outliers | misma unidad que `y` |
| R2 | proporcion de varianza explicada | depende del baseline | resumen global |

La evaluacion debe acompanarse con analisis de errores. Un promedio puede ocultar que el modelo funciona bien para un grupo y mal para otro.

## 10. Interpretabilidad y explicabilidad

La interpretabilidad se refiere a la facilidad con que una persona entiende el funcionamiento de un modelo. La explicabilidad busca producir razones o aproximaciones que aclaren una prediccion. En educacion, estas propiedades son importantes porque las decisiones pueden afectar trayectorias de aprendizaje.

Un modelo lineal con pocos atributos puede ser interpretable directamente. Una red neuronal profunda suele requerir metodos adicionales para explicar predicciones. Sin embargo, una explicacion aproximada no garantiza justicia ni validez pedagogica.

### 10.1 Explicaciones locales

Las explicaciones locales describen por que el modelo hizo una prediccion especifica. Pueden responder preguntas como: "Que variables hicieron que el sistema recomendara repasar fracciones?".

```text
Prediccion: necesita repaso de fracciones
Factores principales:
  - bajo desempeno en equivalencias
  - errores recientes en simplificacion
  - tiempo largo en ejercicios basicos
Accion sugerida:
  - actividad guiada con retroalimentacion inmediata
```

Este bloque debe conservar su formato, ya que la indentacion comunica una estructura de explicacion.

### 10.2 Explicaciones globales

Las explicaciones globales describen patrones generales del modelo. Por ejemplo, pueden indicar que el dominio de prerrequisitos pesa mas que el tiempo total en plataforma. Estas explicaciones ayudan a revisar si el modelo coincide con conocimiento experto.

Puntos clave para evaluar explicaciones:

- Una explicacion debe ser comprensible para su audiencia.
- Debe evitar presentar correlaciones como causalidad.
- Debe indicar incertidumbre cuando sea relevante.
- Debe poder contrastarse con casos reales.
- Debe documentar limitaciones del metodo usado.

## 11. Sesgo, equidad y responsabilidad

Un modelo puede reproducir sesgos presentes en datos historicos. Si ciertos estudiantes tuvieron menos acceso a recursos, sus registros pueden reflejar desigualdad estructural y no capacidad individual. Un sistema que aprende de esos datos sin analisis puede reforzar decisiones injustas.

La equidad en Machine Learning no se resuelve con una sola metrica. Requiere comprender contexto, grupos afectados, intervenciones disponibles y consecuencias. A veces mejorar una metrica global empeora resultados para un subgrupo.

### 11.1 Fuentes de sesgo

| Fuente | Descripcion | Ejemplo educativo | Posible mitigacion |
| --- | --- | --- | --- |
| Muestreo | poblacion no representativa | datos solo de escuelas urbanas | ampliar cobertura |
| Medicion | variable imperfecta | tiempo en pantalla como atencion | validar indicadores |
| Etiquetado | etiquetas inconsistentes | rubricas aplicadas distinto | calibrar evaluadores |
| Historico | desigualdad previa | acceso desigual a tutoria | auditar resultados |
| Implementacion | uso fuera de contexto | modelo usado para castigar | gobernanza clara |

El analisis de sesgo debe formar parte del ciclo de vida del modelo. No debe agregarse al final como requisito cosmetico.

### 11.2 Principios de uso responsable

> Un sistema predictivo en educacion debe apoyar decisiones humanas, no reemplazar el juicio pedagogico ni reducir a los estudiantes a una puntuacion.

Principios recomendados:

- Finalidad clara y comunicada.
- Consentimiento y proteccion de datos.
- Evaluacion por subgrupos relevantes.
- Supervision humana en decisiones sensibles.
- Mecanismos de apelacion o correccion.
- Monitoreo continuo despues del despliegue.

## 12. Flujo de trabajo de un proyecto de ML

Un proyecto de Machine Learning no empieza con elegir un algoritmo. Empieza con una pregunta y con la definicion de un resultado util. Despues se exploran datos, se preparan variables, se entrena un baseline, se evalua, se interpreta y se decide si el modelo aporta valor.

### 12.1 Ciclo basico

```python
def flujo_ml(datos):
    problema = definir_pregunta(datos)
    particiones = separar_datos(datos)
    caracteristicas = preparar_variables(particiones.entrenamiento)
    modelo = entrenar_baseline(caracteristicas)
    resultados = evaluar(modelo, particiones.validacion)
    reporte = documentar(resultados)
    return reporte
```

El codigo anterior no pretende ejecutarse como implementacion final. Su funcion pedagogica es mostrar las etapas de un ciclo reproducible.

### 12.2 Checklist de proyecto

- La pregunta predictiva esta escrita en lenguaje claro.
- La variable objetivo esta definida antes de entrenar.
- La particion de datos evita fuga temporal o institucional.
- Hay un baseline simple para comparar.
- Las metricas responden al uso educativo esperado.
- Los errores se revisan cualitativamente.
- El modelo se documenta con alcance y limitaciones.

## 13. Caso aplicado: recomendacion de practica personalizada

Supongamos una plataforma que recomienda ejercicios de algebra. El objetivo no es maximizar clics, sino seleccionar actividades que ayuden al estudiante a consolidar prerrequisitos y avanzar con dificultad adecuada.

Las entradas podrian incluir desempeno por tema, historial de errores, tiempo desde la ultima practica, nivel de dificultad de ejercicios previos y secuencia curricular. La salida podria ser una recomendacion entre varias actividades disponibles.

### 13.1 Definicion del problema

| Elemento | Decision del caso |
| --- | --- |
| Tarea | recomendar siguiente actividad |
| Unidad de prediccion | estudiante-tema-sesion |
| Objetivo | mejorar dominio conceptual |
| Etiqueta posible | mejora posterior en evaluacion corta |
| Restriccion | no repetir ejercicios ya dominados |
| Riesgo | encerrar al estudiante en tareas faciles |

Este caso muestra por que la definicion de etiqueta es dificil. Si se usa solo mejora inmediata, el sistema podria recomendar actividades faciles que producen ganancias rapidas pero superficiales.

### 13.2 Funcion de utilidad

Una funcion de utilidad educativa podria combinar aprendizaje esperado, diversidad y ajuste de dificultad.

$$
U(a, s) =
\lambda_1 \cdot aprendizaje\_esperado(a, s)
+ \lambda_2 \cdot diversidad(a)
- \lambda_3 \cdot frustracion\_estimada(a, s)
$$

La funcion anterior no es universal. Sirve para discutir que las recomendaciones no se optimizan solo por probabilidad de acierto.

## 14. Redes neuronales y representaciones

Las redes neuronales son modelos compuestos por capas de transformaciones parametrizadas. Cada capa recibe una representacion y produce otra. La profundidad permite construir representaciones jerarquicas, aunque tambien aumenta complejidad de entrenamiento e interpretacion.

Una neurona artificial simple calcula una combinacion lineal seguida de una funcion de activacion:

$$
h = \phi(w^Tx + b)
$$

Donde `\phi` puede ser ReLU, sigmoide u otra funcion no lineal. Sin no linealidades, muchas capas lineales equivaldrian a una sola transformacion lineal.

### 14.1 Embeddings

Un embedding representa objetos discretos, como palabras, ejercicios o estudiantes, mediante vectores densos. En educacion, embeddings pueden capturar similitud entre conceptos o patrones de interaccion. Sin embargo, tambien pueden codificar sesgos si se entrenan sobre datos historicos no revisados.

| Objeto | Representacion posible | Uso |
| --- | --- | --- |
| Palabra | vector semantico | analizar respuestas abiertas |
| Ejercicio | vector de dificultad y tema | recomendar practica |
| Concepto | vector curricular | conectar prerrequisitos |
| Estudiante | vector de estado de aprendizaje | personalizar secuencia |

Un embedding no es una explicacion por si mismo. Es una herramienta representacional que requiere interpretacion externa.

## 15. Modelos generativos y lenguaje

Los modelos generativos aprenden distribuciones que permiten producir texto, imagenes, audio u otros datos. En lenguaje, un modelo generativo estima la probabilidad de una secuencia de tokens y puede generar continuaciones plausibles.

$$
P(x_1, x_2, \dots, x_n) = \prod_{t=1}^{n} P(x_t \mid x_1, \dots, x_{t-1})
$$

Esta descomposicion expresa que la probabilidad de una secuencia se construye token por token. En aplicaciones educativas, los modelos de lenguaje pueden apoyar explicaciones, retroalimentacion y generacion de ejercicios, pero requieren verificacion.

### 15.1 Riesgos de modelos generativos

- Pueden producir respuestas fluidas pero incorrectas.
- Pueden inventar fuentes o justificar errores.
- Pueden reflejar sesgos del corpus de entrenamiento.
- Pueden no distinguir entre ayuda pedagogica y solucion directa.
- Pueden requerir guardrails para proteger datos personales.

El uso educativo responsable exige combinar generacion con evaluacion, trazabilidad y supervision humana.

## 16. Documentacion del modelo

La documentacion permite que otras personas entiendan para que sirve un modelo, como fue entrenado y bajo que condiciones no debe usarse. En proyectos educativos, la documentacion debe ser comprensible para perfiles tecnicos y pedagogicos.

Una ficha minima de modelo puede incluir:

| Campo | Pregunta |
| --- | --- |
| Proposito | Que decision apoya |
| Datos | De donde provienen los ejemplos |
| Poblacion | A quien representa |
| Metricas | Como se evaluo |
| Limitaciones | Donde puede fallar |
| Monitoreo | Que se revisara despues |

### 16.1 Ejemplo de ficha breve

```yaml
modelo: recomendador_practica_algebra
version: 0.3
proposito: sugerir ejercicios de practica
datos_entrenamiento:
  periodo: ciclo_2025_2026
  fuentes:
    - resultados_por_tema
    - intentos_de_ejercicios
    - retroalimentacion_docente
metricas:
  primaria: mejora_en_evaluacion_corta
  secundaria: tasa_de_abandono_de_actividad
restricciones:
  - no usar para calificacion final
  - requiere revision docente en casos de riesgo
```

Este bloque YAML debe llegar como Markdown de codigo, no como texto plano. Si se conserva, el editor puede mostrarlo como bloque estructurado.

## 17. Evaluacion cualitativa de errores

Las metricas cuantitativas deben complementarse con revision cualitativa. En educacion, un error puede revelar una concepcion alternativa, una instruccion ambigua o una falla del instrumento. Mirar solo el promedio impide aprender del comportamiento del modelo.

Una estrategia simple consiste en seleccionar ejemplos representativos:

- Aciertos de alta confianza.
- Errores de alta confianza.
- Casos cercanos al umbral de decision.
- Casos de subgrupos con menor desempeno.
- Casos reportados por docentes como problematicos.

Para cada caso se revisan entrada, prediccion, etiqueta, explicacion y decision pedagogica sugerida. Esta revision ayuda a corregir datos, redefinir objetivos o ajustar el uso del modelo.

## 18. Sintesis conceptual

Machine Learning es una disciplina tecnica, pero su aplicacion educativa exige juicio conceptual. No basta con entrenar modelos precisos. Es necesario preguntar que se esta midiendo, para quien funciona, que intervencion habilita y como se comunica la incertidumbre.

Los conceptos principales se pueden resumir asi:

| Concepto | Idea esencial | Pregunta de control |
| --- | --- | --- |
| Datos | evidencia disponible | representan el contexto real |
| Modelo | funcion ajustable | captura patrones utiles |
| Perdida | criterio de entrenamiento | penaliza lo que importa |
| Metrica | reporte de desempeno | refleja el uso previsto |
| Validacion | prueba de generalizacion | evita autoengano |
| Explicabilidad | comprension de decisiones | ayuda a actuar mejor |
| Responsabilidad | uso con consecuencias | protege a las personas |

La fase 2 del sistema debe poder convertir este documento en un grafo que preserve la estructura de lectura y mantenga el Markdown dentro de los nodos. Ese resultado permitira revisar no solo si el contenido fue dividido, sino si la informacion visual y formal se conserva.

## 19. Preguntas para revision

Estas preguntas sirven para evaluar si el lector comprendio la relacion entre los conceptos.

- Por que una metrica alta no garantiza que un modelo sea pedagogicamente apropiado?
- Que diferencia hay entre perdida de entrenamiento y metrica de evaluacion?
- Como podria ocurrir fuga de informacion en datos de una plataforma educativa?
- Por que una explicacion local no prueba causalidad?
- Que riesgos aparecen al usar modelos generativos para retroalimentacion automatica?

Las preguntas deben quedar como lista Markdown de revision. La agrupacion es relevante porque podria usarse para construir actividades o nodos de evaluacion.

## 20. Cierre operativo

Este documento combina definiciones, formulas, tablas, listas, citas, codigo y texto formal. Su extension es intencionalmente superior a otros documentos de prueba para presionar la segmentacion, la compactacion de chunks y la persistencia de `content_markdown`.

El resultado esperado para fase 2 es un grafo con secciones ordenadas, chunks suficientemente informativos y contenido Markdown preservado. Si una tabla aparece como texto continuo, si una formula pierde delimitadores o si un bloque de codigo pierde indentacion, el documento habra servido para detectar una falla importante.

Puntos finales de verificacion:

- El titulo principal debe detectarse como documento o seccion raiz.
- Las veinte secciones deben reflejar una secuencia pedagogica clara.
- Los chunks con tablas deben conservar tuberias y divisores.
- Los chunks con formulas deben conservar `$$`.
- Los chunks con codigo deben conservar fences e indentacion.
- Los chunks de texto puro deben llenar `content_markdown` con texto equivalente.

Con estas condiciones, `documento_prueba_fase_2.md` funciona como un caso cercano a materiales educativos reales de Machine Learning y como una prueba exigente para la nueva generacion de grafo.

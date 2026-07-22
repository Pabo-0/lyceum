# Laboratorio de modelos de aprendizaje

## 1. Objetivo del laboratorio

Este documento sirve como muestra amplia para validar que la interpretacion de documentos conserva Markdown dentro de los chunks del grafo. El contenido mezcla texto explicativo con bloques que deben renderizarse sin perder forma.

La meta principal es comprobar que las secciones quedan bien separadas y que cada nodo de contenido mantiene suficiente informacion para ser mostrado como Markdown en la interfaz de fase 2.

## 2. Modelo conceptual

El sistema organiza documentos como una jerarquia de documento, secciones y chunks. Cada chunk mantiene una vista textual para analisis y una vista Markdown para renderizado.

- Documento: representa el archivo completo.
- Seccion: representa encabezados detectados.
- Chunk: representa contenido que puede incluir parrafos, tablas, formulas o codigo.
- Relacion: conecta la lectura en el orden estructural.

La lista anterior debe permanecer como Markdown dentro de su chunk. Si el renderizador recibe el nodo, deberia mostrar viñetas reales y no una linea aplanada.

## 3. Tabla de variables

La siguiente tabla resume variables de prueba usadas para revisar que las columnas no se mezclen durante el procesamiento.

| Variable | Descripcion | Tipo | Ejemplo |
| --- | --- | --- | --- |
| `chunk_id` | Identificador del fragmento | texto | `chunk-12` |
| `content_markdown` | Contenido renderizable | markdown | `| a | b |` |
| `content_text` | Texto plano para busqueda | texto | `a b` |
| `word_count` | Conteo aproximado de palabras | numero | `128` |

Despues de esta tabla agregamos otro parrafo para forzar que el segmentador detecte el bloque y mantenga la tabla como parte del Markdown del nodo.

## 4. Formula de ponderacion

La fase 2 puede necesitar formulas educativas o metricas de ponderacion. Este bloque debe conservar delimitadores y saltos de linea.

$$
score(chunk) =
\alpha \cdot relevance(chunk) +
\beta \cdot novelty(chunk) -
\gamma \cdot redundancy(chunk)
$$

La formula anterior no debe convertirse en una sola linea sin delimitadores. Debe llegar al nodo con `$$` para que el frontend pueda renderizarla con KaTeX.

## 5. Ejemplo operativo

El siguiente bloque de codigo se incluye para verificar que los fences de Markdown no desaparezcan al guardar el contenido del chunk.

```python
def build_node_payload(chunk):
    return {
        "content_text": chunk.text,
        "content_markdown": chunk.markdown,
    }
```

El codigo esta seguido por texto normal. Esta combinacion ayuda a confirmar que el chunk que contiene codigo se conserva como bloque Markdown y que los parrafos vecinos siguen procesandose como texto simple.

## 6. Criterios de validacion

Para aceptar la generacion nueva, el grafo debe cumplir los siguientes criterios:

1. Las secciones principales deben convertirse en nodos `Section`.
2. Las tablas deben permanecer con tuberias y fila divisoria.
3. Las formulas deben conservar delimitadores de bloque.
4. Los chunks de texto puro deben llenar `content_markdown` con el mismo texto.
5. La compactacion puede fusionar chunks, pero debe unirlos con saltos dobles.

Estos criterios mezclan numeracion y contenido textual para asegurar que la segmentacion no dependa solamente de parrafos simples.

## 7. Nota de lectura

> Un nodo de lectura debe mostrar el conocimiento en la forma mas cercana posible a como fue escrito.
> Si el documento contenia estructura visual, esa estructura tambien comunica significado.

La cita anterior valida bloques de cita. Debe conservar el prefijo `>` dentro de Markdown para que el renderer pueda presentarla correctamente.

## 8. Cierre

Este documento tiene suficientes secciones para probar jerarquia, chunking y compactacion ligera. Tambien contiene varios tipos de Markdown dentro de chunks reales.

El resultado esperado es que `content_text` siga siendo util para busqueda y extraccion de conceptos, mientras `content_markdown` mantenga la informacion visual necesaria para el nodo.

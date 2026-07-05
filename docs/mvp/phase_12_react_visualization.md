# Fase 12: Visualizacion en React

## Objetivo

Mostrar el grafo generado en una interfaz web interactiva.

El frontend permite seleccionar documentos procesados, subir nuevos `.txt` o `.md`, ejecutar el pipeline mediante Django y explorar el grafo resultante visualmente.

## Funciones implementadas

- Listar documentos existentes desde `GET /documents/`.
- Subir archivos `.txt` o `.md` usando `POST /documents/`.
- Cargar el grafo de un documento desde `GET /documents/<document_id>/graph/`.
- Dibujar nodos y relaciones en SVG.
- Diferenciar nodos visibles por tipo:
  - `Document`
  - `Section`
  - `Chunk`
  - `Concept`
- Diferenciar relaciones visibles por tipo:
  - `DIRECTIONAL`: flecha simple.
  - `BIDIRECTIONAL`: doble flecha.
  - `SEMANTIC`: linea punteada.
- Ocultar o mostrar la leyenda de nodos y conexiones.
- Ocultar o mostrar chunks/parrafos.
- Seleccionar nodos y relaciones para ver detalles.
- Centrar el grafo en secciones o parrafos.
- Hacer zoom y recentrar el canvas.
- Mostrar el grafo compacto generado para lectura, no la estructura cruda completa.
- Alternar entre modo lectura y modo edicion.
- En modo edicion, crear, renombrar, fusionar, conectar y eliminar elementos del grafo.

## Flujo de datos

```text
React
  -> /api/documents/
  -> Vite proxy
  -> Django /documents/
  -> document_processing pipeline
  -> data/storage/documents/<document_id>/
  -> graph.json + neo4j.cypher
  -> React graph view
```

## Archivos principales

```text
frontend/src/App.jsx
frontend/src/api/client.js
frontend/src/components/DocumentSidebar.jsx
frontend/src/components/GraphControls.jsx
frontend/src/components/GraphCanvas.jsx
frontend/src/components/GraphEditorPanel.jsx
frontend/src/components/NodeContentPopover.jsx
frontend/src/utils/graphModel.js
frontend/src/styles.css
```

## Configuracion

Variables locales:

```text
frontend/.env
```

Plantilla versionable:

```text
frontend/.env.example
```

Variables actuales:

```env
VITE_APP_NAME=Lyceum
VITE_API_BASE_URL=/api
VITE_BACKEND_URL=http://127.0.0.1:8000
VITE_DEV_PORT=5173
```

## Comandos

Terminal 1:

```powershell
.\.venv\Scripts\Activate.ps1
python backend/manage.py runserver
```

Terminal 2:

```powershell
cd frontend
pnpm install
pnpm dev
```

Abrir:

```text
http://localhost:5173
```

## Decision clave

El grafo visible del MVP es un grafo de lectura, no un grafo de conceptos. Los archivos de conceptos y relaciones semanticas se siguen guardando para investigacion futura, pero no se muestran al usuario porque agregan ruido antes de tener una capa semantica confiable.

El grafo visible tambien es una version compactada de la estructura documental. Si un documento tiene muchos encabezados o parrafos pequenos, el backend agrupa secciones cercanas y chunks de contenido para que el numero de nodos crezca de forma proporcional al tamano real del texto.

El modo edicion esta separado del modo lectura para que las herramientas de modificacion no contaminen la exploracion normal. Las ediciones viajan a Django y se guardan en `graph.json`.

El grafo se dibuja con SVG propio en esta fase. Esto mantiene el MVP ligero y deja el modelo de datos claro. Cuando el grafo crezca mucho, se puede reemplazar `GraphCanvas.jsx` por una libreria especializada sin cambiar la API ni el resto del frontend.

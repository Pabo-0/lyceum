import { useEffect, useRef, useState } from 'react';

import MarkdownRenderer, {
  markdownToContentDocument,
  markdownToPlainText,
} from '../components/MarkdownRenderer.jsx';
import { NODE_STYLES, getNodeTitle, getPrimaryLabel } from '../utils/graphModel.js';
import { getNodeContent } from '../utils/nodeContent.js';

export default function NodeContentPage({
  node,
  onBack,
  onUpdateNode,
}) {
  const [content, setContent] = useState(getNodeContent(node));
  const [isEditing, setIsEditing] = useState(false);
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');
  const editorRef = useRef(null);
  const lastSavedContentRef = useRef(getNodeContent(node));

  const nodeType = getPrimaryLabel(node);
  const nodeTypeStyle = NODE_STYLES[nodeType] || NODE_STYLES.Content;

  useEffect(() => {
    const nextContent = getNodeContent(node);
    setContent(nextContent);
    lastSavedContentRef.current = nextContent;
    setIsEditing(false);
    setStatus('');
    setError('');
  }, [node?.node_id]);

  useEffect(() => {
    if (!isEditing) return;
    editorRef.current?.focus();
  }, [isEditing]);

  if (!node) {
    return (
      <section className="node-content-page" aria-label="Contenido del nodo">
        <div className="node-content-document">
          <button className="secondary-button node-content-back" onClick={onBack} type="button">
            Volver al grafo
          </button>
          <p className="muted">No se encontro el nodo seleccionado.</p>
        </div>
      </section>
    );
  }

  async function saveContent(nextContent = content) {
    const contentMarkdown = String(nextContent || '');
    if (contentMarkdown === lastSavedContentRef.current) return true;

    try {
      setError('');
      setStatus('Guardando...');
      const contentText = markdownToPlainText(contentMarkdown);
      await onUpdateNode(node.node_id, {
        properties: {
          text: contentText,
          content_json: markdownToContentDocument(contentMarkdown),
          content_markdown: contentMarkdown,
          content_text: contentText,
          content_version: 1,
        },
      });
      lastSavedContentRef.current = contentMarkdown;
      setStatus('Guardado.');
      return true;
    } catch (err) {
      setStatus('');
      setError(err.message);
      return false;
    }
  }

  async function toggleEditing() {
    if (isEditing) {
      const saved = await saveContent();
      if (!saved) return;
      setIsEditing(false);
      return;
    }
    setIsEditing(true);
  }

  async function handleBack() {
    if (isEditing) {
      const saved = await saveContent();
      if (!saved) return;
    }
    onBack();
  }

  return (
    <section className="node-content-page" aria-label="Contenido del nodo">
      <article className="node-content-document">
        <nav className="node-content-toolbar" aria-label="Navegacion del contenido">
          <button className="secondary-button node-content-back" onClick={handleBack} type="button">
            Volver al grafo
          </button>
          <button className="secondary-button node-content-mode-button" onClick={toggleEditing} type="button">
            {isEditing ? 'Leer' : 'Editar'}
          </button>
        </nav>

        <header className="node-content-header">
          <h1>{getNodeTitle(node)}</h1>
          <span className="node-type-tag node-content-type-tag" style={{ '--node-type-color': nodeTypeStyle.color }}>
            <span className="node-type-dot" />
            {nodeTypeStyle.label || nodeType}
          </span>
        </header>

        <main className="node-content-body">
          {status ? <p className="graph-edit-status">{status}</p> : null}
          {error ? <p className="graph-edit-error">{error}</p> : null}

          {isEditing ? (
            <textarea
              aria-label="Editar contenido Markdown"
              className="node-content-source-editor"
              onBlur={() => saveContent()}
              onChange={(event) => setContent(event.target.value)}
              placeholder="Escribe Markdown: # Titulo, - punto, $$ formula $$..."
              ref={editorRef}
              rows="24"
              value={content}
            />
          ) : (
            <div className="node-content-preview">
              <MarkdownRenderer markdown={content} />
            </div>
          )}
        </main>
      </article>
    </section>
  );
}

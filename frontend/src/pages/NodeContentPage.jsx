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
  const [titleDraft, setTitleDraft] = useState(getNodeTitle(node));
  const [isEditing, setIsEditing] = useState(false);
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');
  const editorRef = useRef(null);
  const titleRef = useRef(null);
  const lastSavedContentRef = useRef(getNodeContent(node));
  const lastSavedTitleRef = useRef(getNodeTitle(node));

  const nodeType = getPrimaryLabel(node);
  const nodeTypeStyle = NODE_STYLES[nodeType] || NODE_STYLES.Content;

  useEffect(() => {
    const nextContent = getNodeContent(node);
    const nextTitle = getNodeTitle(node);
    setContent(nextContent);
    setTitleDraft(nextTitle);
    lastSavedContentRef.current = nextContent;
    lastSavedTitleRef.current = nextTitle;
    setIsEditing(false);
    setStatus('');
    setError('');
  }, [node?.node_id]);

  useEffect(() => {
    if (!isEditing) return;
    editorRef.current?.focus();
    resizeContentEditor(editorRef.current);
  }, [isEditing]);

  useEffect(() => {
    if (!isEditing) return;
    resizeTitleEditor(titleRef.current);
  }, [isEditing, titleDraft]);

  useEffect(() => {
    if (!isEditing) return;
    resizeContentEditor(editorRef.current);
  }, [isEditing, content]);

  if (!node) {
    return (
      <section className="node-content-page" aria-label="Contenido del nodo">
        <div className="node-content-document">
          <button aria-label="Volver al grafo" className="secondary-button node-content-back" onClick={onBack} title="Volver al grafo" type="button">
            <BackIcon />
          </button>
          <p className="muted">No se encontro el nodo seleccionado.</p>
        </div>
      </section>
    );
  }

  async function saveContent(nextContent = content, nextTitle = titleDraft) {
    const contentMarkdown = String(nextContent || '');
    const title = String(nextTitle || '').trim() || getNodeTitle(node);
    if (
      contentMarkdown === lastSavedContentRef.current &&
      title === lastSavedTitleRef.current
    ) {
      return true;
    }

    try {
      setError('');
      setStatus('Guardando...');
      const contentText = markdownToPlainText(contentMarkdown);
      await onUpdateNode(node.node_id, {
        properties: {
          title,
          text: contentText,
          content_json: markdownToContentDocument(contentMarkdown),
          content_markdown: contentMarkdown,
          content_text: contentText,
          content_version: 1,
        },
      });
      lastSavedContentRef.current = contentMarkdown;
      lastSavedTitleRef.current = title;
      setTitleDraft(title);
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
          <button aria-label="Volver al grafo" className="secondary-button node-content-back" onClick={handleBack} title="Volver al grafo" type="button">
            <BackIcon />
          </button>
          <button
            aria-label={isEditing ? 'Ver lectura' : 'Editar contenido'}
            className="secondary-button node-content-mode-button"
            onClick={toggleEditing}
            title={isEditing ? 'Ver lectura' : 'Editar contenido'}
            type="button"
          >
            {isEditing ? <ReadIcon /> : <PencilIcon />}
          </button>
        </nav>

        <header className="node-content-header">
          {isEditing ? (
            <textarea
              aria-label="Editar titulo del nodo"
              className="node-content-title-input"
              onBlur={() => saveContent(content, titleDraft)}
              onChange={(event) => setTitleDraft(event.target.value)}
              ref={titleRef}
              rows={1}
              value={titleDraft}
            />
          ) : (
            <h1>{titleDraft || getNodeTitle(node)}</h1>
          )}
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
              rows={1}
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

function resizeTitleEditor(element) {
  if (!element) return;
  element.style.height = 'auto';
  element.style.height = `${element.scrollHeight}px`;
}

function resizeContentEditor(element) {
  if (!element) return;
  element.style.height = 'auto';
  element.style.height = `${element.scrollHeight}px`;
}

function BackIcon() {
  return (
    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24">
      <path d="M15 6 9 12l6 6" />
    </svg>
  );
}

function PencilIcon() {
  return (
    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24">
      <path d="m15.5 5.5 3 3" />
      <path d="M4 20l3.4-.7L18.5 8.2a2.1 2.1 0 0 0-3-3L4.4 16.3 4 20Z" />
    </svg>
  );
}

function ReadIcon() {
  return (
    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24">
      <path d="M4 6.5c2.8-1.2 5.4-1 8 .6 2.6-1.6 5.2-1.8 8-.6v12c-2.8-1.2-5.4-1-8 .6-2.6-1.6-5.2-1.8-8-.6v-12Z" />
      <path d="M12 7.1v12" />
    </svg>
  );
}

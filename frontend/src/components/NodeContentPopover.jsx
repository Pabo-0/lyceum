import { getNodeTitle } from '../utils/graphModel.js';

export default function NodeContentPopover({ node, onClose }) {
  const content = getNodeContent(node);
  const paragraphs = splitContent(content);

  if (!node || !content) return null;

  return (
    <aside className="node-reader-overlay" aria-label="Contenido del nodo">
      <article className="node-reader-page">
        <header className="node-reader-header">
          <button className="node-reader-back" onClick={onClose} type="button">
            Volver al grafo
          </button>
          <h2>{getNodeTitle(node)}</h2>
        </header>

        <div className="node-reader-body">
          {paragraphs.map((paragraph, index) => (
            <p key={`${node.node_id}-paragraph-${index}`}>{paragraph}</p>
          ))}
        </div>
      </article>
    </aside>
  );
}

function getNodeContent(node) {
  const properties = node?.properties || {};
  return properties.text || properties.content || properties.body || '';
}

function splitContent(content) {
  return String(content || '')
    .split(/\n{2,}/)
    .map((paragraph) => paragraph.trim())
    .filter(Boolean);
}

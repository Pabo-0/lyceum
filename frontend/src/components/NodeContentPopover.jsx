import { NODE_STYLES, getNodeTitle, getPrimaryLabel } from '../utils/graphModel.js';
import { getNodeContent, isDedicatedContentNode } from '../utils/nodeContent.js';
import MarkdownRenderer from './MarkdownRenderer.jsx';

export default function NodeContentPopover({ node, onClose }) {
  const content = getNodeContent(node);
  const nodeType = getPrimaryLabel(node);
  const nodeTypeStyle = NODE_STYLES[nodeType] || NODE_STYLES.Content;

  if (!node || !content || isDedicatedContentNode(node)) return null;

  return (
    <aside className="node-reader-overlay" aria-label="Contenido del nodo">
      <article className="node-reader-page">
        <header className="node-reader-header">
          <button aria-label="Cerrar" className="node-reader-close" onClick={onClose} type="button">
            X
          </button>
          <div className="node-reader-heading">
            <h2>{getNodeTitle(node)}</h2>
            <span className="node-type-tag node-reader-type-tag" style={{ '--node-type-color': nodeTypeStyle.color }}>
              <span className="node-type-dot" />
              {nodeTypeStyle.label || nodeType}
            </span>
          </div>
        </header>

        <div className="node-reader-body">
          <MarkdownRenderer markdown={content} />
        </div>
      </article>
    </aside>
  );
}

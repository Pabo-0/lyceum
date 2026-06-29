import { useEffect, useState } from 'react';

export default function DocumentSidebar({
  appName,
  documents,
  isHome,
  onNewDocument,
  selectedDocumentId,
  onSelectDocument,
  onToggleTheme,
  status,
  theme,
}) {
  const [isCollapsed, setIsCollapsed] = useState(false);
  const recentDocuments = documents.slice(0, 5);

  useEffect(() => {
    const query = window.matchMedia('(max-width: 860px)');
    setIsCollapsed(query.matches);

    function handleChange(event) {
      setIsCollapsed(event.matches);
    }

    query.addEventListener('change', handleChange);
    return () => query.removeEventListener('change', handleChange);
  }, []);

  return (
    <aside
      className={isCollapsed ? 'sidebar collapsed' : 'sidebar'}
      aria-label="Navegacion de documentos"
    >
      <div className="sidebar-panel">
        <div className="sidebar-brand">
          <button
            aria-label="Ir al inicio"
            className="brand-button"
            onClick={onNewDocument}
            type="button"
          >
            <span className="brand-mark">L</span>
            <span>
              <strong>{appName}</strong>
              <small>Knowledge Graph</small>
            </span>
          </button>

          <button
            aria-label="Ocultar biblioteca"
            className="icon-button"
            onClick={() => setIsCollapsed(true)}
            title="Ocultar biblioteca"
            type="button"
          >
            &lt;
          </button>
        </div>

        <button
          className={isHome ? 'new-document-button disabled' : 'new-document-button active'}
          disabled={isHome}
          onClick={onNewDocument}
          type="button"
        >
          <span>+</span>
          Nuevo documento
        </button>

        <section className="sidebar-section">
          <div className="section-heading">
            <p className="eyebrow">Biblioteca</p>
          </div>

          <div className="document-scroll">
            {documents.length === 0 ? (
              <p className="muted">No hay documentos procesados.</p>
            ) : null}
            {documents.map((document) => (
              <DocumentButton
                document={document}
                isSelected={document.document_id === selectedDocumentId}
                key={document.document_id}
                onSelectDocument={onSelectDocument}
              />
            ))}
          </div>
        </section>

        <div className="sidebar-footer">
          <button
            aria-label="Alternar modo oscuro"
            className="theme-toggle"
            onClick={onToggleTheme}
            title="Alternar modo oscuro"
            type="button"
          >
            <span>{theme === 'dark' ? 'Claro' : 'Oscuro'}</span>
            <span className="theme-switch" aria-hidden="true">
              <span />
            </span>
          </button>
        </div>
      </div>

      <button
        aria-label="Mostrar biblioteca"
        className="sidebar-rail"
        onClick={() => setIsCollapsed(false)}
        title="Mostrar biblioteca"
        type="button"
      >
        <span className="brand-mark">L</span>
        <span>&gt;</span>
      </button>
    </aside>
  );
}

function DocumentButton({ document, isSelected, onSelectDocument }) {
  return (
    <button
      className={isSelected ? 'document-button selected' : 'document-button'}
      onClick={() => onSelectDocument(document.document_id)}
      type="button"
    >
      <span>{document.title}</span>
    </button>
  );
}

function statusLabel(status) {
  if (status === 'loading') return 'Conectando';
  if (status === 'processing') return 'Procesando';
  if (status === 'error') return 'Error';
  return 'API lista';
}

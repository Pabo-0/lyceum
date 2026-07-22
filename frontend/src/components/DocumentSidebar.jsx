import { useEffect, useRef, useState } from 'react';

export default function DocumentSidebar({
  appName,
  documents,
  isHome,
  isSettings,
  onDeleteDocument,
  onNewDocument,
  onOpenAccount,
  onOpenSettings,
  onRenameDocument,
  selectedDocumentId,
  onSelectDocument,
  session,
}) {
  const [isCollapsed, setIsCollapsed] = useState(false);
  const isGuest = Boolean(session?.isGuest);

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
                isSelected={!isSettings && getSidebarDocumentId(document) === selectedDocumentId}
                key={getSidebarDocumentId(document)}
                onDeleteDocument={onDeleteDocument}
                onRenameDocument={onRenameDocument}
                onSelectDocument={onSelectDocument}
              />
            ))}
          </div>
        </section>

        <div className="sidebar-footer">
          {isGuest ? (
            <button
              aria-label="Iniciar sesion"
              className="account-entry-button"
              onClick={onOpenAccount}
              type="button"
            >
              <LoginIcon />
              <span>
                <strong>Iniciar sesion</strong>
                <small>Usa tu propio workspace</small>
              </span>
            </button>
          ) : (
            <div className="workspace-summary">
              <span className="workspace-avatar">{getInitial(session?.user?.username)}</span>
              <span>
                <strong>{session?.workspace?.name}</strong>
                <small>{session?.user?.email}</small>
              </span>
            </div>
          )}
          <button
            aria-label="Abrir ajustes"
            className={isSettings ? 'settings-button selected' : 'settings-button'}
            onClick={onOpenSettings}
            title="Ajustes"
            type="button"
          >
            <SettingsIcon />
            <span>Ajustes</span>
          </button>
        </div>
      </div>

      <div className="sidebar-rail" aria-label="Navegacion compacta">
        <button
          aria-label="Mostrar biblioteca"
          className="rail-toggle-button"
          onClick={() => setIsCollapsed(false)}
          title="Mostrar biblioteca"
          type="button"
        >
          <span className="brand-mark">L</span>
          <span>&gt;</span>
        </button>
        <span className="rail-spacer" />
        <button
          aria-label="Abrir ajustes"
          className={isSettings ? 'rail-settings-button selected' : 'rail-settings-button'}
          onClick={(event) => {
            event.stopPropagation();
            onOpenSettings();
          }}
          title="Ajustes"
          type="button"
        >
          <SettingsIcon />
        </button>
      </div>
    </aside>
  );
}

function SettingsIcon() {
  return (
    <svg aria-hidden="true" className="settings-icon" focusable="false" viewBox="0 0 24 24">
      <circle cx="12" cy="12" r="3" />
      <path
        d="M19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 0 1 0 2.8 2 2 0 0 1-2.8 0l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.2a1.7 1.7 0 0 0-1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 0 1-2.8 0 2 2 0 0 1 0-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.2a1.7 1.7 0 0 0 1.5-1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 0 1 0-2.8 2 2 0 0 1 2.8 0l.1.1a1.7 1.7 0 0 0 1.8.3h.1a1.7 1.7 0 0 0 1-1.5V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.2a1.7 1.7 0 0 0 1 1.5 1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 0 1 2.8 0 2 2 0 0 1 0 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8v.1a1.7 1.7 0 0 0 1.5 1h.2a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.2a1.7 1.7 0 0 0-1.5.9Z"
      />
    </svg>
  );
}

function LoginIcon() {
  return (
    <svg aria-hidden="true" className="settings-icon" focusable="false" viewBox="0 0 24 24">
      <path d="M14 7l5 5-5 5" />
      <path d="M19 12H7" />
      <path d="M3 3v18" />
    </svg>
  );
}

function DocumentButton({
  document,
  isSelected,
  onDeleteDocument,
  onRenameDocument,
  onSelectDocument,
}) {
  const documentId = getSidebarDocumentId(document);
  const documentTitle = document.title || document.file_name || document.name || 'Documento';
  const inputRef = useRef(null);
  const isSavingRef = useRef(false);
  const isCancelingRef = useRef(false);
  const [isEditing, setIsEditing] = useState(false);
  const [titleDraft, setTitleDraft] = useState(documentTitle);
  const [isSaving, setIsSaving] = useState(false);

  useEffect(() => {
    setTitleDraft(documentTitle);
  }, [documentTitle]);

  useEffect(() => {
    if (!isEditing) return;
    inputRef.current?.focus();
    inputRef.current?.select();
  }, [isEditing]);

  async function saveTitle() {
    if (isSavingRef.current || isCancelingRef.current) return;
    const nextTitle = titleDraft.trim();
    if (!nextTitle || nextTitle === documentTitle) {
      setTitleDraft(documentTitle);
      setIsEditing(false);
      return;
    }

    try {
      isSavingRef.current = true;
      setIsSaving(true);
      await onRenameDocument(documentId, nextTitle);
      setIsEditing(false);
    } finally {
      isSavingRef.current = false;
      setIsSaving(false);
    }
  }

  function cancelEditing() {
    isCancelingRef.current = true;
    setTitleDraft(documentTitle);
    setIsEditing(false);
    window.setTimeout(() => {
      isCancelingRef.current = false;
    }, 0);
  }

  return (
    <div className={isSelected ? 'document-item selected' : 'document-item'}>
      {isEditing ? (
        <form
          className="document-rename-form"
          onSubmit={(event) => {
            event.preventDefault();
            saveTitle();
          }}
        >
          <input
            aria-label={`Nuevo nombre para ${documentTitle}`}
            disabled={isSaving}
            onBlur={saveTitle}
            onChange={(event) => setTitleDraft(event.target.value)}
            onKeyDown={(event) => {
              if (event.key === 'Escape') {
                event.preventDefault();
                cancelEditing();
              }
            }}
            ref={inputRef}
            type="text"
            value={titleDraft}
          />
        </form>
      ) : (
        <button
          className="document-button"
          onClick={() => onSelectDocument(documentId)}
          onDoubleClick={(event) => {
            event.preventDefault();
            event.stopPropagation();
            setIsEditing(true);
          }}
          title="Doble click para renombrar"
          type="button"
        >
          <span>{documentTitle}</span>
        </button>
      )}
      <button
        aria-label={`Borrar ${documentTitle}`}
        className="document-delete-button"
        disabled={isEditing || isSaving}
        onClick={(event) => {
          event.stopPropagation();
          onDeleteDocument(document);
        }}
        title="Borrar grafo"
        type="button"
      >
        <TrashIcon />
      </button>
    </div>
  );
}

function getSidebarDocumentId(document) {
  return (
    document?.document_id ||
    document?.id ||
    document?.metadata?.document_id ||
    document?.metadata?.id ||
    ''
  );
}

function getInitial(value = '') {
  return value.trim().slice(0, 1).toUpperCase() || 'L';
}

function TrashIcon() {
  return (
    <svg aria-hidden="true" className="trash-icon" focusable="false" viewBox="0 0 24 24">
      <path d="M4 7h16" />
      <path d="M10 11v6" />
      <path d="M14 11v6" />
      <path d="M6 7l1 14h10l1-14" />
      <path d="M9 7V4h6v3" />
    </svg>
  );
}

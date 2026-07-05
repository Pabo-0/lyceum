export default function DocumentDeleteDialog({
  document,
  isDeleting = false,
  onCancel,
  onConfirm,
}) {
  if (!document) return null;

  const title = document.title || 'Documento sin titulo';

  return (
    <aside
      aria-label="Confirmar borrado del grafo"
      className="document-delete-overlay"
      role="dialog"
      aria-modal="true"
    >
      <article className="document-delete-dialog">
        <header>
          <h2>Borrar grafo</h2>
          <p>
            Se borrara "{title}" junto con su grafo, nodos, relaciones y archivos
            procesados guardados en el backend.
          </p>
        </header>

        <footer>
          <button
            className="secondary-button"
            disabled={isDeleting}
            onClick={onCancel}
            type="button"
          >
            Cancelar
          </button>
          <button
            className="danger-button"
            disabled={isDeleting}
            onClick={onConfirm}
            type="button"
          >
            {isDeleting ? 'Borrando...' : 'Borrar definitivamente'}
          </button>
        </footer>
      </article>
    </aside>
  );
}

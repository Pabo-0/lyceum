export default function AccountDeleteDialog({
  isDeleting = false,
  onCancel,
  onConfirm,
  session,
}) {
  if (!session) return null;

  const username = session.user?.username || 'esta cuenta';

  return (
    <aside
      aria-label="Confirmar borrado de la cuenta"
      aria-modal="true"
      className="document-delete-overlay"
      role="dialog"
    >
      <article className="document-delete-dialog">
        <header>
          <h2>Borrar cuenta</h2>
          <p>
            Se borrara la cuenta de {username} junto con su workspace, documentos,
            grafos, nodos, relaciones e informacion guardada. Esta accion no se
            podra recuperar.
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

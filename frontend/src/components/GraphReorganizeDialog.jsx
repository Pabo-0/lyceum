export default function GraphReorganizeDialog({
  isOpen = false,
  isReorganizing = false,
  onCancel,
  onConfirm,
}) {
  if (!isOpen) return null;

  return (
    <aside
      aria-label="Confirmar reorganizacion del grafo"
      aria-modal="true"
      className="document-delete-overlay"
      role="dialog"
    >
      <article className="document-delete-dialog">
        <header>
          <h2>Reorganizar grafo</h2>
          <p>
            Se perdera la acomodacion manual actual de los nodos y el grafo
            volvera a organizarse con la sugerencia del programa. Esta accion no
            tiene vuelta atras.
          </p>
        </header>

        <footer>
          <button
            className="secondary-button"
            disabled={isReorganizing}
            onClick={onCancel}
            type="button"
          >
            Cancelar
          </button>
          <button
            className="danger-button"
            disabled={isReorganizing}
            onClick={onConfirm}
            type="button"
          >
            {isReorganizing ? 'Reorganizando...' : 'Reorganizar definitivamente'}
          </button>
        </footer>
      </article>
    </aside>
  );
}

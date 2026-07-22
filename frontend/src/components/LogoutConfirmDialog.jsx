export default function LogoutConfirmDialog({
  isOpen = false,
  onCancel,
  onConfirm,
}) {
  if (!isOpen) return null;

  return (
    <aside
      aria-label="Confirmar cierre de sesion"
      aria-modal="true"
      className="logout-confirm-overlay"
      role="dialog"
    >
      <article className="logout-confirm-dialog">
        <header>
          <h2>Cerrar sesion</h2>
          <p>Confirma si quieres cerrar esta sesion y volver al workspace huesped.</p>
        </header>

        <footer>
          <button className="secondary-button" onClick={onCancel} type="button">
            Cancelar
          </button>
          <button className="primary-button" onClick={onConfirm} type="button">
            Cerrar sesion
          </button>
        </footer>
      </article>
    </aside>
  );
}

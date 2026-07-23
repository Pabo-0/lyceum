export default function ConfirmDialog({
  ariaLabel,
  cancelLabel = 'Cancelar',
  confirmLabel,
  confirmVariant = 'danger',
  eyebrow,
  isOpen = true,
  isPending = false,
  message,
  onCancel,
  onConfirm,
  pendingLabel,
  title,
}) {
  if (!isOpen) return null;

  const titleId = 'confirm-dialog-title';
  const confirmClassName = confirmVariant === 'primary' ? 'primary-button' : 'danger-button';
  const footerClassName = confirmLabel
    ? 'confirmation-dialog-actions'
    : 'confirmation-dialog-actions confirmation-dialog-actions-single';

  return (
    <aside
      aria-label={ariaLabel || title}
      aria-modal="true"
      className="document-delete-overlay"
      role="dialog"
    >
      <article className="document-delete-dialog">
        <header>
          {eyebrow ? <p className="eyebrow">{eyebrow}</p> : null}
          <h2 id={titleId}>{title}</h2>
        </header>

        <div className="confirmation-dialog-body">
          {typeof message === 'string' ? <p>{message}</p> : message}
        </div>

        <footer className={footerClassName}>
          <button className="secondary-button" disabled={isPending} onClick={onCancel} type="button">
            {cancelLabel}
          </button>
          {confirmLabel ? (
            <button className={confirmClassName} disabled={isPending} onClick={onConfirm} type="button">
              {isPending && pendingLabel ? pendingLabel : confirmLabel}
            </button>
          ) : null}
        </footer>
      </article>
    </aside>
  );
}

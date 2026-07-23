import ConfirmDialog from './ConfirmDialog.jsx';

export default function LogoutConfirmDialog({
  isOpen = false,
  onCancel,
  onConfirm,
}) {
  if (!isOpen) return null;

  return (
    <ConfirmDialog
      ariaLabel="Confirmar cierre de sesion"
      confirmLabel="Cerrar sesion"
      confirmVariant="primary"
      isOpen={isOpen}
      message="Confirma si quieres cerrar esta sesion y volver al workspace huesped."
      onCancel={onCancel}
      onConfirm={onConfirm}
      title="Cerrar sesion"
    />
  );
}

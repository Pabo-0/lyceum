import ConfirmDialog from './ConfirmDialog.jsx';

export default function AccountDeleteDialog({
  isDeleting = false,
  onCancel,
  onConfirm,
  session,
}) {
  if (!session) return null;

  const username = session.user?.username || 'esta cuenta';

  return (
    <ConfirmDialog
      ariaLabel="Confirmar borrado de la cuenta"
      confirmLabel="Borrar definitivamente"
      isPending={isDeleting}
      message={`Se borrara la cuenta de ${username} junto con su workspace, documentos, grafos, nodos, relaciones e informacion guardada. Esta accion no se podra recuperar.`}
      onCancel={onCancel}
      onConfirm={onConfirm}
      pendingLabel="Borrando..."
      title="Borrar cuenta"
    />
  );
}

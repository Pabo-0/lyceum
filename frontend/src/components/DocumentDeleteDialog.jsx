import ConfirmDialog from './ConfirmDialog.jsx';

export default function DocumentDeleteDialog({
  document,
  isDeleting,
  onCancel,
  onConfirm,
}) {
  if (!document) return null;

  const title = document.title || document.file_name || document.name || 'este grafo';

  return (
    <ConfirmDialog
      ariaLabel="Confirmar borrado del grafo"
      confirmLabel="Borrar definitivamente"
      eyebrow="Borrar grafo"
      isPending={isDeleting}
      message={`Vas a borrar "${title}" de tu biblioteca. Se perdera el grafo, sus nodos, conexiones, contenido asociado y posiciones guardadas. Esta accion no se puede deshacer.`}
      onCancel={onCancel}
      onConfirm={onConfirm}
      pendingLabel="Borrando..."
      title="Confirmar eliminacion"
    />
  );
}

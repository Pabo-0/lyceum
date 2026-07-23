import ConfirmDialog from './ConfirmDialog.jsx';

export default function GraphReorganizeDialog({
  isOpen = false,
  isReorganizing = false,
  onCancel,
  onConfirm,
}) {
  if (!isOpen) return null;

  return (
    <ConfirmDialog
      ariaLabel="Confirmar reorganizacion del grafo"
      confirmLabel="Reorganizar definitivamente"
      isPending={isReorganizing}
      message="Se perdera la acomodacion manual actual de los nodos y el grafo volvera a organizarse con la sugerencia del programa. Esta accion no tiene vuelta atras."
      onCancel={onCancel}
      onConfirm={onConfirm}
      pendingLabel="Reorganizando..."
      title="Reorganizar grafo"
    />
  );
}

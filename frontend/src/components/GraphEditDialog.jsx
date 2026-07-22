import { useEffect, useMemo, useRef, useState } from 'react';

import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
  getNodeTitle,
  getPrimaryLabel,
  getRelationshipLabel,
  getVisualRelationshipType,
} from '../utils/graphModel.js';

const CREATABLE_NODE_TYPES = ['Section', 'Content', 'Concept'];
const EDITABLE_NODE_TYPES = ['Section', 'Chunk', 'Content', 'Concept'];
const RELATIONSHIP_TYPES = Object.keys(RELATIONSHIP_STYLES);

export default function GraphEditDialog({
  action,
  graph,
  onClose,
  onCreateNode,
  onUpdateNode,
  onDeleteNode,
  onCreateRelationship,
  onUpdateRelationship,
  onDeleteRelationship,
  onNodePositionChange,
}) {
  const nodes = graph?.nodes || [];
  const relationships = graph?.relationships || [];
  const node = action?.kind === 'node'
    ? nodes.find((candidate) => candidate.node_id === action.nodeId)
    : null;
  const relationship = action?.kind === 'relationship'
    ? relationships.find((candidate) => candidate.relationship_id === action.relationshipId)
    : null;

  if (!action) return null;

  return (
    <aside className="graph-edit-overlay" aria-label="Editor del grafo">
      <article className="graph-edit-dialog">
        {action.kind === 'create-node' ? (
          <NodeForm
            actionLabel="Crear nodo"
            initialType="Section"
            mode="create"
            onClose={onClose}
            onSubmit={async (payload) => {
              const result = await onCreateNode(payload);
              const createdNodeId = result?.node?.node_id;
              if (createdNodeId && action.position) {
                onNodePositionChange?.(createdNodeId, action.position);
              }
              if (createdNodeId && action.sourceNodeId) {
                await onCreateRelationship({
                  source_id: action.sourceNodeId,
                  target_id: createdNodeId,
                  relationship_type: 'CONTAINS',
                  properties: {
                    status: 'confirmed',
                    reason: 'Conexion creada desde el canvas',
                  },
                });
              }
              onClose();
            }}
            title="Nuevo nodo"
          />
        ) : null}

        {action.kind === 'node' && node ? (
          <NodeForm
            actionLabel="Guardar cambios"
            initialTitle={getNodeTitle(node)}
            initialType={getPrimaryLabel(node)}
            isDocument={node.labels?.includes('Document')}
            mode="edit"
            node={node}
            onClose={onClose}
            onDelete={async () => {
              await onDeleteNode(node.node_id);
              onClose();
            }}
            onSubmit={async (payload) => {
              await onUpdateNode(node.node_id, payload);
              onClose();
            }}
          />
        ) : null}

        {action.kind === 'relationship' && relationship ? (
          <RelationshipForm
            graph={graph}
            initialReason={relationship.properties?.reason || ''}
            initialType={getVisualRelationshipType(relationship)}
            onClose={onClose}
            onDelete={async () => {
              await onDeleteRelationship(relationship.relationship_id);
              onClose();
            }}
            onSubmit={async (payload) => {
              await onUpdateRelationship(relationship.relationship_id, payload);
              onClose();
            }}
            relationship={relationship}
          />
        ) : null}
      </article>
    </aside>
  );
}

function NodeForm({
  actionLabel,
  initialTitle = '',
  initialType,
  isDocument = false,
  mode,
  node,
  onClose,
  onDelete,
  onSubmit,
  title,
}) {
  const [nodeType, setNodeType] = useState(initialType);
  const [nodeTitle, setNodeTitle] = useState(initialTitle);
  const [isTitleEditing, setIsTitleEditing] = useState(false);
  const [isTypeMenuOpen, setIsTypeMenuOpen] = useState(false);
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');
  const titleInputRef = useRef(null);
  const nodeTypes = isDocument ? ['Document'] : mode === 'create' ? CREATABLE_NODE_TYPES : EDITABLE_NODE_TYPES;
  const nodeTypeStyle = NODE_STYLES[nodeType] || NODE_STYLES.Content;
  const visibleTitle = nodeTitle.trim() || nodeTypeStyle?.label || title || 'Nodo';
  const isEditMode = mode === 'edit';

  useEffect(() => {
    setNodeType(initialType);
    setNodeTitle(initialTitle);
    setIsTitleEditing(false);
    setIsTypeMenuOpen(false);
    setStatus('');
    setError('');
  }, [initialTitle, initialType]);

  useEffect(() => {
    if (!isTitleEditing) return;
    titleInputRef.current?.focus();
    titleInputRef.current?.select();
  }, [isTitleEditing]);

  function finishTitleEditing() {
    setNodeTitle((current) => current.trim() || initialTitle || nodeTypeStyle?.label || 'Nodo');
    setIsTitleEditing(false);
  }

  async function submit(event) {
    event.preventDefault();
    try {
      setError('');
      setStatus('Guardando...');
      const payload = {
        properties: {
          title: nodeTitle.trim() || NODE_STYLES[nodeType]?.label || 'Nodo',
        },
      };
      if (!isDocument) {
        payload.labels = [nodeType];
      }
      await onSubmit(payload);
    } catch (err) {
      setStatus('');
      setError(err.message);
    }
  }

  async function removeNode() {
    if (!onDelete) return;
    try {
      setError('');
      setStatus('Eliminando...');
      await onDelete();
    } catch (err) {
      setStatus('');
      setError(err.message);
    }
  }

  return (
    <form className="graph-edit-form" onSubmit={submit}>
      <header className="graph-edit-header">
        <button aria-label="Cerrar" className="node-reader-close" onClick={onClose} type="button">
          X
        </button>
        <div className="graph-edit-node-heading">
          {isEditMode && isTitleEditing ? (
            <input
              aria-label="Nombre del nodo"
              className="graph-edit-title-input"
              onBlur={finishTitleEditing}
              onChange={(event) => setNodeTitle(event.target.value)}
              onKeyDown={(event) => {
                if (event.key === 'Enter') {
                  event.preventDefault();
                  finishTitleEditing();
                }
                if (event.key === 'Escape') {
                  event.preventDefault();
                  setNodeTitle(initialTitle);
                  setIsTitleEditing(false);
                }
              }}
              ref={titleInputRef}
              value={nodeTitle}
            />
          ) : (
            <h2
              className={isEditMode ? 'graph-edit-node-title editable' : 'graph-edit-node-title'}
              onDoubleClick={() => {
                if (isEditMode) setIsTitleEditing(true);
              }}
              title={isEditMode ? 'Doble click para editar el nombre' : undefined}
            >
              {isEditMode ? visibleTitle : title}
            </h2>
          )}

          {isEditMode ? (
            <div className="node-type-picker">
              <button
                aria-expanded={isTypeMenuOpen}
                className="node-type-tag"
                disabled={isDocument}
                onClick={() => setIsTypeMenuOpen((current) => !current)}
                style={{ '--node-type-color': nodeTypeStyle.color }}
                type="button"
              >
                <span className="node-type-dot" />
                {nodeTypeStyle.label || nodeType}
              </button>

              {isTypeMenuOpen && !isDocument ? (
                <div className="node-type-menu" role="menu">
                  {nodeTypes.map((type) => {
                    const style = NODE_STYLES[type] || NODE_STYLES.Content;
                    return (
                      <button
                        className={type === nodeType ? 'node-type-option selected' : 'node-type-option'}
                        key={type}
                        onClick={() => {
                          setNodeType(type);
                          setIsTypeMenuOpen(false);
                        }}
                        role="menuitem"
                        style={{ '--node-type-color': style.color }}
                        type="button"
                      >
                        <span className="node-type-dot" />
                        <span>{style.label || type}</span>
                      </button>
                    );
                  })}
                </div>
              ) : null}
            </div>
          ) : (
            <p className="eyebrow">Crear</p>
          )}
        </div>
      </header>

      <div className="graph-edit-body">
        {status ? <p className="graph-edit-status">{status}</p> : null}
        {error ? <p className="graph-edit-error">{error}</p> : null}

        {!isEditMode ? (
          <>
            <label>
              Tipo
              <select
                disabled={isDocument}
                onChange={(event) => setNodeType(event.target.value)}
                value={nodeType}
              >
                {nodeTypes.map((type) => (
                  <option key={type} value={type}>
                    {NODE_STYLES[type]?.label || type}
                  </option>
                ))}
              </select>
            </label>

            <label>
              Nombre
              <input
                onChange={(event) => setNodeTitle(event.target.value)}
                placeholder="Nombre visible"
                value={nodeTitle}
              />
            </label>
          </>
        ) : null}

      </div>

      <footer className="graph-edit-footer">
        <button className="primary-button" type="submit">
          {actionLabel}
        </button>
        {mode === 'edit' ? (
          <button
            className="danger-button"
            disabled={isDocument}
            onClick={removeNode}
            type="button"
          >
            Borrar nodo
          </button>
        ) : null}
      </footer>
    </form>
  );
}

function RelationshipForm({
  graph,
  initialReason,
  initialType,
  onClose,
  onDelete,
  onSubmit,
  relationship,
}) {
  const [relationshipType, setRelationshipType] = useState(initialType);
  const [reason, setReason] = useState(initialReason);
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');
  const nodeTitleById = useMemo(
    () => new Map((graph?.nodes || []).map((node) => [node.node_id, getNodeTitle(node)])),
    [graph],
  );

  useEffect(() => {
    setRelationshipType(initialType);
    setReason(initialReason);
    setStatus('');
    setError('');
  }, [initialReason, initialType]);

  async function submit(event) {
    event.preventDefault();
    try {
      setError('');
      setStatus('Guardando...');
      await onSubmit({
        relationship_type: relationshipType,
        properties: {
          status: 'confirmed',
          reason,
        },
      });
    } catch (err) {
      setStatus('');
      setError(err.message);
    }
  }

  async function removeRelationship() {
    try {
      setError('');
      setStatus('Eliminando...');
      await onDelete();
    } catch (err) {
      setStatus('');
      setError(err.message);
    }
  }

  return (
    <form className="graph-edit-form" onSubmit={submit}>
      <header className="graph-edit-header">
        <button aria-label="Cerrar" className="node-reader-close" onClick={onClose} type="button">
          X
        </button>
        <div>
          <p className="eyebrow">{getRelationshipLabel(relationship)}</p>
          <h2>Editar conexion</h2>
        </div>
      </header>

      <div className="graph-edit-body">
        {status ? <p className="graph-edit-status">{status}</p> : null}
        {error ? <p className="graph-edit-error">{error}</p> : null}

        <p className="graph-edit-meta">
          {nodeTitleById.get(relationship.source_id) || relationship.source_id}
          {' -> '}
          {nodeTitleById.get(relationship.target_id) || relationship.target_id}
        </p>

        <label>
          Tipo de conexion
          <select
            onChange={(event) => setRelationshipType(event.target.value)}
            value={relationshipType}
          >
            {RELATIONSHIP_TYPES.map((type) => (
              <option key={type} value={type}>
                {RELATIONSHIP_STYLES[type].label}
              </option>
            ))}
          </select>
        </label>

        <label>
          Motivo
          <textarea
            onChange={(event) => setReason(event.target.value)}
            placeholder="Opcional: explica por que existe esta conexion"
            rows="5"
            value={reason}
          />
        </label>
      </div>

      <footer className="graph-edit-footer">
        <button className="primary-button" type="submit">
          Guardar conexion
        </button>
        <button className="danger-button" onClick={removeRelationship} type="button">
          Borrar conexion
        </button>
      </footer>
    </form>
  );
}

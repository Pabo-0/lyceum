import { useEffect, useMemo, useState } from 'react';

import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
  getNodeTitle,
  getPrimaryLabel,
  getRelationshipLabel,
  getVisualRelationshipType,
} from '../utils/graphModel.js';

const CREATABLE_NODE_TYPES = ['Section', 'Chunk'];
const EDITABLE_NODE_TYPES = ['Section', 'Chunk'];
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
  onMergeNodes,
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
                  relationship_type: 'DIRECTIONAL',
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
            initialContent={node.properties?.text || node.properties?.content || ''}
            initialTitle={getNodeTitle(node)}
            initialType={getPrimaryLabel(node)}
            isDocument={node.labels?.includes('Document')}
            mode="edit"
            node={node}
            nodes={nodes}
            onClose={onClose}
            onDelete={async () => {
              await onDeleteNode(node.node_id);
              onClose();
            }}
            onMerge={async (payload) => {
              await onMergeNodes(payload);
              onClose();
            }}
            onSubmit={async (payload) => {
              await onUpdateNode(node.node_id, payload);
              onClose();
            }}
            title="Editar nodo"
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
  initialContent = '',
  initialTitle = '',
  initialType,
  isDocument = false,
  mode,
  node,
  nodes = [],
  onClose,
  onDelete,
  onMerge,
  onSubmit,
  title,
}) {
  const [nodeType, setNodeType] = useState(initialType);
  const [nodeTitle, setNodeTitle] = useState(initialTitle);
  const [content, setContent] = useState(initialContent);
  const [mergeNodeId, setMergeNodeId] = useState('');
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');
  const nodeTypes = isDocument ? ['Document'] : mode === 'create' ? CREATABLE_NODE_TYPES : EDITABLE_NODE_TYPES;
  const mergeCandidates = nodes.filter(
    (candidate) =>
      candidate.node_id !== node?.node_id &&
      !candidate.labels?.includes('Document'),
  );

  useEffect(() => {
    setNodeType(initialType);
    setNodeTitle(initialTitle);
    setContent(initialContent);
    setMergeNodeId('');
    setStatus('');
    setError('');
  }, [initialContent, initialTitle, initialType]);

  async function submit(event) {
    event.preventDefault();
    try {
      setError('');
      setStatus('Guardando...');
      const payload = {
        properties: {
          title: nodeTitle.trim() || NODE_STYLES[nodeType]?.label || 'Nodo',
          text: content,
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

  async function mergeNode() {
    if (!onMerge || !mergeNodeId || !node) return;
    try {
      setError('');
      setStatus('Fusionando...');
      await onMerge({
        target_node_id: node.node_id,
        source_node_ids: [mergeNodeId],
        properties: {
          title: nodeTitle.trim() || getNodeTitle(node),
        },
      });
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
        <button className="node-reader-back" onClick={onClose} type="button">
          Volver al grafo
        </button>
        <div>
          <p className="eyebrow">{mode === 'create' ? 'Crear' : 'Modificar'}</p>
          <h2>{title}</h2>
        </div>
      </header>

      <div className="graph-edit-body">
        {status ? <p className="graph-edit-status">{status}</p> : null}
        {error ? <p className="graph-edit-error">{error}</p> : null}

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

        {!isDocument ? (
          <label>
            {nodeType === 'Chunk' ? 'Texto del parrafo' : 'Contenido'}
            <textarea
              onChange={(event) => setContent(event.target.value)}
              placeholder="Escribe o modifica el contenido del nodo"
              rows="10"
              value={content}
            />
          </label>
        ) : null}

        {mode === 'edit' && !isDocument && mergeCandidates.length ? (
          <section className="graph-edit-merge">
            <label>
              Fusionar otro nodo en este
              <select
                onChange={(event) => setMergeNodeId(event.target.value)}
                value={mergeNodeId}
              >
                <option value="">Seleccionar nodo</option>
                {mergeCandidates.map((candidate) => (
                  <option key={candidate.node_id} value={candidate.node_id}>
                    {getNodeTitle(candidate)}
                  </option>
                ))}
              </select>
            </label>
            <button
              className="secondary-button"
              disabled={!mergeNodeId}
              onClick={mergeNode}
              type="button"
            >
              Fusionar en este nodo
            </button>
          </section>
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
        <button className="node-reader-back" onClick={onClose} type="button">
          Volver al grafo
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

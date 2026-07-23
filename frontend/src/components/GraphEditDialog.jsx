import { useEffect, useState } from 'react';

import ConfirmDialog from './ConfirmDialog.jsx';
import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
  getNodeTitle,
  getPrimaryLabel,
  getRelationshipLabel,
  getVisualRelationshipType,
} from '../utils/graphModel.js';

const CREATABLE_NODE_TYPES = ['Content', 'Concept'];
const RELATIONSHIP_TYPES = Object.keys(RELATIONSHIP_STYLES);
const RELATIONSHIP_EDIT_FIELDS_BY_TYPE = {
  RELATES: [{ key: 'bidirectional', kind: 'boolean' }],
  CONTAINS: [{ key: 'order', kind: 'number' }],
  DEPENDS_ON: [
    { key: 'difficulty_gap', kind: 'number' },
    { key: 'strength', kind: 'number' },
    { key: 'blocking', kind: 'boolean' },
  ],
  EVALUATES: [
    { key: 'coverage', kind: 'number' },
    { key: 'difficulty', kind: 'number' },
  ],
};
const EDITABLE_NODE_FIELDS_BY_TYPE = {
  Document: ['title'],
  Section: ['title', 'level', 'order', 'summary'],
  Concept: ['title', 'description'],
};
const DEFAULT_EDITABLE_NODE_FIELDS = ['title'];

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
            initialType="Content"
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
            title="Crear nuevo nodo"
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
  const [nodeDescription, setNodeDescription] = useState('');
  const [attributeDraft, setAttributeDraft] = useState(() => buildAttributeDraft(node));
  const [isDeleteConfirmOpen, setIsDeleteConfirmOpen] = useState(false);
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');
  const nodeTypes = isDocument ? ['Document'] : CREATABLE_NODE_TYPES;
  const nodeTypeStyle = NODE_STYLES[nodeType] || NODE_STYLES.Content;
  const visibleTitle = nodeTitle.trim() || nodeTypeStyle?.label || title || 'Nodo';
  const isEditMode = mode === 'edit';

  useEffect(() => {
    setNodeType(initialType);
    setNodeTitle(initialTitle);
    setNodeDescription('');
    setAttributeDraft(buildAttributeDraft(node));
    setIsDeleteConfirmOpen(false);
    setStatus('');
    setError('');
  }, [initialTitle, initialType, node]);

  async function submit(event) {
    event.preventDefault();
    try {
      setError('');
      setStatus('Guardando...');
      const attributes = parseAttributeDraft(attributeDraft);
      const payload = {
        properties: {
          ...attributes,
          title: nodeTitle.trim() || NODE_STYLES[nodeType]?.label || 'Nodo',
        },
      };
      if (mode === 'create' && !isDocument) {
        payload.labels = [nodeType];
        if (nodeType === 'Concept' && nodeDescription.trim()) {
          payload.properties.description = nodeDescription.trim();
        }
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
    <form className={isEditMode ? 'graph-edit-form node-form-compact' : 'graph-edit-form'} onSubmit={submit}>
      {isEditMode ? (
        <button aria-label="Cerrar" className="graph-edit-floating-close" onClick={onClose} type="button">
          <CloseIcon />
        </button>
      ) : (
        <header className="graph-edit-header">
          <button aria-label="Cerrar" className="node-reader-close" onClick={onClose} type="button">
            <CloseIcon />
          </button>
          <div className="graph-edit-node-heading">
            <h2 className="graph-edit-node-title graph-create-node-title">{title}</h2>
          </div>
        </header>
      )}

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

            {nodeType === 'Concept' ? (
              <label>
                Descripcion
                <textarea
                  onChange={(event) => setNodeDescription(event.target.value)}
                  placeholder="Descripcion opcional del concepto"
                  rows={3}
                  value={nodeDescription}
                />
              </label>
            ) : null}
          </>
        ) : null}

        {isEditMode ? (
          <section className="graph-attribute-panel" aria-label="Atributos del nodo">
            <div className="graph-attribute-grid">
              {attributeDraft.map((attribute) => (
                <AttributeField
                  attribute={attribute}
                  key={attribute.key}
                  onChange={(value) => {
                    if (attribute.key === 'title') {
                      setNodeTitle(value);
                    }
                    setAttributeDraft((current) =>
                      current.map((item) =>
                        item.key === attribute.key ? { ...item, value } : item,
                      ),
                    );
                  }}
                />
              ))}
            </div>
          </section>
        ) : null}

      </div>

      <footer className="graph-edit-footer">
        <button className="primary-button" type="submit">
          {actionLabel}
        </button>
        {mode === 'edit' && !isDocument ? (
          <button
            className="danger-button"
            onClick={() => setIsDeleteConfirmOpen(true)}
            type="button"
          >
            Borrar nodo
          </button>
        ) : null}
      </footer>

      {isDeleteConfirmOpen ? (
        <NodeDeleteConfirmDialog
          isDocument={isDocument}
          isSection={nodeType === 'Section'}
          nodeTitle={visibleTitle}
          onCancel={() => setIsDeleteConfirmOpen(false)}
          onConfirm={removeNode}
        />
      ) : null}
    </form>
  );
}

function AttributeField({ attribute, onChange }) {
  const label = formatAttributeLabel(attribute.key);

  if (attribute.kind === 'boolean') {
    return (
      <label className="graph-attribute-field">
        {label}
        <select onChange={(event) => onChange(event.target.value)} value={attribute.value}>
          <option value="true">Verdadero</option>
          <option value="false">Falso</option>
        </select>
      </label>
    );
  }

  if (attribute.kind === 'number') {
    return (
      <label className="graph-attribute-field">
        {label}
        <input
          inputMode="decimal"
          onChange={(event) => onChange(event.target.value)}
          type="number"
          value={attribute.value}
        />
      </label>
    );
  }

  if (
    attribute.kind === 'array' ||
    attribute.kind === 'object' ||
    attribute.kind === 'long-text' ||
    attribute.value.length > 80
  ) {
    return (
      <label className="graph-attribute-field full">
        {label}
        <textarea
          onChange={(event) => onChange(event.target.value)}
          rows={attribute.kind === 'object' ? 5 : 3}
          value={attribute.value}
        />
      </label>
    );
  }

  return (
    <label className="graph-attribute-field">
      {label}
      <input onChange={(event) => onChange(event.target.value)} value={attribute.value} />
    </label>
  );
}

function buildAttributeDraft(node) {
  const nodeType = getPrimaryLabel(node);
  return buildAttributeDraftForType(node, nodeType, []);
}

function buildAttributeDraftForType(node, nodeType, currentDraft) {
  const properties = node?.properties || {};
  const currentByKey = new Map(currentDraft.map((attribute) => [attribute.key, attribute.value]));
  const keys = EDITABLE_NODE_FIELDS_BY_TYPE[nodeType] || DEFAULT_EDITABLE_NODE_FIELDS;
  return keys.map((key) => {
    const value = getAttributeDraftValue({
      currentByKey,
      key,
      node,
      properties,
    });
    return {
      key,
      kind: getAttributeKind(key, value),
      value: stringifyAttributeValue(value),
    };
  });
}

function getAttributeDraftValue({ currentByKey, key, node, properties }) {
  if (currentByKey.has(key)) return currentByKey.get(key);
  if (key === 'title') return getNodeTitle(node);
  return properties[key];
}

function getAttributeKind(key, value) {
  if (key === 'level' || key === 'order') return 'number';
  if (key === 'aliases') return 'array';
  if (key === 'summary' || key === 'description') return 'long-text';
  if (typeof value === 'boolean') return 'boolean';
  if (typeof value === 'number') return 'number';
  if (Array.isArray(value)) return 'array';
  if (typeof value === 'object') return 'object';
  return 'string';
}

function stringifyAttributeValue(value) {
  if (typeof value === 'boolean') return value ? 'true' : 'false';
  if (typeof value === 'number') return String(value);
  if (Array.isArray(value)) return value.join('\n');
  if (typeof value === 'object') return JSON.stringify(value, null, 2);
  return String(value ?? '');
}

function parseAttributeDraft(attributes) {
  return attributes.reduce((properties, attribute) => {
    if (attribute.kind === 'number' && String(attribute.value).trim() === '') {
      return properties;
    }
    properties[attribute.key] = parseAttributeValue(attribute);
    return properties;
  }, {});
}

function parseAttributeValue(attribute) {
  const value = attribute.value;
  if (attribute.kind === 'boolean') return value === 'true';
  if (attribute.kind === 'number') {
    const numericValue = Number(value);
    return Number.isFinite(numericValue) ? numericValue : 0;
  }
  if (attribute.kind === 'array') {
    return value
      .split(/\r?\n|,/)
      .map((item) => item.trim())
      .filter(Boolean);
  }
  if (attribute.kind === 'object') {
    try {
      return JSON.parse(value);
    } catch {
      return value;
    }
  }
  return value;
}

function formatAttributeLabel(key) {
  if (key === 'title') return 'Titulo';
  return key
    .replace(/_/g, ' ')
    .replace(/\b\w/g, (letter) => letter.toUpperCase());
}

function NodeDeleteConfirmDialog({ isDocument, isSection, nodeTitle, onCancel, onConfirm }) {
  const message = getNodeDeleteConfirmMessage({ isDocument, isSection, nodeTitle });

  return (
    <ConfirmDialog
      ariaLabel="Confirmar borrado del nodo"
      confirmLabel={isDocument ? '' : 'Borrar definitivamente'}
      cancelLabel={isDocument ? 'Entendido' : 'Cancelar'}
      message={message}
      onCancel={onCancel}
      onConfirm={onConfirm}
      title="Borrar nodo"
    />
  );
}

function getNodeDeleteConfirmMessage({ isDocument, isSection, nodeTitle }) {
  if (isDocument) {
    return `El documento "${nodeTitle}" no se puede borrar. Puedes editar su titulo, pero el nodo documento debe conservarse.`;
  }
  if (isSection) {
    return `Vas a borrar la seccion "${nodeTitle}", sus conexiones y los nodos dependientes de esas conexiones, incluyendo los chunks consecuentes. Esta accion no se puede deshacer.`;
  }
  return `Vas a borrar solo "${nodeTitle}" y las conexiones que lo involucren. Los demas nodos del grafo se conservaran. Esta accion no se puede deshacer.`;
}

function CloseIcon() {
  return (
    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24">
      <path d="M6.7 5.3 18.7 17.3" />
      <path d="M18.7 5.3 6.7 17.3" />
    </svg>
  );
}

function RelationshipForm({
  initialReason,
  initialType,
  onClose,
  onDelete,
  onSubmit,
  relationship,
}) {
  const [relationshipType, setRelationshipType] = useState(initialType);
  const [reason, setReason] = useState(initialReason);
  const [relationshipDraft, setRelationshipDraft] = useState(() =>
    buildRelationshipDraft(initialType, relationship?.properties),
  );
  const [status, setStatus] = useState('');
  const [error, setError] = useState('');

  useEffect(() => {
    setRelationshipType(initialType);
    setReason(initialReason);
    setRelationshipDraft(buildRelationshipDraft(initialType, relationship?.properties));
    setStatus('');
    setError('');
  }, [initialReason, initialType, relationship]);

  async function submit(event) {
    event.preventDefault();
    try {
      setError('');
      setStatus('Guardando...');
      const attributes = parseAttributeDraft(relationshipDraft);
      await onSubmit({
        relationship_type: relationshipType,
        properties: {
          ...attributes,
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
          <CloseIcon />
        </button>
        <div className="graph-edit-node-heading">
          <h2 className="graph-edit-node-title graph-relationship-title">Editar conexion</h2>
        </div>
      </header>

      <div className="graph-edit-body">
        {status ? <p className="graph-edit-status">{status}</p> : null}
        {error ? <p className="graph-edit-error">{error}</p> : null}

        <label>
          Tipo de conexion
          <select
            onChange={(event) => {
              const nextType = event.target.value;
              setRelationshipType(nextType);
              setRelationshipDraft((current) =>
                buildRelationshipDraft(nextType, relationship?.properties, current),
              );
            }}
            value={relationshipType}
          >
            {RELATIONSHIP_TYPES.map((type) => (
              <option key={type} value={type}>
                {RELATIONSHIP_STYLES[type].label}
              </option>
            ))}
          </select>
        </label>

        {relationshipDraft.length ? (
          <section className="graph-attribute-panel" aria-label="Atributos de la conexion">
            <div className="graph-attribute-grid">
              {relationshipDraft.map((attribute) => (
                <AttributeField
                  attribute={attribute}
                  key={attribute.key}
                  onChange={(value) => {
                    setRelationshipDraft((current) =>
                      current.map((item) =>
                        item.key === attribute.key ? { ...item, value } : item,
                      ),
                    );
                  }}
                />
              ))}
            </div>
          </section>
        ) : null}

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

function buildRelationshipDraft(type, properties = {}, currentDraft = []) {
  const currentByKey = new Map(currentDraft.map((attribute) => [attribute.key, attribute.value]));
  return (RELATIONSHIP_EDIT_FIELDS_BY_TYPE[type] || []).map((field) => {
    const value = currentByKey.has(field.key) ? currentByKey.get(field.key) : properties?.[field.key];
    return {
      key: field.key,
      kind: field.kind,
      value: stringifyAttributeValue(defaultRelationshipAttributeValue(field, value)),
    };
  });
}

function defaultRelationshipAttributeValue(field, value) {
  if (value !== undefined && value !== null) return value;
  if (field.kind === 'boolean') return false;
  if (field.kind === 'number') return '';
  return '';
}

export const NODE_STYLES = {
  Document: { label: 'Documento', color: 'var(--graph-node-document)', shape: 'round-rect' },
  Section: { label: 'Seccion', color: 'var(--graph-node-section)', shape: 'rect' },
  Chunk: { label: 'Parrafo', color: 'var(--graph-node-chunk)', shape: 'pill' },
};

export const RELATIONSHIP_STYLES = {
  DIRECTIONAL: {
    label: 'Direccional',
    color: 'var(--graph-edge-directional)',
    dashed: false,
    marker: 'end',
  },
  BIDIRECTIONAL: {
    label: 'Bidireccional',
    color: 'var(--graph-edge-bidirectional)',
    dashed: false,
    marker: 'both',
  },
  SEMANTIC: {
    label: 'Semantica',
    color: 'var(--graph-edge-semantic)',
    dashed: true,
    marker: 'none',
  },
};

const RELATIONSHIP_ALIASES = {
  HAS_SECTION: 'DIRECTIONAL',
  HAS_SUBSECTION: 'DIRECTIONAL',
  HAS_CHUNK: 'DIRECTIONAL',
  MENTIONS: 'SEMANTIC',
  RELATED_TO: 'SEMANTIC',
  SUPPORTS: 'DIRECTIONAL',
  CONTRADICTS: 'SEMANTIC',
  EXPLAINS: 'DIRECTIONAL',
  CUSTOM_RELATION: 'SEMANTIC',
};

const LAYOUT_CENTER = { x: 620, y: 420 };
const DOCUMENT_SPACING = 76;
const SECTION_RADIUS = 200;
const SECTION_DEPTH_RADIUS = 118;
const CHUNK_RADIUS_OFFSET = 204;
const CHUNK_TANGENT_SPACING = 108;
const ORPHAN_RADIUS = 486;

export function buildGraphView(graph, options = {}) {
  const nodes = graph?.nodes || [];
  const relationships = graph?.relationships || [];
  const visibleRelationships = relationships.filter((relationship) =>
    isRelationshipVisible(relationship, options),
  );
  const positionedNodes = positionNodes(nodes, visibleRelationships, options);
  const nodeById = new Map(positionedNodes.map((node) => [node.node_id, node]));

  return {
    nodes: positionedNodes,
    relationships: visibleRelationships
      .map((relationship) => ({
        ...relationship,
        visual_type: getVisualRelationshipType(relationship),
        source: nodeById.get(relationship.source_id),
        target: nodeById.get(relationship.target_id),
      }))
      .filter((relationship) => relationship.source && relationship.target),
    nodeById,
  };
}

export function getPrimaryLabel(node) {
  return node?.labels?.[0] || 'Chunk';
}

export function getNodeTitle(node) {
  const properties = node?.properties || {};
  return (
    properties.title ||
    properties.text ||
    properties.node_id ||
    node?.node_id ||
    'Nodo'
  );
}

export function getNodeSubtitle(node) {
  const label = getPrimaryLabel(node);
  const properties = node?.properties || {};
  if (label === 'Section') return `Nivel ${properties.level ?? '-'} - orden ${properties.order ?? '-'}`;
  if (label === 'Chunk') return `${properties.word_count ?? 0} palabras`;
  return properties.source_extension || 'Documento';
}

export function getRelationshipLabel(relationship) {
  return RELATIONSHIP_STYLES[getVisualRelationshipType(relationship)]?.label || relationship.relationship_type;
}

export function getCenterableNodes(graph) {
  return (graph?.nodes || [])
    .filter((node) => ['Section', 'Chunk'].includes(getPrimaryLabel(node)))
    .map((node) => ({
      node_id: node.node_id,
      label: getPrimaryLabel(node),
      title: getNodeTitle(node),
    }))
    .sort((a, b) => `${a.label}:${a.title}`.localeCompare(`${b.label}:${b.title}`));
}

export function getConnectedRelationships(graph, nodeId) {
  return (graph?.relationships || []).filter(
    (relationship) => relationship.source_id === nodeId || relationship.target_id === nodeId,
  );
}

function isRelationshipVisible(relationship, options) {
  return getVisualRelationshipType(relationship) in RELATIONSHIP_STYLES;
}

function positionNodes(nodes, relationships, options) {
  const nodePositions = options.nodePositions || {};
  const visibleNodes = nodes.filter((node) => {
    const label = getPrimaryLabel(node);
    return label in NODE_STYLES;
  });
  const visibleNodeIds = new Set(visibleNodes.map((node) => node.node_id));
  const nodeById = new Map(visibleNodes.map((node) => [node.node_id, node]));
  const groups = groupNodes(visibleNodes);
  const positionedById = new Map();
  const chunksBySection = new Map();

  relationships.forEach((relationship) => {
    if (!isChunkRelationship(relationship)) return;
    if (!visibleNodeIds.has(relationship.source_id) || !visibleNodeIds.has(relationship.target_id)) return;
    const targetNode = nodeById.get(relationship.target_id);
    if (!targetNode || getPrimaryLabel(targetNode) !== 'Chunk') return;
    const chunks = chunksBySection.get(relationship.source_id) || [];
    chunks.push(targetNode);
    chunksBySection.set(relationship.source_id, chunks);
  });

  groups.Document.forEach((node, index) => {
    const yOffset = (index - (groups.Document.length - 1) / 2) * DOCUMENT_SPACING;
    positionedById.set(node.node_id, {
      ...node,
      x: LAYOUT_CENTER.x,
      y: LAYOUT_CENTER.y + yOffset,
    });
  });

  const sectionParents = getSectionParents(relationships);
  const sectionDepths = getSectionDepths(groups.Section, sectionParents);
  const sectionAngles = distributeAngles(groups.Section.length, -Math.PI / 2);
  const sectionAngleById = new Map();

  groups.Section.forEach((node, index) => {
    const depth = sectionDepths.get(node.node_id) || 1;
    const angle = sectionAngles[index];
    const radius = SECTION_RADIUS + (depth - 1) * SECTION_DEPTH_RADIUS;
    const position = polarPoint(LAYOUT_CENTER, radius, angle);
    sectionAngleById.set(node.node_id, angle);
    positionedById.set(node.node_id, {
      ...node,
      x: position.x,
      y: position.y,
    });
  });

  chunksBySection.forEach((chunks, sectionId) => {
    const section = positionedById.get(sectionId);
    if (!section) return;

    const angle = sectionAngleById.get(sectionId) ?? 0;
    const outward = unitVector(angle);
    const tangent = { x: -outward.y, y: outward.x };
    const chunkRadius = SECTION_RADIUS + CHUNK_RADIUS_OFFSET;

    chunks.sort(compareNodes).forEach((node, index) => {
      const centeredIndex = index - (chunks.length - 1) / 2;
      const radialStep = Math.floor(Math.abs(centeredIndex)) * 28;
      const basePosition = polarPoint(LAYOUT_CENTER, chunkRadius + radialStep, angle);
      positionedById.set(node.node_id, {
        ...node,
        x: basePosition.x + tangent.x * centeredIndex * CHUNK_TANGENT_SPACING,
        y: basePosition.y + tangent.y * centeredIndex * CHUNK_TANGENT_SPACING,
      });
    });
  });

  const orphanChunks = groups.Chunk.filter((node) => !positionedById.has(node.node_id));
  const orphanAngles = distributeAngles(orphanChunks.length, Math.PI / 2);
  orphanChunks.forEach((node, index) => {
    const position = polarPoint(LAYOUT_CENTER, ORPHAN_RADIUS, orphanAngles[index]);
    positionedById.set(node.node_id, {
      ...node,
      x: position.x,
      y: position.y,
    });
  });

  return visibleNodes
    .map((node) => {
      const positionedNode = positionedById.get(node.node_id);
      const manualPosition = normalizeNodePosition(nodePositions[node.node_id]);
      if (!positionedNode) return null;
      return manualPosition
        ? {
            ...positionedNode,
            x: manualPosition.x,
            y: manualPosition.y,
            manual_position: true,
          }
        : positionedNode;
    })
    .filter(Boolean);
}

function groupNodes(nodes) {
  const groups = {
    Document: [],
    Section: [],
    Chunk: [],
  };

  nodes.forEach((node) => groups[getPrimaryLabel(node)]?.push(node));
  Object.values(groups).forEach((group) => group.sort(compareNodes));
  return groups;
}

function compareNodes(a, b) {
  const aOrder = a.properties?.order ?? 9999;
  const bOrder = b.properties?.order ?? 9999;
  return aOrder - bOrder || getNodeTitle(a).localeCompare(getNodeTitle(b));
}

function getSectionParents(relationships) {
  const parents = new Map();
  relationships.forEach((relationship) => {
    if (!isSectionRelationship(relationship)) return;
    parents.set(relationship.target_id, relationship.source_id);
  });
  return parents;
}

export function getVisualRelationshipType(relationship) {
  const relationshipType = relationship?.relationship_type || '';
  return RELATIONSHIP_STYLES[relationshipType]
    ? relationshipType
    : RELATIONSHIP_ALIASES[relationshipType] || relationshipType;
}

function isSectionRelationship(relationship) {
  const role = relationship.properties?.role;
  return (
    role === 'contains_section' ||
    role === 'contains_subsection' ||
    relationship.relationship_type === 'HAS_SECTION' ||
    relationship.relationship_type === 'HAS_SUBSECTION'
  );
}

function isChunkRelationship(relationship) {
  return (
    relationship.properties?.role === 'contains_chunk' ||
    relationship.relationship_type === 'HAS_CHUNK'
  );
}

function getSectionDepths(sections, sectionParents) {
  const sectionIds = new Set(sections.map((section) => section.node_id));
  const depths = new Map();

  function depthFor(sectionId, visited = new Set()) {
    if (depths.has(sectionId)) return depths.get(sectionId);
    if (visited.has(sectionId)) return 1;

    const parentId = sectionParents.get(sectionId);
    const depth = parentId && sectionIds.has(parentId)
      ? depthFor(parentId, new Set([...visited, sectionId])) + 1
      : 1;
    depths.set(sectionId, depth);
    return depth;
  }

  sections.forEach((section) => depthFor(section.node_id));
  return depths;
}

function distributeAngles(total, startAngle = 0) {
  if (!total) return [];
  if (total === 1) return [startAngle];

  const step = (Math.PI * 2) / total;
  return Array.from({ length: total }, (_, index) => startAngle + index * step);
}

function polarPoint(center, radius, angle) {
  return {
    x: center.x + Math.cos(angle) * radius,
    y: center.y + Math.sin(angle) * radius,
  };
}

function unitVector(angle) {
  return {
    x: Math.cos(angle),
    y: Math.sin(angle),
  };
}

function normalizeNodePosition(position) {
  if (!position) return null;
  const x = Number(position.x);
  const y = Number(position.y);
  if (!Number.isFinite(x) || !Number.isFinite(y)) return null;
  return { x, y };
}

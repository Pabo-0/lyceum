export const NODE_STYLES = {
  Document: { label: 'Documento', color: '#1d4ed8', shape: 'round-rect' },
  Section: { label: 'Seccion', color: '#0f766e', shape: 'rect' },
  Chunk: { label: 'Parrafo', color: '#475569', shape: 'pill' },
};

export const RELATIONSHIP_STYLES = {
  HAS_SECTION: { label: 'Contiene seccion', color: '#2563eb', dashed: false },
  HAS_SUBSECTION: { label: 'Contiene subseccion', color: '#0f766e', dashed: false },
  HAS_CHUNK: { label: 'Contiene parrafo', color: '#64748b', dashed: false },
};

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
  return RELATIONSHIP_STYLES[relationship.relationship_type]?.label || relationship.relationship_type;
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
  if (!options.showChunks && relationship.relationship_type === 'HAS_CHUNK') return false;
  return relationship.relationship_type in RELATIONSHIP_STYLES;
}

function positionNodes(nodes, relationships, options) {
  const visibleNodes = nodes.filter((node) => {
    const label = getPrimaryLabel(node);
    if (!['Document', 'Section', 'Chunk'].includes(label)) return false;
    return !(label === 'Chunk' && !options.showChunks);
  });
  const visibleNodeIds = new Set(visibleNodes.map((node) => node.node_id));
  const nodeById = new Map(visibleNodes.map((node) => [node.node_id, node]));
  const groups = groupNodes(visibleNodes);
  const positionedById = new Map();

  groups.Document.forEach((node, index) => {
    positionedById.set(node.node_id, {
      ...node,
      x: 160,
      y: 360 + index * 72,
    });
  });

  const sectionParents = getSectionParents(relationships);
  const sectionDepths = getSectionDepths(groups.Section, sectionParents);

  groups.Section.forEach((node, index) => {
    const depth = sectionDepths.get(node.node_id) || 1;
    positionedById.set(node.node_id, {
      ...node,
      x: 460 + (depth - 1) * 170,
      y: spreadY(index, groups.Section.length, 360, 118),
    });
  });

  const chunksBySection = new Map();
  relationships.forEach((relationship) => {
    if (relationship.relationship_type !== 'HAS_CHUNK') return;
    if (!visibleNodeIds.has(relationship.source_id) || !visibleNodeIds.has(relationship.target_id)) return;
    const targetNode = nodeById.get(relationship.target_id);
    if (!targetNode || getPrimaryLabel(targetNode) !== 'Chunk') return;
    const chunks = chunksBySection.get(relationship.source_id) || [];
    chunks.push(targetNode);
    chunksBySection.set(relationship.source_id, chunks);
  });

  chunksBySection.forEach((chunks, sectionId) => {
    const section = positionedById.get(sectionId);
    if (!section) return;

    chunks.sort(compareNodes).forEach((node, index) => {
      positionedById.set(node.node_id, {
        ...node,
        x: section.x + 270,
        y: section.y + (index - (chunks.length - 1) / 2) * 78,
      });
    });
  });

  const orphanChunks = groups.Chunk.filter((node) => !positionedById.has(node.node_id));
  orphanChunks.forEach((node, index) => {
    positionedById.set(node.node_id, {
      ...node,
      x: 900,
      y: spreadY(index, orphanChunks.length, 360, 92),
    });
  });

  return visibleNodes.map((node) => positionedById.get(node.node_id)).filter(Boolean);
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
    if (!['HAS_SECTION', 'HAS_SUBSECTION'].includes(relationship.relationship_type)) return;
    parents.set(relationship.target_id, relationship.source_id);
  });
  return parents;
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

function spreadY(index, total, centerY, spacing) {
  return centerY + (index - (total - 1) / 2) * spacing;
}

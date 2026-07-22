export const NODE_STYLES = {
  Document: { label: 'Documento', color: 'var(--graph-node-document)', shape: 'round-rect' },
  Section: { label: 'Seccion', color: 'var(--graph-node-section)', shape: 'rect' },
  Chunk: { label: 'Fragmento', color: 'var(--graph-node-chunk)', shape: 'pill' },
  Content: { label: 'Contenido', color: 'var(--graph-node-content)', shape: 'pill' },
  Concept: { label: 'Concepto', color: 'var(--graph-node-concept)', shape: 'circle' },
};

export const RELATIONSHIP_STYLES = {
  CONTAINS: {
    label: 'Contiene',
    color: 'var(--graph-edge-directional)',
    dashed: false,
    marker: 'end',
  },
  RELATES: {
    label: 'Relaciona',
    color: 'var(--graph-edge-semantic)',
    dashed: true,
    marker: 'end',
  },
  DEPENDS_ON: {
    label: 'Depende de',
    color: 'var(--graph-edge-prerequisite)',
    dashed: false,
    marker: 'end',
  },
  EVALUATES: {
    label: 'Evalua',
    color: 'var(--graph-edge-evaluates)',
    dashed: true,
    marker: 'end',
  },
};

const LAYOUT_CENTER = { x: 620, y: 420 };
const DOCUMENT_SPACING = 76;
const SECTION_RADIUS = 200;
const SECTION_DEPTH_RADIUS = 118;
const CHUNK_RADIUS_OFFSET = 204;
const CHUNK_TANGENT_SPACING = 108;
const ORPHAN_RADIUS = 486;
const MANUAL_ORPHAN_RADIUS_OFFSET = 132;
const ATTACHED_NODE_DISTANCE = 124;
const ATTACHED_NODE_TANGENT_SPACING = 76;
const ATTACHED_NODE_RADIAL_STEP = 24;
const ATTACHED_NODE_SEARCH_STEP = 34;
const ATTACHED_NODE_MIN_GAP = 22;

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
  return node?.labels?.[0] || 'Content';
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
  if (label === 'Content') return properties.node_kind || 'Contenido';
  if (label === 'Concept') return properties.normalized_name || 'Concepto';
  return properties.source_extension || 'Documento';
}

export function getRelationshipLabel(relationship) {
  return RELATIONSHIP_STYLES[getVisualRelationshipType(relationship)]?.label || relationship.relationship_type;
}

export function getCenterableNodes(graph) {
  return (graph?.nodes || [])
    .filter((node) => ['Section', 'Chunk', 'Content', 'Concept'].includes(getPrimaryLabel(node)))
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

  const floatingNodes = [...groups.Content, ...groups.Concept].filter(
    (node) => !positionedById.has(node.node_id),
  );
  const generatedFloatingNodes = floatingNodes.filter((node) => !isManualNode(node));
  const manualFloatingNodes = floatingNodes.filter(isManualNode);

  positionOrphanNodes(generatedFloatingNodes, positionedById);

  const unattachedManualNodes = positionAttachedFloatingNodes(
    manualFloatingNodes,
    relationships,
    positionedById,
    nodeById,
  );
  positionOrphanNodes(unattachedManualNodes, positionedById, {
    radius: ORPHAN_RADIUS + MANUAL_ORPHAN_RADIUS_OFFSET,
    startAngle: 0,
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
    Content: [],
    Concept: [],
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

function isManualNode(node) {
  return node?.properties?.manual === true;
}

function positionOrphanNodes(nodes, positionedById, options = {}) {
  const radius = options.radius ?? ORPHAN_RADIUS;
  const startAngle = options.startAngle ?? Math.PI / 2;
  const floatingAngles = distributeAngles(nodes.length, startAngle);

  nodes.forEach((node, index) => {
    const position = polarPoint(LAYOUT_CENTER, radius, floatingAngles[index]);
    positionedById.set(node.node_id, {
      ...node,
      x: position.x,
      y: position.y,
    });
  });
}

function positionAttachedFloatingNodes(nodes, relationships, positionedById, nodeById) {
  const relationshipsByNode = getRelationshipsByNode(relationships);
  let remaining = [...nodes].sort(compareNodes);
  const satelliteCountsByAnchor = new Map();

  for (let pass = 0; pass < nodes.length && remaining.length; pass += 1) {
    const groupsByAnchor = new Map();
    const nextRemaining = [];

    remaining.forEach((node) => {
      const attachment = getBestPositionedAttachment(
        node,
        relationshipsByNode.get(node.node_id) || [],
        positionedById,
        nodeById,
      );

      if (!attachment) {
        nextRemaining.push(node);
        return;
      }

      const anchorId = attachment.anchor.node_id;
      const group = groupsByAnchor.get(anchorId) || {
        anchor: attachment.anchor,
        nodes: [],
      };
      group.nodes.push(node);
      groupsByAnchor.set(anchorId, group);
    });

    if (!groupsByAnchor.size) {
      return nextRemaining;
    }

    Array.from(groupsByAnchor.values())
      .sort((a, b) => angleFromCenter(a.anchor) - angleFromCenter(b.anchor))
      .forEach((group) => {
        placeAttachedNodes(group.anchor, group.nodes.sort(compareNodes), positionedById, satelliteCountsByAnchor);
      });

    remaining = nextRemaining;
  }

  return remaining;
}

function getRelationshipsByNode(relationships) {
  const relationshipsByNode = new Map();

  relationships.forEach((relationship) => {
    [relationship.source_id, relationship.target_id].forEach((nodeId) => {
      if (!nodeId) return;
      const nodeRelationships = relationshipsByNode.get(nodeId) || [];
      nodeRelationships.push(relationship);
      relationshipsByNode.set(nodeId, nodeRelationships);
    });
  });

  return relationshipsByNode;
}

function getBestPositionedAttachment(node, relationships, positionedById, nodeById) {
  const candidates = relationships
    .map((relationship) => {
      const isIncoming = relationship.target_id === node.node_id;
      const anchorId = isIncoming ? relationship.source_id : relationship.target_id;
      const anchor = positionedById.get(anchorId);

      if (!anchor || !nodeById.has(anchorId)) return null;

      return {
        anchor,
        rank: attachmentRank(relationship, anchor, isIncoming),
      };
    })
    .filter(Boolean);

  candidates.sort(
    (a, b) => a.rank - b.rank || compareNodes(a.anchor, b.anchor),
  );
  return candidates[0] || null;
}

function attachmentRank(relationship, anchor, isIncoming) {
  const relationshipRanks = {
    CONTAINS: 0,
    RELATES: 4,
    DEPENDS_ON: 8,
    EVALUATES: 12,
  };
  const anchorRanks = {
    Section: 0,
    Chunk: 1,
    Concept: 2,
    Content: 3,
    Document: 4,
  };

  return (
    (isIncoming ? 0 : 20) +
    (relationshipRanks[relationship.relationship_type] ?? 16) +
    (anchorRanks[getPrimaryLabel(anchor)] ?? 9) / 10
  );
}

function placeAttachedNodes(anchor, nodes, positionedById, satelliteCountsByAnchor) {
  const anchorId = anchor.node_id;
  const previousCount = satelliteCountsByAnchor.get(anchorId) || 0;
  const totalCount = previousCount + nodes.length;
  const baseAngle = angleFromCenter(anchor);
  const spreadStep = Math.min(Math.PI / 5, Math.PI / Math.max(totalCount + 1, 4));

  nodes.forEach((node, index) => {
    const satelliteIndex = previousCount + index;
    const centeredIndex = satelliteIndex - (totalCount - 1) / 2;
    const angle = baseAngle + centeredIndex * spreadStep;
    const distance = getAttachedNodeDistance(anchor, node)
      + Math.floor(Math.abs(centeredIndex)) * ATTACHED_NODE_RADIAL_STEP;
    const preferredPosition = polarPoint(anchor, distance, angle);
    const position = findOpenAttachedPosition(preferredPosition, node, positionedById, angle);

    positionedById.set(node.node_id, {
      ...node,
      x: position.x,
      y: position.y,
    });
  });

  satelliteCountsByAnchor.set(anchorId, totalCount);
}

function getAttachedNodeDistance(anchor, node) {
  const anchorLabel = getPrimaryLabel(anchor);
  const nodeLabel = getPrimaryLabel(node);
  const anchorOffset = anchorLabel === 'Document' ? 64 : anchorLabel === 'Section' ? 24 : 0;
  const nodeOffset = nodeLabel === 'Concept' ? 0 : 10;
  return ATTACHED_NODE_DISTANCE + anchorOffset + nodeOffset;
}

function findOpenAttachedPosition(preferredPosition, node, positionedById, angle) {
  const outward = unitVector(angle);
  const tangent = { x: -outward.y, y: outward.x };

  for (let radialStep = 0; radialStep <= 8; radialStep += 1) {
    const tangentSteps = balancedSteps(radialStep + 2);

    for (const tangentStep of tangentSteps) {
      const candidate = {
        x: preferredPosition.x
          + outward.x * radialStep * ATTACHED_NODE_SEARCH_STEP
          + tangent.x * tangentStep * ATTACHED_NODE_TANGENT_SPACING,
        y: preferredPosition.y
          + outward.y * radialStep * ATTACHED_NODE_SEARCH_STEP
          + tangent.y * tangentStep * ATTACHED_NODE_TANGENT_SPACING,
      };

      if (!hasLayoutCollision(candidate, node, positionedById)) {
        return candidate;
      }
    }
  }

  return preferredPosition;
}

function balancedSteps(maxStep) {
  const steps = [0];
  for (let index = 1; index <= maxStep; index += 1) {
    steps.push(-index, index);
  }
  return steps;
}

function hasLayoutCollision(position, node, positionedById) {
  const nodeRadius = getLayoutNodeRadius(node);

  return Array.from(positionedById.values()).some((otherNode) => {
    const minDistance = nodeRadius + getLayoutNodeRadius(otherNode) + ATTACHED_NODE_MIN_GAP;
    return distanceBetween(position, otherNode) < minDistance;
  });
}

function getLayoutNodeRadius(node) {
  const label = getPrimaryLabel(node);
  const titleLength = getNodeTitle(node).length;
  const textRadius = Math.min(Math.max(titleLength * 3.2, 22), 76);

  if (label === 'Document') return Math.max(42, textRadius);
  if (label === 'Section') return Math.max(36, textRadius);
  if (label === 'Chunk') return Math.max(30, textRadius);
  return Math.max(28, textRadius * 0.82);
}

function distanceBetween(a, b) {
  const x = (a.x || 0) - (b.x || 0);
  const y = (a.y || 0) - (b.y || 0);
  return Math.sqrt(x * x + y * y);
}

function angleFromCenter(point) {
  const x = (point?.x ?? LAYOUT_CENTER.x) - LAYOUT_CENTER.x;
  const y = (point?.y ?? LAYOUT_CENTER.y) - LAYOUT_CENTER.y;
  if (!x && !y) return -Math.PI / 2;
  return Math.atan2(y, x);
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
  return RELATIONSHIP_STYLES[relationshipType] ? relationshipType : relationshipType;
}

function isSectionRelationship(relationship) {
  const role = relationship.properties?.role;
  return (
    relationship.relationship_type === 'CONTAINS' &&
    (role === 'section' || role === 'subsection')
  );
}

function isChunkRelationship(relationship) {
  return relationship.relationship_type === 'CONTAINS' && relationship.properties?.role === 'chunk';
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

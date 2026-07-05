import { useEffect, useMemo, useRef, useState } from 'react';

import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
  buildGraphView,
  getNodeTitle,
  getPrimaryLabel,
} from '../utils/graphModel.js';

const DEFAULT_VIEWBOX = { x: 0, y: 0, width: 1220, height: 780 };
const CONNECTION_NODE_GAP = 1;
const TITLE_FONT_SIZE = 13;
const TITLE_LINE_HEIGHT = 15;
const TITLE_CHAR_WIDTH = 6.4;
const DEFAULT_INTERACTION_METRICS = {
  circleExtra: 2,
  titlePaddingX: 2,
  titlePaddingY: 2,
  minDragGap: 8,
};
const GRAPH_MODES = [
  {
    id: 'read',
    shortLabel: 'Leer',
    title: 'Modo lectura: seleccionar y leer',
  },
  {
    id: 'style',
    shortLabel: 'Mover',
    title: 'Modo estilo: arrastrar nodos',
  },
  {
    id: 'edit',
    shortLabel: 'Editar',
    title: 'Modo edicion: crear y modificar',
  },
];

export default function GraphCanvas({
  graph,
  graphMode = 'read',
  nodePositions = {},
  selectedNodeId,
  selectedRelationshipId,
  focusNodeId,
  onGraphModeChange,
  onNodePositionChange,
  onOpenCreateNode,
  onOpenNodeEditor,
  onOpenRelationshipEditor,
  onCreateRelationship,
  onSelectNode,
  onSelectRelationship,
}) {
  const svgRef = useRef(null);
  const connectionTimerRef = useRef(null);
  const suppressCanvasClickRef = useRef(false);
  const graphView = useMemo(
    () => buildGraphView(graph, { nodePositions }),
    [graph, nodePositions],
  );
  const graphLayoutKey = useMemo(
    () => getGraphLayoutKey(graph),
    [graph],
  );
  const [viewBox, setViewBox] = useState(DEFAULT_VIEWBOX);
  const [panState, setPanState] = useState(null);
  const [dragState, setDragState] = useState(null);
  const [connectionDraft, setConnectionDraft] = useState(null);
  const [editPrompt, setEditPrompt] = useState(null);

  useEffect(() => {
    if (!graphView.nodes.length) {
      setViewBox(DEFAULT_VIEWBOX);
      return;
    }

    const focusedNode = graphView.nodeById.get(focusNodeId);
    setViewBox(focusedNode ? centerOnNode(focusedNode) : fitNodes(graphView.nodes));
  }, [graphLayoutKey, focusNodeId]);

  useEffect(() => {
    setEditPrompt(null);
    setConnectionDraft(null);
    clearConnectionTimer();
  }, [graphMode, graphLayoutKey]);

  useEffect(() => () => clearConnectionTimer(), []);

  if (!graph) {
    return (
      <div className="graph-empty">
        <p className="muted">Selecciona o sube un documento para ver su grafo.</p>
      </div>
    );
  }

  function screenToGraphPoint(event) {
    const svg = svgRef.current;
    if (!svg) return { x: viewBox.x, y: viewBox.y };

    const transformedPoint = screenPointToSvgPoint(svg, event.clientX, event.clientY);
    if (transformedPoint) return transformedPoint;

    const rect = svg.getBoundingClientRect();
    return {
      x: viewBox.x + ((event.clientX - rect.left) / rect.width) * viewBox.width,
      y: viewBox.y + ((event.clientY - rect.top) / rect.height) * viewBox.height,
    };
  }

  function screenDeltaToGraphDelta(deltaX, deltaY) {
    const svg = svgRef.current;
    if (!svg) return { x: 0, y: 0 };

    const transformedDelta = screenDeltaToSvgDelta(svg, deltaX, deltaY);
    if (transformedDelta) return transformedDelta;

    const rect = svg.getBoundingClientRect();
    return {
      x: (deltaX / rect.width) * viewBox.width,
      y: (deltaY / rect.height) * viewBox.height,
    };
  }

  function handleWheel(event) {
    event.preventDefault();
    const graphPoint = screenToGraphPoint(event);
    const factor = event.deltaY < 0 ? 0.88 : 1.12;
    setViewBox((current) => zoomViewBoxAtPoint(current, factor, graphPoint));
  }

  function handlePointerDown(event) {
    const svg = svgRef.current;
    if (!svg) return;
    const isMiddlePan = event.button === 1;
    const isBackgroundPan = event.button === 0 && event.target === svg;
    if (!isMiddlePan && !isBackgroundPan) return;

    event.preventDefault();
    svg.setPointerCapture(event.pointerId);
    setPanState({
      button: event.button,
      hasMoved: false,
      pointerId: event.pointerId,
      startClientX: event.clientX,
      startClientY: event.clientY,
      startViewBox: viewBox,
    });
  }

  function handlePointerMove(event) {
    if (connectionDraft && connectionDraft.pointerId === event.pointerId) {
      event.preventDefault();
      const graphPoint = screenToGraphPoint(event);
      const moved =
        Math.hypot(
          event.clientX - connectionDraft.startClientX,
          event.clientY - connectionDraft.startClientY,
        ) > 8;
      setConnectionDraft((current) => {
        if (!current || current.pointerId !== event.pointerId) return current;
        return {
          ...current,
          active: current.active || moved,
          currentPoint: graphPoint,
        };
      });
      return;
    }

    if (dragState && dragState.pointerId === event.pointerId) {
      event.preventDefault();
      const graphPoint = screenToGraphPoint(event);
      const candidatePosition = {
        x: Math.round(graphPoint.x - dragState.offsetX),
        y: Math.round(graphPoint.y - dragState.offsetY),
      };
      const safePosition = getSafeNodePosition(
        dragState.nodeId,
        candidatePosition,
        graphView.nodes,
        getInteractionMetrics(svgRef.current),
      );
      if (safePosition) {
        onNodePositionChange?.(dragState.nodeId, safePosition);
      }
      return;
    }

    if (!panState || panState.pointerId !== event.pointerId) return;

    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    const movement = Math.hypot(
      event.clientX - panState.startClientX,
      event.clientY - panState.startClientY,
    );
    const hasMoved = panState.hasMoved || movement > 4;
    if (panState.button === 0 && !hasMoved) return;

    const delta = screenDeltaToGraphDelta(
      event.clientX - panState.startClientX,
      event.clientY - panState.startClientY,
    );

    setViewBox({
      ...panState.startViewBox,
      x: panState.startViewBox.x - delta.x,
      y: panState.startViewBox.y - delta.y,
    });
    if (hasMoved !== panState.hasMoved) {
      setPanState((current) => (
        current && current.pointerId === event.pointerId
          ? { ...current, hasMoved }
          : current
      ));
    }
  }

  function handlePointerUp(event) {
    if (connectionDraft && connectionDraft.pointerId === event.pointerId) {
      const svg = svgRef.current;
      const graphPoint = screenToGraphPoint(event);
      const targetNode = connectionDraft.active
        ? findNodeAtPoint(graphView.nodes, graphPoint, connectionDraft.source.node_id)
        : null;

      clearConnectionTimer();
      if (svg?.hasPointerCapture(event.pointerId)) {
        svg.releasePointerCapture(event.pointerId);
      }

      if (connectionDraft.active) {
        suppressNextCanvasClick();
        if (targetNode) {
          onCreateRelationship?.({
            source_id: connectionDraft.source.node_id,
            target_id: targetNode.node_id,
            relationship_type: 'DIRECTIONAL',
            properties: {
              status: 'confirmed',
              reason: 'Conexion creada desde el canvas',
            },
          });
        } else {
          onOpenCreateNode?.({
            position: roundPoint(graphPoint),
            sourceNodeId: connectionDraft.source.node_id,
          });
        }
      } else {
        suppressNextCanvasClick();
        onOpenNodeEditor?.(connectionDraft.source.node_id);
      }
      setConnectionDraft(null);
      return;
    }

    if (dragState && dragState.pointerId === event.pointerId) {
      const svg = svgRef.current;
      if (svg?.hasPointerCapture(event.pointerId)) {
        svg.releasePointerCapture(event.pointerId);
      }
      setDragState(null);
      return;
    }

    if (!panState || panState.pointerId !== event.pointerId) return;

    const svg = svgRef.current;
    if (svg?.hasPointerCapture(event.pointerId)) {
      svg.releasePointerCapture(event.pointerId);
    }
    const movement = Math.hypot(
      event.clientX - panState.startClientX,
      event.clientY - panState.startClientY,
    );
    if (panState.button === 0 && (panState.hasMoved || movement > 4)) {
      suppressNextCanvasClick();
    }
    setPanState(null);
  }

  function handleNodeDragStart(event, node) {
    if (graphMode !== 'style') return;
    if (event.button !== 0) return;

    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    event.stopPropagation();
    svg.setPointerCapture(event.pointerId);
    const graphPoint = screenToGraphPoint(event);
    setDragState({
      pointerId: event.pointerId,
      nodeId: node.node_id,
      offsetX: graphPoint.x - node.x,
      offsetY: graphPoint.y - node.y,
    });
  }

  function handleConnectionStart(event, node) {
    if (graphMode !== 'edit') return;
    if (event.button !== 0) return;

    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    event.stopPropagation();
    setEditPrompt(null);
    svg.setPointerCapture(event.pointerId);
    const graphPoint = screenToGraphPoint(event);
    const draft = {
      pointerId: event.pointerId,
      source: node,
      active: false,
      startPoint: graphPoint,
      currentPoint: graphPoint,
      startClientX: event.clientX,
      startClientY: event.clientY,
    };
    setConnectionDraft(draft);
    clearConnectionTimer();
    connectionTimerRef.current = window.setTimeout(() => {
      setConnectionDraft((current) => (
        current && current.pointerId === event.pointerId
          ? { ...current, active: true }
          : current
      ));
    }, 220);
  }

  function handleCanvasClick(event) {
    if (suppressCanvasClickRef.current) {
      suppressCanvasClickRef.current = false;
      return;
    }

    if (graphMode === 'read') {
      onSelectRelationship(null);
      return;
    }

    if (graphMode === 'edit') {
      const graphPoint = screenToGraphPoint(event);
      setEditPrompt({
        kind: 'create',
        position: roundPoint(graphPoint),
        x: graphPoint.x,
        y: graphPoint.y,
      });
    }
  }

  function zoomCanvas(factor) {
    setViewBox((current) => zoomViewBoxAtPoint(current, factor, getViewBoxCenter(current)));
  }

  function clearConnectionTimer() {
    if (connectionTimerRef.current) {
      window.clearTimeout(connectionTimerRef.current);
      connectionTimerRef.current = null;
    }
  }

  function suppressNextCanvasClick() {
    suppressCanvasClickRef.current = true;
    window.setTimeout(() => {
      suppressCanvasClickRef.current = false;
    }, 160);
  }

  const canvasClassName = [
    'graph-canvas',
    `${graphMode}-mode`,
    panState ? 'middle-panning' : '',
    dragState ? 'node-dragging' : '',
  ].filter(Boolean).join(' ');
  const canSelect = graphMode === 'read';
  const canDragNodes = graphMode === 'style';
  const canEdit = graphMode === 'edit';

  return (
    <div className={canvasClassName}>
      <div className="canvas-actions">
        {GRAPH_MODES.map((mode) => (
          <button
            aria-label={mode.title}
            aria-pressed={graphMode === mode.id}
            className={graphMode === mode.id ? 'canvas-mode-button active' : 'canvas-mode-button'}
            data-mode={mode.id}
            key={mode.id}
            onClick={() => onGraphModeChange?.(mode.id)}
            title={mode.title}
            type="button"
          >
            <ModeIcon mode={mode.id} />
            <span>{mode.shortLabel}</span>
          </button>
        ))}
      </div>

      <div className="canvas-navigation">
        <button
          aria-label="Acercar grafo"
          onClick={() => zoomCanvas(0.84)}
          title="Acercar grafo"
          type="button"
        >
          <PlusIcon />
        </button>
        <button
          aria-label="Alejar grafo"
          onClick={() => zoomCanvas(1.18)}
          title="Alejar grafo"
          type="button"
        >
          <MinusIcon />
        </button>
        <button
          aria-label="Recentrar grafo"
          onClick={() => setViewBox(fitNodes(graphView.nodes))}
          title="Recentrar grafo"
          type="button"
        >
          <RecenterIcon />
        </button>
      </div>

      <svg
        aria-label="Visualizacion del grafo"
        className="graph-svg"
        onAuxClick={(event) => event.preventDefault()}
        onClick={handleCanvasClick}
        onPointerCancel={handlePointerUp}
        onPointerDown={handlePointerDown}
        onPointerMove={handlePointerMove}
        onPointerUp={handlePointerUp}
        onWheel={handleWheel}
        ref={svgRef}
        viewBox={`${viewBox.x} ${viewBox.y} ${viewBox.width} ${viewBox.height}`}
      >
        <defs>
          <marker
            id="arrow-end"
            markerHeight="7"
            markerWidth="7"
            orient="auto"
            refX="7"
            refY="3.5"
          >
            <path d="M0,0 L7,3.5 L0,7 Z" fill="var(--graph-edge-directional)" />
          </marker>
          <marker
            id="arrow-both-end"
            markerHeight="7"
            markerWidth="7"
            orient="auto"
            refX="7"
            refY="3.5"
          >
            <path d="M0,0 L7,3.5 L0,7 Z" fill="var(--graph-edge-bidirectional)" />
          </marker>
          <marker
            id="arrow-both-start"
            markerHeight="7"
            markerWidth="7"
            orient="auto"
            refX="0"
            refY="3.5"
          >
            <path d="M7,0 L0,3.5 L7,7 Z" fill="var(--graph-edge-bidirectional)" />
          </marker>
        </defs>
        <g className="relationships-layer">
          {graphView.relationships.map((relationship) => (
            <RelationshipLine
              canEdit={canEdit}
              isSelected={relationship.relationship_id === selectedRelationshipId}
              key={relationship.relationship_id}
              canSelect={canSelect}
              onEdit={(nextRelationship) =>
                onOpenRelationshipEditor?.(nextRelationship.relationship_id)
              }
              onSelect={onSelectRelationship}
              relationship={relationship}
              selectedNodeId={selectedNodeId}
            />
          ))}
        </g>

        <g className="nodes-layer">
          {graphView.nodes.map((node) => (
            <GraphNode
              isFocused={node.node_id === focusNodeId}
              isSelected={node.node_id === selectedNodeId}
              isDraggable={canDragNodes}
              isConnectable={canEdit}
              isDragging={dragState?.nodeId === node.node_id}
              key={node.node_id}
              node={node}
              onConnectionStart={handleConnectionStart}
              onDragStart={handleNodeDragStart}
              onSelect={(nodeId) => {
                if (!canSelect) return;
                onSelectNode(nodeId);
                onSelectRelationship(null);
              }}
            />
          ))}
        </g>

        {connectionDraft?.active ? (
          <path
            className="relationship relationship-draft"
            d={curvedPath(connectionDraft.source, connectionDraft.currentPoint, {
              trimTarget: false,
            })}
          />
        ) : null}

        {canEdit && editPrompt ? (
          <EditPrompt
            prompt={editPrompt}
            onOpen={() => {
              onOpenCreateNode?.({ position: editPrompt.position });
              setEditPrompt(null);
            }}
          />
        ) : null}
      </svg>
    </div>
  );
}

function RelationshipLine({
  relationship,
  selectedNodeId,
  isSelected,
  canSelect,
  canEdit,
  onEdit,
  onSelect,
}) {
  const style = RELATIONSHIP_STYLES[relationship.visual_type] || RELATIONSHIP_STYLES.DIRECTIONAL;
  const isConnected =
    relationship.source_id === selectedNodeId || relationship.target_id === selectedNodeId;
  const path = curvedPath(relationship.source, relationship.target);
  const strokeOpacity = isSelected
    ? 'var(--graph-edge-opacity-selected)'
    : isConnected
      ? 'var(--graph-edge-opacity-connected)'
      : 'var(--graph-edge-opacity-weak)';
  const baseStrokeWidth = style.width || 1.25;
  const markerEnd =
    style.marker === 'both'
      ? 'url(#arrow-both-end)'
      : style.marker === 'end'
        ? 'url(#arrow-end)'
        : undefined;
  const markerStart = style.marker === 'both' ? 'url(#arrow-both-start)' : undefined;

  return (
    <g className="relationship-group">
      <path
        className={canSelect || canEdit ? 'relationship-hitbox' : 'relationship-hitbox disabled'}
        d={path}
        onClick={(event) => {
          event.stopPropagation();
          if (canEdit) {
            onEdit(relationship);
            return;
          }
          if (!canSelect) return;
          onSelect(relationship.relationship_id);
        }}
      />
      <path
        className={style.dashed ? 'relationship dashed' : 'relationship'}
        d={path}
        markerEnd={markerEnd}
        markerStart={markerStart}
        stroke={style.color}
        strokeOpacity={strokeOpacity}
        strokeWidth={isSelected ? 2.6 : isConnected ? Math.max(2, baseStrokeWidth) : baseStrokeWidth}
      />
    </g>
  );
}

function GraphNode({
  node,
  isSelected,
  isFocused,
  isDraggable,
  isConnectable,
  isDragging,
  onConnectionStart,
  onDragStart,
  onSelect,
}) {
  const label = getPrimaryLabel(node);
  const style = NODE_STYLES[label] || NODE_STYLES.Chunk;
  const radius = nodeRadius(label);
  const titleLines = wrapNodeTitle(getNodeTitle(node));
  const firstLineY = -(radius + (titleLines.length > 1 ? 24 : 13));
  const titleHitbox = getNodeTitleHitbox(titleLines, firstLineY);
  const className = [
    'graph-node',
    isSelected ? 'selected' : '',
    isDraggable ? 'draggable' : '',
    isConnectable ? 'connectable' : '',
    isDragging ? 'dragging' : '',
  ].filter(Boolean).join(' ');

  return (
    <g
      className={className}
      onClick={(event) => {
        event.stopPropagation();
        onSelect(node.node_id);
      }}
      onPointerDown={(event) => {
        if (isConnectable) onConnectionStart(event, node);
        if (isDraggable) onDragStart(event, node);
      }}
      transform={`translate(${node.x}, ${node.y})`}
    >
      <circle
        className="node-circle-hitbox"
        r={radius + DEFAULT_INTERACTION_METRICS.circleExtra}
        style={{ '--node-circle-radius': `${radius}px` }}
      />
      <rect
        className="node-title-hitbox"
        height={titleHitbox.height + DEFAULT_INTERACTION_METRICS.titlePaddingY * 2}
        rx="4"
        style={{
          '--node-title-hitbox-base-height': `${titleHitbox.height}px`,
          '--node-title-hitbox-base-width': `${titleHitbox.width}px`,
          '--node-title-hitbox-base-x': `${titleHitbox.x}px`,
          '--node-title-hitbox-base-y': `${titleHitbox.y}px`,
        }}
        width={titleHitbox.width + DEFAULT_INTERACTION_METRICS.titlePaddingX * 2}
        x={titleHitbox.x - DEFAULT_INTERACTION_METRICS.titlePaddingX}
        y={titleHitbox.y - DEFAULT_INTERACTION_METRICS.titlePaddingY}
      />
      <circle
        className={isFocused ? 'node-shape focused' : 'node-shape'}
        fill={style.color}
        r={radius}
      />
      <text className="node-title" textAnchor="middle">
        {titleLines.map((line, index) => (
          <tspan key={`${node.node_id}-title-${index}`} x="0" y={firstLineY + index * TITLE_LINE_HEIGHT}>
            {line}
          </tspan>
        ))}
      </text>
    </g>
  );
}

function EditPrompt({ prompt, onOpen }) {
  return (
    <foreignObject
      className="graph-edit-prompt"
      height="26"
      width="68"
      x={prompt.x - 34}
      y={prompt.y - 34}
    >
      <button
        onClick={(event) => {
          event.stopPropagation();
          onOpen();
        }}
        onPointerDown={(event) => event.stopPropagation()}
        type="button"
      >
        + nuevo
      </button>
    </foreignObject>
  );
}

function curvedPath(source, target, options = {}) {
  const endpoints = getConnectionEndpoints(source, target, options);
  return `M ${endpoints.source.x} ${endpoints.source.y} L ${endpoints.target.x} ${endpoints.target.y}`;
}

function getConnectionEndpoints(source, target, options = {}) {
  const dx = target.x - source.x;
  const dy = target.y - source.y;
  const distance = Math.hypot(dx, dy) || 1;
  const unitX = dx / distance;
  const unitY = dy / distance;
  const sourceOffset = options.trimSource === false ? 0 : getConnectionOffset(source, distance);
  const targetOffset = options.trimTarget === false ? 0 : getConnectionOffset(target, distance);

  return {
    source: {
      x: source.x + unitX * sourceOffset,
      y: source.y + unitY * sourceOffset,
    },
    target: {
      x: target.x - unitX * targetOffset,
      y: target.y - unitY * targetOffset,
    },
  };
}

function getConnectionOffset(point, distance) {
  if (!point?.labels) return 0;
  return Math.min(distance / 2, nodeRadius(getPrimaryLabel(point)) + CONNECTION_NODE_GAP);
}

function screenPointToSvgPoint(svg, clientX, clientY) {
  const matrix = svg.getScreenCTM();
  if (!matrix) return null;

  try {
    const point = new DOMPoint(clientX, clientY).matrixTransform(matrix.inverse());
    return { x: point.x, y: point.y };
  } catch {
    return null;
  }
}

function screenDeltaToSvgDelta(svg, deltaX, deltaY) {
  const matrix = svg.getScreenCTM();
  if (!matrix) return null;

  try {
    const origin = new DOMPoint(0, 0).matrixTransform(matrix.inverse());
    const moved = new DOMPoint(deltaX, deltaY).matrixTransform(matrix.inverse());
    return {
      x: moved.x - origin.x,
      y: moved.y - origin.y,
    };
  } catch {
    return null;
  }
}

function findNodeAtPoint(nodes, point, excludedNodeId = '') {
  let closestNode = null;
  let closestDistance = Infinity;
  nodes.forEach((node) => {
    if (node.node_id === excludedNodeId) return;
    const distance = Math.hypot(node.x - point.x, node.y - point.y);
    if (distance < closestDistance) {
      closestNode = node;
      closestDistance = distance;
    }
  });
  return closestDistance <= 54 ? closestNode : null;
}

function roundPoint(point) {
  return {
    x: Math.round(point.x),
    y: Math.round(point.y),
  };
}

function getSafeNodePosition(nodeId, candidatePosition, nodes, metrics) {
  const movingNode = nodes.find((node) => node.node_id === nodeId);
  if (!movingNode) return candidatePosition;

  const currentScore = getNodeOverlapScore(movingNode, nodes, metrics);
  const candidateNode = {
    ...movingNode,
    x: candidatePosition.x,
    y: candidatePosition.y,
  };
  const candidateScore = getNodeOverlapScore(candidateNode, nodes, metrics);

  if (candidateScore === 0 || candidateScore <= currentScore) return candidatePosition;
  return null;
}

function getNodeOverlapScore(node, nodes, metrics) {
  const footprint = getNodeFootprint(node, metrics);
  return nodes.reduce((score, otherNode) => {
    if (otherNode.node_id === node.node_id) return score;
    return score + getFootprintOverlapScore(footprint, getNodeFootprint(otherNode, metrics));
  }, 0);
}

function getNodeFootprint(node, metrics = DEFAULT_INTERACTION_METRICS) {
  const label = getPrimaryLabel(node);
  const radius = nodeRadius(label);
  const titleLines = wrapNodeTitle(getNodeTitle(node));
  const firstLineY = -(radius + (titleLines.length > 1 ? 24 : 13));
  const titleBox = getNodeTitleHitbox(titleLines, firstLineY);
  const gap = metrics.minDragGap / 2;

  return {
    circle: {
      x: node.x,
      y: node.y,
      radius: radius + metrics.circleExtra + gap,
    },
    title: {
      x: node.x + titleBox.x - metrics.titlePaddingX - gap,
      y: node.y + titleBox.y - metrics.titlePaddingY - gap,
      width: titleBox.width + metrics.titlePaddingX * 2 + metrics.minDragGap,
      height: titleBox.height + metrics.titlePaddingY * 2 + metrics.minDragGap,
    },
  };
}

function getFootprintOverlapScore(a, b) {
  return (
    getCircleOverlapScore(a.circle, b.circle) +
    getCircleRectOverlapScore(a.circle, b.title) +
    getCircleRectOverlapScore(b.circle, a.title) +
    getRectOverlapScore(a.title, b.title)
  );
}

function getCircleOverlapScore(a, b) {
  const overlap = a.radius + b.radius - Math.hypot(a.x - b.x, a.y - b.y);
  return Math.max(0, overlap);
}

function getRectOverlapScore(a, b) {
  const xOverlap = Math.min(a.x + a.width, b.x + b.width) - Math.max(a.x, b.x);
  const yOverlap = Math.min(a.y + a.height, b.y + b.height) - Math.max(a.y, b.y);
  if (xOverlap <= 0 || yOverlap <= 0) return 0;
  return Math.min(xOverlap, yOverlap);
}

function getCircleRectOverlapScore(circle, rect) {
  const closestX = clamp(circle.x, rect.x, rect.x + rect.width);
  const closestY = clamp(circle.y, rect.y, rect.y + rect.height);
  const overlap = circle.radius - Math.hypot(circle.x - closestX, circle.y - closestY);
  return Math.max(0, overlap);
}

function getNodeTitleHitbox(titleLines, firstLineY) {
  const maxLineLength = Math.max(...titleLines.map((line) => line.length), 1);
  const width = Math.max(24, maxLineLength * TITLE_CHAR_WIDTH);
  const height = TITLE_FONT_SIZE + (titleLines.length - 1) * TITLE_LINE_HEIGHT;

  return {
    x: -width / 2,
    y: firstLineY - TITLE_FONT_SIZE,
    width,
    height,
  };
}

function getInteractionMetrics(svg) {
  if (!svg) return DEFAULT_INTERACTION_METRICS;
  const styles = window.getComputedStyle(svg);
  return {
    circleExtra: readCssPx(styles, '--graph-node-circle-hitbox-extra', 2),
    titlePaddingX: readCssPx(styles, '--graph-node-title-hitbox-padding-x', 2),
    titlePaddingY: readCssPx(styles, '--graph-node-title-hitbox-padding-y', 2),
    minDragGap: readCssPx(styles, '--graph-node-min-drag-gap', 8),
  };
}

function readCssPx(styles, propertyName, fallback) {
  const value = Number.parseFloat(styles.getPropertyValue(propertyName));
  return Number.isFinite(value) ? value : fallback;
}

function clamp(value, min, max) {
  return Math.min(max, Math.max(min, value));
}

function fitNodes(nodes) {
  if (!nodes.length) return DEFAULT_VIEWBOX;
  const xs = nodes.map((node) => node.x);
  const ys = nodes.map((node) => node.y);
  const minX = Math.min(...xs);
  const maxX = Math.max(...xs);
  const minY = Math.min(...ys);
  const maxY = Math.max(...ys);
  const centerX = (minX + maxX) / 2;
  const centerY = (minY + maxY) / 2;
  const width = Math.max(760, maxX - minX + 560);
  const height = Math.max(520, maxY - minY + 360);

  return {
    x: centerX - width / 2,
    y: centerY - height / 2,
    width,
    height,
  };
}

function centerOnNode(node) {
  return {
    x: node.x - 420,
    y: node.y - 280,
    width: 840,
    height: 560,
  };
}

function zoomViewBoxAtPoint(viewBox, factor, point) {
  const nextWidth = viewBox.width * factor;
  const nextHeight = viewBox.height * factor;
  const xRatio = (point.x - viewBox.x) / viewBox.width;
  const yRatio = (point.y - viewBox.y) / viewBox.height;
  return {
    x: point.x - nextWidth * xRatio,
    y: point.y - nextHeight * yRatio,
    width: nextWidth,
    height: nextHeight,
  };
}

function getViewBoxCenter(viewBox) {
  return {
    x: viewBox.x + viewBox.width / 2,
    y: viewBox.y + viewBox.height / 2,
  };
}

function getGraphLayoutKey(graph) {
  const nodes = graph?.nodes || [];
  const relationships = graph?.relationships || [];
  return JSON.stringify({
    nodes: nodes.map((node) => node.node_id),
    relationships: relationships.map((relationship) => relationship.relationship_id),
  });
}

function RecenterIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M12 5V2L7.5 6.5 12 11V8a4 4 0 1 1-4 4H5a7 7 0 1 0 7-7Z" />
      <path d="M12 16v6l4.5-4.5L12 13v3Z" />
    </svg>
  );
}

function PlusIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M11 5h2v6h6v2h-6v6h-2v-6H5v-2h6V5Z" />
    </svg>
  );
}

function MinusIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M5 11h14v2H5v-2Z" />
    </svg>
  );
}

function ModeIcon({ mode }) {
  if (mode === 'style') return <HandIcon />;
  if (mode === 'edit') return <EditIcon />;
  return <BookIcon />;
}

function BookIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M5 4.5c2.4 0 4.4.5 6 1.6v13.4c-1.6-1-3.6-1.5-6-1.5a2 2 0 0 1-2-2V6.5a2 2 0 0 1 2-2Z" />
      <path d="M19 4.5c-2.4 0-4.4.5-6 1.6v13.4c1.6-1 3.6-1.5 6-1.5a2 2 0 0 0 2-2V6.5a2 2 0 0 0-2-2Z" />
    </svg>
  );
}

function HandIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M8 11V5.8a1.3 1.3 0 0 1 2.6 0V11h1V4.8a1.3 1.3 0 0 1 2.6 0V11h1V6.3a1.3 1.3 0 0 1 2.6 0v6.5l.8-1.1a1.4 1.4 0 0 1 2.3 1.6l-3 5.1A5.2 5.2 0 0 1 14.4 21h-3.1A5.3 5.3 0 0 1 6 15.7V11a1 1 0 0 1 2 0Z" />
    </svg>
  );
}

function EditIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M4 17.7V21h3.3L18.8 9.5l-3.3-3.3L4 17.7Z" />
      <path d="m17 4.7 1.2-1.2a1.6 1.6 0 0 1 2.3 0 1.6 1.6 0 0 1 0 2.3L19.3 7 17 4.7Z" />
    </svg>
  );
}

function nodeRadius(label) {
  if (label === 'Document') return 12;
  if (label === 'Section') return 10;
  return 8;
}

function wrapNodeTitle(value) {
  const text = String(value || '').replace(/\s+/g, ' ').trim().slice(0, 40);
  if (!text) return ['Nodo'];
  if (text.length <= 22) return [text];

  const words = text.split(' ');
  const lines = ['', ''];

  words.forEach((word) => {
    const candidate = lines[0] ? `${lines[0]} ${word}` : word;
    if (candidate.length <= 22 || !lines[0]) {
      lines[0] = candidate;
      return;
    }
    lines[1] = lines[1] ? `${lines[1]} ${word}` : word;
  });

  return lines.filter(Boolean).slice(0, 2);
}

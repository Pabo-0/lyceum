import { useEffect, useMemo, useRef, useState } from 'react';

import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
  buildGraphView,
  getNodeTitle,
  getPrimaryLabel,
} from '../utils/graphModel.js';

const DEFAULT_VIEWBOX = { x: 0, y: 0, width: 1220, height: 780 };

export default function GraphCanvas({
  graph,
  filters,
  selectedNodeId,
  selectedRelationshipId,
  focusNodeId,
  onSelectNode,
  onSelectRelationship,
}) {
  const svgRef = useRef(null);
  const graphView = useMemo(() => buildGraphView(graph, filters), [graph, filters]);
  const [viewBox, setViewBox] = useState(DEFAULT_VIEWBOX);
  const [panState, setPanState] = useState(null);

  useEffect(() => {
    if (!graphView.nodes.length) {
      setViewBox(DEFAULT_VIEWBOX);
      return;
    }

    const focusedNode = graphView.nodeById.get(focusNodeId);
    setViewBox(focusedNode ? centerOnNode(focusedNode) : fitNodes(graphView.nodes));
  }, [graphView, focusNodeId]);

  if (!graph) {
    return (
      <div className="graph-empty">
        <p className="muted">Selecciona o sube un documento para ver su grafo.</p>
      </div>
    );
  }

  function screenToGraphPoint(event) {
    const rect = svgRef.current.getBoundingClientRect();
    return {
      x: viewBox.x + ((event.clientX - rect.left) / rect.width) * viewBox.width,
      y: viewBox.y + ((event.clientY - rect.top) / rect.height) * viewBox.height,
    };
  }

  function handleWheel(event) {
    event.preventDefault();
    const graphPoint = screenToGraphPoint(event);
    const factor = event.deltaY < 0 ? 0.88 : 1.12;
    setViewBox((current) => zoomViewBoxAtPoint(current, factor, graphPoint));
  }

  function handlePointerDown(event) {
    if (event.button !== 1) return;

    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    svg.setPointerCapture(event.pointerId);
    setPanState({
      pointerId: event.pointerId,
      startClientX: event.clientX,
      startClientY: event.clientY,
      startViewBox: viewBox,
    });
  }

  function handlePointerMove(event) {
    if (!panState || panState.pointerId !== event.pointerId) return;

    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    const rect = svg.getBoundingClientRect();
    const dx = ((event.clientX - panState.startClientX) / rect.width) * panState.startViewBox.width;
    const dy =
      ((event.clientY - panState.startClientY) / rect.height) * panState.startViewBox.height;

    setViewBox({
      ...panState.startViewBox,
      x: panState.startViewBox.x - dx,
      y: panState.startViewBox.y - dy,
    });
  }

  function handlePointerUp(event) {
    if (!panState || panState.pointerId !== event.pointerId) return;

    const svg = svgRef.current;
    if (svg?.hasPointerCapture(event.pointerId)) {
      svg.releasePointerCapture(event.pointerId);
    }
    setPanState(null);
  }

  return (
    <div className={panState ? 'graph-canvas middle-panning' : 'graph-canvas'}>
      <div className="canvas-actions">
        <button onClick={() => setViewBox((current) => zoomViewBox(current, 0.82))} type="button">
          +
        </button>
        <button onClick={() => setViewBox((current) => zoomViewBox(current, 1.18))} type="button">
          -
        </button>
        <button onClick={() => setViewBox(fitNodes(graphView.nodes))} type="button">
          Recentrar
        </button>
      </div>

      <svg
        aria-label="Visualizacion del grafo"
        className="graph-svg"
        onAuxClick={(event) => event.preventDefault()}
        onClick={() => onSelectRelationship(null)}
        onPointerCancel={handlePointerUp}
        onPointerDown={handlePointerDown}
        onPointerMove={handlePointerMove}
        onPointerUp={handlePointerUp}
        onWheel={handleWheel}
        ref={svgRef}
        viewBox={`${viewBox.x} ${viewBox.y} ${viewBox.width} ${viewBox.height}`}
      >
        <g className="relationships-layer">
          {graphView.relationships.map((relationship) => (
            <RelationshipLine
              isSelected={relationship.relationship_id === selectedRelationshipId}
              key={relationship.relationship_id}
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
              key={node.node_id}
              node={node}
              onSelect={(nodeId) => {
                onSelectNode(nodeId);
                onSelectRelationship(null);
              }}
            />
          ))}
        </g>
      </svg>
    </div>
  );
}

function RelationshipLine({ relationship, selectedNodeId, isSelected, onSelect }) {
  const style = RELATIONSHIP_STYLES[relationship.relationship_type] || RELATIONSHIP_STYLES.HAS_CHUNK;
  const isConnected =
    relationship.source_id === selectedNodeId || relationship.target_id === selectedNodeId;
  const path = curvedPath(relationship.source, relationship.target);

  return (
    <g className="relationship-group">
      <path
        className="relationship-hitbox"
        d={path}
        onClick={(event) => {
          event.stopPropagation();
          onSelect(relationship.relationship_id);
        }}
      />
      <path
        className={style.dashed ? 'relationship dashed' : 'relationship'}
        d={path}
        stroke={style.color}
        strokeOpacity={isConnected || isSelected ? 0.68 : 0.28}
        strokeWidth={isSelected ? 2.6 : isConnected ? 2 : 1.25}
      />
    </g>
  );
}

function GraphNode({ node, isSelected, isFocused, onSelect }) {
  const label = getPrimaryLabel(node);
  const style = NODE_STYLES[label] || NODE_STYLES.Chunk;
  const radius = nodeRadius(label);
  const titleLines = wrapNodeTitle(getNodeTitle(node));
  const firstLineY = -(radius + (titleLines.length > 1 ? 26 : 14));
  const hitboxY = firstLineY - 18;
  const hitboxHeight = Math.abs(hitboxY) + radius + 18;

  return (
    <g
      className={isSelected ? 'graph-node selected' : 'graph-node'}
      onClick={(event) => {
        event.stopPropagation();
        onSelect(node.node_id);
      }}
      transform={`translate(${node.x}, ${node.y})`}
    >
      <rect
        className="node-hitbox"
        height={hitboxHeight}
        rx="8"
        width="220"
        x="-110"
        y={hitboxY}
      />
      <circle
        className={isFocused ? 'node-shape focused' : 'node-shape'}
        fill={style.color}
        r={radius}
      />
      <text className="node-title" textAnchor="middle">
        {titleLines.map((line, index) => (
          <tspan key={`${node.node_id}-title-${index}`} x="0" y={firstLineY + index * 16}>
            {line}
          </tspan>
        ))}
      </text>
    </g>
  );
}

function curvedPath(source, target) {
  const dx = target.x - source.x;
  const dy = target.y - source.y;
  const curve = Math.max(90, Math.abs(dx) * 0.42);
  const lift = Math.max(-80, Math.min(80, dy * 0.16));
  return [
    `M ${source.x} ${source.y}`,
    `C ${source.x + curve} ${source.y + lift}`,
    `${target.x - curve} ${target.y - lift}`,
    `${target.x} ${target.y}`,
  ].join(' ');
}

function fitNodes(nodes) {
  if (!nodes.length) return DEFAULT_VIEWBOX;
  const xs = nodes.map((node) => node.x);
  const ys = nodes.map((node) => node.y);
  const minX = Math.min(...xs) - 220;
  const maxX = Math.max(...xs) + 280;
  const minY = Math.min(...ys) - 180;
  const maxY = Math.max(...ys) + 180;
  return {
    x: minX,
    y: minY,
    width: Math.max(760, maxX - minX),
    height: Math.max(520, maxY - minY),
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

function zoomViewBox(viewBox, factor) {
  const nextWidth = viewBox.width * factor;
  const nextHeight = viewBox.height * factor;
  return {
    x: viewBox.x + (viewBox.width - nextWidth) / 2,
    y: viewBox.y + (viewBox.height - nextHeight) / 2,
    width: nextWidth,
    height: nextHeight,
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

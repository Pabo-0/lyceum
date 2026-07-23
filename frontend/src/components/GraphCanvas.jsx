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
export default function GraphCanvas({
  graph,
  layoutResetVersion = 0,
  nodePositions = {},
  selectedNodeId,
  selectedRelationshipId,
  focusNodeId,
  onNodePositionChange,
  onOpenCreateNode,
  onOpenNodeEditor,
  onOpenRelationshipEditor,
  onCreateRelationship,
  onRequestReorganizeGraph,
  onSelectNode,
  onSelectRelationship,
}) {
  const svgRef = useRef(null);
  const suppressCanvasClickRef = useRef(false);
  const suppressNodeClickRef = useRef(false);
  const suppressNativeContextMenuRef = useRef(false);
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
  const [contextMenu, setContextMenu] = useState(null);
  const [isHelpOpen, setIsHelpOpen] = useState(false);
  const dragStateRef = useRef(null);
  const connectionDraftRef = useRef(null);

  useEffect(() => {
    if (!graphView.nodes.length) {
      setViewBox(DEFAULT_VIEWBOX);
      return;
    }

    const focusedNode = graphView.nodeById.get(focusNodeId);
    setViewBox(focusedNode ? centerOnNode(focusedNode) : fitNodes(graphView.nodes));
  }, [graphLayoutKey, focusNodeId, layoutResetVersion]);

  useEffect(() => {
    setContextMenu(null);
    setIsHelpOpen(false);
    dragStateRef.current = null;
    connectionDraftRef.current = null;
    setDragState(null);
    setConnectionDraft(null);
  }, [graphLayoutKey]);

  useEffect(() => {
    function preventDeferredNativeContextMenu(event) {
      if (!suppressNativeContextMenuRef.current) return;
      event.preventDefault();
      event.stopPropagation();
      suppressNativeContextMenuRef.current = false;
    }

    window.addEventListener('contextmenu', preventDeferredNativeContextMenu, true);
    return () => {
      window.removeEventListener('contextmenu', preventDeferredNativeContextMenu, true);
    };
  }, []);

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
    setContextMenu(null);
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
    const currentConnectionDraft = connectionDraftRef.current;
    if (currentConnectionDraft && currentConnectionDraft.pointerId === event.pointerId) {
      event.preventDefault();
      const graphPoint = screenToGraphPoint(event);
      const movement = Math.hypot(
        event.clientX - currentConnectionDraft.startClientX,
        event.clientY - currentConnectionDraft.startClientY,
      );
      const nextDraft = {
        ...currentConnectionDraft,
        active: currentConnectionDraft.active || movement > 8,
        currentPoint: graphPoint,
      };
      connectionDraftRef.current = nextDraft;
      setConnectionDraft(nextDraft);
      return;
    }

    const currentDragState = dragStateRef.current;
    if (currentDragState && currentDragState.pointerId === event.pointerId) {
      event.preventDefault();
      const graphPoint = screenToGraphPoint(event);
      const movement = Math.hypot(
        event.clientX - currentDragState.startClientX,
        event.clientY - currentDragState.startClientY,
      );
      const hasMoved = currentDragState.hasMoved || movement > 3;
      if (!hasMoved) return;
      if (!currentDragState.hasMoved) {
        currentDragState.hasMoved = true;
        setDragState({ ...currentDragState });
      }
      const candidatePosition = {
        x: Math.round(graphPoint.x - currentDragState.offsetX),
        y: Math.round(graphPoint.y - currentDragState.offsetY),
      };
      const safePosition = getSafeNodePosition(
        currentDragState.nodeId,
        candidatePosition,
        graphView.nodes,
        getInteractionMetrics(svgRef.current),
      );
      if (safePosition) {
        onNodePositionChange?.(currentDragState.nodeId, safePosition);
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
    const currentConnectionDraft = connectionDraftRef.current;
    if (currentConnectionDraft && currentConnectionDraft.pointerId === event.pointerId) {
      event.preventDefault();
      const svg = svgRef.current;
      const graphPoint = screenToGraphPoint(event);
      const targetNode = currentConnectionDraft.active
        ? findNodeAtPoint(graphView.nodes, graphPoint, currentConnectionDraft.source.node_id)
        : null;

      if (svg?.hasPointerCapture(event.pointerId)) {
        svg.releasePointerCapture(event.pointerId);
      }

      suppressNextCanvasClick();
      suppressNextNativeContextMenu();
      if (currentConnectionDraft.active) {
        if (targetNode) {
          onCreateRelationship?.({
            source_id: currentConnectionDraft.source.node_id,
            target_id: targetNode.node_id,
            relationship_type: 'RELATES',
            properties: {
              status: 'confirmed',
              reason: 'Conexion creada desde el canvas',
            },
          });
        } else {
          onOpenCreateNode?.({
            position: roundPoint(graphPoint),
            sourceNodeId: currentConnectionDraft.source.node_id,
          });
        }
      } else {
        openContextMenu(event, {
          kind: 'node',
          nodeId: currentConnectionDraft.source.node_id,
        });
      }
      connectionDraftRef.current = null;
      setConnectionDraft(null);
      return;
    }

    const currentDragState = dragStateRef.current;
    if (currentDragState && currentDragState.pointerId === event.pointerId) {
      const svg = svgRef.current;
      if (svg?.hasPointerCapture(event.pointerId)) {
        svg.releasePointerCapture(event.pointerId);
      }
      if (currentDragState.hasMoved) {
        suppressNextCanvasClick();
        suppressNextNodeClick();
      } else {
        event.preventDefault();
        suppressNextCanvasClick();
        suppressNextNodeClick();
        onSelectNode(currentDragState.nodeId);
        onSelectRelationship(null);
      }
      dragStateRef.current = null;
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
    if (event.button === 2) {
      handleConnectionStart(event, node);
      return;
    }

    if (event.button !== 0) return;

    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    event.stopPropagation();
    setContextMenu(null);
    svg.setPointerCapture(event.pointerId);
    const graphPoint = screenToGraphPoint(event);
    const nextDragState = {
      pointerId: event.pointerId,
      nodeId: node.node_id,
      offsetX: graphPoint.x - node.x,
      offsetY: graphPoint.y - node.y,
      hasMoved: false,
      startClientX: event.clientX,
      startClientY: event.clientY,
    };
    dragStateRef.current = nextDragState;
    setDragState(nextDragState);
  }

  function handleConnectionStart(event, node) {
    const svg = svgRef.current;
    if (!svg) return;

    event.preventDefault();
    event.stopPropagation();
    setContextMenu(null);
    svg.setPointerCapture(event.pointerId);
    const graphPoint = screenToGraphPoint(event);
    const nextDraft = {
      pointerId: event.pointerId,
      source: node,
      active: false,
      startPoint: graphPoint,
      currentPoint: graphPoint,
      startClientX: event.clientX,
      startClientY: event.clientY,
    };
    connectionDraftRef.current = nextDraft;
    setConnectionDraft(nextDraft);
  }

  function handleCanvasClick(event) {
    if (suppressCanvasClickRef.current) {
      suppressCanvasClickRef.current = false;
      return;
    }

    setContextMenu(null);
    onSelectRelationship(null);
  }

  function handleGraphContextMenuCapture(event) {
    event.preventDefault();
  }

  function handleCanvasContextMenu(event) {
    event.preventDefault();
    if (suppressNativeContextMenuRef.current) {
      suppressNativeContextMenuRef.current = false;
      return;
    }
    if (event.target !== svgRef.current) return;
    openContextMenu(event, {
      kind: 'create-node',
      position: roundPoint(screenToGraphPoint(event)),
    });
  }

  function openContextMenu(event, payload) {
    const rect = svgRef.current?.getBoundingClientRect();
    setContextMenu({
      ...payload,
      x: rect ? event.clientX - rect.left : event.clientX,
      y: rect ? event.clientY - rect.top : event.clientY,
    });
  }

  function zoomCanvas(factor) {
    setViewBox((current) => zoomViewBoxAtPoint(current, factor, getViewBoxCenter(current)));
  }

  function suppressNextCanvasClick() {
    suppressCanvasClickRef.current = true;
    window.setTimeout(() => {
      suppressCanvasClickRef.current = false;
    }, 160);
  }

  function suppressNextNodeClick() {
    suppressNodeClickRef.current = true;
    window.setTimeout(() => {
      suppressNodeClickRef.current = false;
    }, 160);
  }

  function suppressNextNativeContextMenu() {
    suppressNativeContextMenuRef.current = true;
    window.setTimeout(() => {
      suppressNativeContextMenuRef.current = false;
    }, 500);
  }

  function handleContextMenuAction() {
    if (!contextMenu) return;
    if (contextMenu.kind === 'node') {
      onOpenNodeEditor?.(contextMenu.nodeId);
    }
    if (contextMenu.kind === 'relationship') {
      onOpenRelationshipEditor?.(contextMenu.relationshipId);
    }
    if (contextMenu.kind === 'create-node') {
      onOpenCreateNode?.({ position: contextMenu.position });
    }
    setContextMenu(null);
  }

  const canvasClassName = [
    'graph-canvas',
    panState ? 'middle-panning' : '',
    dragState ? 'node-dragging' : '',
    connectionDraft?.active ? 'connection-dragging' : '',
  ].filter(Boolean).join(' ');

  return (
    <div className={canvasClassName} onContextMenuCapture={handleGraphContextMenuCapture}>
      <button
        aria-expanded={isHelpOpen}
        aria-label="Abrir guia de controles del grafo"
        className="canvas-help-button"
        onClick={() => setIsHelpOpen((current) => !current)}
        title="Guia de controles"
        type="button"
      >
        ?
      </button>

      {isHelpOpen ? (
        <GraphHelpPanel onClose={() => setIsHelpOpen(false)} />
      ) : null}

      <div className="canvas-navigation">
        <button
          aria-label="Reorganizar grafo"
          className="canvas-layout-button"
          onClick={onRequestReorganizeGraph}
          title="Reorganizar grafo"
          type="button"
        >
          <AutoLayoutIcon />
        </button>
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
        onContextMenu={handleCanvasContextMenu}
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
              isSelected={relationship.relationship_id === selectedRelationshipId}
              key={relationship.relationship_id}
              onContextMenu={(event, nextRelationship) => {
                event.preventDefault();
                event.stopPropagation();
                openContextMenu(event, {
                  kind: 'relationship',
                  relationshipId: nextRelationship.relationship_id,
                });
              }}
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
              isDragging={dragState?.nodeId === node.node_id}
              key={node.node_id}
              node={node}
              onContextMenu={(event, nextNode) => {
                event.preventDefault();
                if (suppressNativeContextMenuRef.current) {
                  suppressNativeContextMenuRef.current = false;
                  return;
                }
                event.stopPropagation();
                openContextMenu(event, {
                  kind: 'node',
                  nodeId: nextNode.node_id,
                });
              }}
              onDragStart={handleNodeDragStart}
              onSelect={(nodeId) => {
                if (suppressNodeClickRef.current) {
                  suppressNodeClickRef.current = false;
                  return;
                }
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
      </svg>

      {contextMenu ? (
        <div
          className="graph-context-menu"
          style={{
            left: contextMenu.x,
            top: contextMenu.y,
          }}
        >
          <button onClick={handleContextMenuAction} type="button">
            {contextMenu.kind === 'create-node' ? 'Nuevo nodo' : 'Editar'}
          </button>
        </div>
      ) : null}
    </div>
  );
}

function GraphHelpPanel({ onClose }) {
  return (
    <aside className="graph-help-panel" aria-label="Guia rapida del grafo">
      <header className="graph-help-header">
        <div>
          <p className="graph-help-eyebrow">Guia rapida</p>
          <h2>Controles del grafo</h2>
        </div>
        <button
          aria-label="Cerrar guia"
          className="graph-help-close"
          onClick={onClose}
          title="Cerrar guia"
          type="button"
        >
          <CloseIcon />
        </button>
      </header>

      <div className="graph-help-sections">
        <GraphHelpSection
          icon={<NavigateIcon />}
          items={[
            ['Zoom', 'Usa el scroll del mouse o los botones de la interfaz.'],
            ['Mover vista', 'Arrastra el fondo con click izquierdo o mantén pulsada la rueda del raton.'],
            ['Boton de mira', 'Centra todos los nodos visibles.'],
          ]}
          title="Navegacion"
        />
        <GraphHelpSection
          icon={<NodeHelpIcon />}
          items={[
            ['Abrir o seleccionar', 'Click izquierdo sobre el nodo.'],
            ['Mover nodo', 'Mantener click izquierdo y arrastrar.'],
            ['Editar nodo', 'Click derecho sobre el nodo.'],
          ]}
          title="Nodos"
        />
        <GraphHelpSection
          icon={<LinkHelpIcon />}
          items={[
            ['Editar conexion', 'Click derecho sobre la relacion.'],
            ['Crear relacion', 'Click derecho y arrastra de un nodo a otro.'],
            ['Crear nodo conectado', 'Click derecho y arrastra desde un nodo al vacio.'],
          ]}
          title="Relaciones"
        />
        <GraphHelpSection
          icon={<AutoLayoutIcon />}
          items={[
            ['Reorganizar', 'Calcula una posicion sugerida.'],
          ]}
          title="Organizacion"
        />
      </div>
    </aside>
  );
}

function GraphHelpSection({ icon, items, title }) {
  return (
    <section className="graph-help-section">
      <h3>
        <span aria-hidden="true" className="graph-help-section-icon">
          {icon}
        </span>
        {title}
      </h3>
      <dl>
        {items.map(([action, result]) => (
          <div className="graph-help-row" key={`${title}-${action}`}>
            <dt>{action}</dt>
            <dd>{result}</dd>
          </div>
        ))}
      </dl>
    </section>
  );
}

function RelationshipLine({
  relationship,
  selectedNodeId,
  isSelected,
  onContextMenu,
  onSelect,
}) {
  const style = RELATIONSHIP_STYLES[relationship.visual_type] || RELATIONSHIP_STYLES.CONTAINS;
  const isConnected =
    relationship.source_id === selectedNodeId || relationship.target_id === selectedNodeId;
  const path = curvedPath(relationship.source, relationship.target);
  const strokeOpacity = isSelected
    ? 'var(--graph-edge-opacity-selected)'
    : isConnected
      ? 'var(--graph-edge-opacity-connected)'
      : 'var(--graph-edge-opacity-weak)';
  const baseStrokeWidth = style.width || 1.25;
  const isBidirectional =
    relationship.properties?.bidirectional === true ||
    relationship.properties?.bidirectional === 'true';
  const markerMode =
    relationship.relationship_type === 'RELATES' && isBidirectional
      ? 'both'
      : style.marker;
  const markerEnd =
    markerMode === 'both'
      ? 'url(#arrow-both-end)'
      : markerMode === 'end'
        ? 'url(#arrow-end)'
        : undefined;
  const markerStart = markerMode === 'both' ? 'url(#arrow-both-start)' : undefined;

  return (
    <g className="relationship-group">
      <path
        className="relationship-hitbox"
        d={path}
        onClick={(event) => {
          event.stopPropagation();
          onSelect(relationship.relationship_id);
        }}
        onContextMenu={(event) => onContextMenu(event, relationship)}
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
  isDragging,
  onContextMenu,
  onDragStart,
  onSelect,
}) {
  const label = getPrimaryLabel(node);
  const style = NODE_STYLES[label] || NODE_STYLES.Content;
  const radius = nodeRadius(label);
  const titleLines = wrapNodeTitle(getNodeTitle(node));
  const firstLineY = -(radius + (titleLines.length > 1 ? 24 : 13));
  const titleHitbox = getNodeTitleHitbox(titleLines, firstLineY);
  const className = [
    'graph-node',
    isSelected ? 'selected' : '',
    isDragging ? 'dragging' : '',
  ].filter(Boolean).join(' ');

  return (
    <g
      className={className}
      onClick={(event) => {
        event.stopPropagation();
        onSelect(node.node_id);
      }}
      onContextMenu={(event) => onContextMenu(event, node)}
      onPointerDown={(event) => {
        onDragStart(event, node);
      }}
      transform={`translate(${node.x}, ${node.y})`}
    >
      <g className="graph-node-visual">
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
    </g>
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
      <path d="M11 2h2v3.05a7 7 0 0 1 5.95 5.95H22v2h-3.05A7 7 0 0 1 13 18.95V22h-2v-3.05A7 7 0 0 1 5.05 13H2v-2h3.05A7 7 0 0 1 11 5.05V2Zm1 5a5 5 0 1 0 0 10 5 5 0 0 0 0-10Z" />
      <path d="M12 9.4a2.6 2.6 0 1 1 0 5.2 2.6 2.6 0 0 1 0-5.2Z" />
    </svg>
  );
}

function AutoLayoutIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M12 2.4 14.2 7l5 .7-3.6 3.5.9 5-4.5-2.4-4.5 2.4.9-5L4.8 7.7l5-.7L12 2.4Z" />
      <path d="M5.5 18.5h13v2h-13v-2Z" />
    </svg>
  );
}

function CloseIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="m6.7 5.3 12 12-1.4 1.4-12-12 1.4-1.4Z" />
      <path d="m17.3 5.3 1.4 1.4-12 12-1.4-1.4 12-12Z" />
    </svg>
  );
}

function NavigateIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M4 11h13.2l-4.1-4.1L14.5 5 21 11.5 14.5 18l-1.4-1.9 4.1-4.1H4v-1Z" />
    </svg>
  );
}

function NodeHelpIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M12 4a4 4 0 0 1 3.86 3H20v2h-4.14A4 4 0 0 1 13 11.86V16h-2v-4.14A4 4 0 0 1 8.14 9H4V7h4.14A4 4 0 0 1 12 4Zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-1 12h2v2h-2v-2Z" />
    </svg>
  );
}

function LinkHelpIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24">
      <path d="M7 7.5a3 3 0 1 1 2.83 4H7.9a4.98 4.98 0 0 0 0-2h1.93A1 1 0 1 0 9.83 8H5.5a1 1 0 0 0 0 2H6v2h-.5a3 3 0 0 1 0-6h4.33A3 3 0 0 1 7 7.5Z" />
      <path d="M17 16.5a3 3 0 1 1-2.83-4h1.93a4.98 4.98 0 0 0 0 2h-1.93A1 1 0 1 0 14.17 16h4.33a1 1 0 1 0 0-2H18v-2h.5a3 3 0 0 1 0 6h-4.33A3 3 0 0 1 17 16.5Z" />
      <path d="M8 11h8v2H8v-2Z" />
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

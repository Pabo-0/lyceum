import { useState } from 'react';

import GraphEditDialog from '../components/GraphEditDialog.jsx';
import GraphCanvas from '../components/GraphCanvas.jsx';
import GraphControls from '../components/GraphControls.jsx';
import NodeContentPopover from '../components/NodeContentPopover.jsx';
import { isDedicatedContentNode } from '../utils/nodeContent.js';

export default function GraphPage({
  graph,
  focusNodeId,
  isLoading = false,
  layoutResetVersion = 0,
  nodePositions,
  selectedNodeId,
  selectedRelationshipId,
  onCreateNode,
  onUpdateNode,
  onDeleteNode,
  onCreateRelationship,
  onUpdateRelationship,
  onDeleteRelationship,
  onMergeNodes,
  onOpenNodeContent,
  onNodePositionChange,
  onRequestReorganizeGraph,
  onSelectNode,
  onSelectRelationship,
}) {
  const selectedNode = isLoading
    ? null
    : graph?.nodes?.find((node) => node.node_id === selectedNodeId);
  const [editDialog, setEditDialog] = useState(null);

  async function createRelationshipFromCanvas(payload) {
    await onCreateRelationship(payload);
    setEditDialog(null);
  }

  function handleSelectNode(nodeId) {
    const node = graph?.nodes?.find((candidate) => candidate.node_id === nodeId);
    if (isDedicatedContentNode(node)) {
      onSelectNode(nodeId);
      onSelectRelationship(null);
      onOpenNodeContent?.(nodeId);
      return;
    }
    onSelectNode(nodeId);
  }

  function handleOpenNodeEditor(nodeId) {
    onSelectNode('');
    onSelectRelationship(null);
    setEditDialog({ kind: 'node', nodeId });
  }

  function handleOpenRelationshipEditor(relationshipId) {
    onSelectNode('');
    onSelectRelationship(null);
    setEditDialog({ kind: 'relationship', relationshipId });
  }

  return (
    <section className="graph-page" aria-label="Grafo del documento">
      <div className="graph-layout">
        <section className="graph-workbench">
          {isLoading ? (
            <GraphLoadingState />
          ) : (
            <GraphCanvas
              focusNodeId={focusNodeId}
              graph={graph}
              layoutResetVersion={layoutResetVersion}
              nodePositions={nodePositions}
              onCreateRelationship={createRelationshipFromCanvas}
              onNodePositionChange={onNodePositionChange}
              onRequestReorganizeGraph={onRequestReorganizeGraph}
              onOpenCreateNode={(payload) =>
                setEditDialog({
                  kind: 'create-node',
                  position: payload.position,
                  sourceNodeId: payload.sourceNodeId || '',
                })
              }
              onOpenNodeEditor={handleOpenNodeEditor}
              onOpenRelationshipEditor={handleOpenRelationshipEditor}
              onSelectNode={handleSelectNode}
              onSelectRelationship={onSelectRelationship}
              selectedNodeId={selectedNodeId}
              selectedRelationshipId={selectedRelationshipId}
            />
          )}

          {isLoading ? null : (
            <>
              <GraphControls />
              <NodeContentPopover node={selectedNode} onClose={() => onSelectNode('')} />
            </>
          )}

          <GraphEditDialog
            action={isLoading ? null : editDialog}
            graph={graph}
            onClose={() => setEditDialog(null)}
            onCreateNode={onCreateNode}
            onCreateRelationship={onCreateRelationship}
            onDeleteNode={onDeleteNode}
            onDeleteRelationship={onDeleteRelationship}
            onMergeNodes={onMergeNodes}
            onNodePositionChange={onNodePositionChange}
            onUpdateNode={onUpdateNode}
            onUpdateRelationship={onUpdateRelationship}
          />
        </section>
      </div>
    </section>
  );
}

function GraphLoadingState() {
  return (
    <div className="graph-loading-state" role="status" aria-live="polite">
      <span className="graph-loading-spinner" aria-hidden="true" />
      <span>Cargando grafo...</span>
    </div>
  );
}

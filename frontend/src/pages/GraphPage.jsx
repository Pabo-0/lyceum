import { useState } from 'react';

import GraphEditDialog from '../components/GraphEditDialog.jsx';
import GraphCanvas from '../components/GraphCanvas.jsx';
import GraphControls from '../components/GraphControls.jsx';
import NodeContentPopover from '../components/NodeContentPopover.jsx';

export default function GraphPage({
  graph,
  graphMode,
  focusNodeId,
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
  onGraphModeChange,
  onNodePositionChange,
  onSelectNode,
  onSelectRelationship,
}) {
  const selectedNode = graph?.nodes?.find((node) => node.node_id === selectedNodeId);
  const [editDialog, setEditDialog] = useState(null);

  async function createRelationshipFromCanvas(payload) {
    await onCreateRelationship(payload);
    setEditDialog(null);
  }

  return (
    <section className="graph-page" aria-label="Grafo del documento">
      <div className="graph-layout">
        <section className="graph-workbench">
          <GraphCanvas
            focusNodeId={focusNodeId}
            graph={graph}
            graphMode={graphMode}
            nodePositions={nodePositions}
            onCreateRelationship={createRelationshipFromCanvas}
            onGraphModeChange={onGraphModeChange}
            onNodePositionChange={onNodePositionChange}
            onOpenCreateNode={(payload) =>
              setEditDialog({
                kind: 'create-node',
                position: payload.position,
                sourceNodeId: payload.sourceNodeId || '',
              })
            }
            onOpenNodeEditor={(nodeId) => setEditDialog({ kind: 'node', nodeId })}
            onOpenRelationshipEditor={(relationshipId) =>
              setEditDialog({ kind: 'relationship', relationshipId })
            }
            onSelectNode={onSelectNode}
            onSelectRelationship={onSelectRelationship}
            selectedNodeId={selectedNodeId}
            selectedRelationshipId={selectedRelationshipId}
          />

          <GraphControls />
          {graphMode === 'read' ? (
            <NodeContentPopover node={selectedNode} onClose={() => onSelectNode('')} />
          ) : null}

          {graphMode === 'edit' ? (
            <GraphEditDialog
              action={editDialog}
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
          ) : null}
        </section>
      </div>
    </section>
  );
}

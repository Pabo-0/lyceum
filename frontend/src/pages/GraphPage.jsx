import GraphCanvas from '../components/GraphCanvas.jsx';
import GraphControls from '../components/GraphControls.jsx';
import NodeContentPopover from '../components/NodeContentPopover.jsx';

export default function GraphPage({
  graph,
  filters,
  focusNodeId,
  selectedNodeId,
  selectedRelationshipId,
  onSelectNode,
  onSelectRelationship,
}) {
  const selectedNode = graph?.nodes?.find((node) => node.node_id === selectedNodeId);

  return (
    <section className="graph-page" aria-label="Grafo del documento">
      <div className="graph-layout">
        <section className="graph-workbench">
          <GraphCanvas
            filters={filters}
            focusNodeId={focusNodeId}
            graph={graph}
            onSelectNode={onSelectNode}
            onSelectRelationship={onSelectRelationship}
            selectedNodeId={selectedNodeId}
            selectedRelationshipId={selectedRelationshipId}
          />

          <GraphControls />
          <NodeContentPopover node={selectedNode} onClose={() => onSelectNode('')} />
        </section>
      </div>
    </section>
  );
}

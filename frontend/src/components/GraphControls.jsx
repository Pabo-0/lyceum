import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
} from '../utils/graphModel.js';

export default function GraphControls() {
  return (
    <div className="graph-legend" aria-label="Leyenda del grafo">
      <div className="legend">
        {Object.entries(NODE_STYLES).map(([label, style]) => (
          <span className="legend-item" key={label}>
            <span className="legend-dot" style={{ background: style.color }} />
            {style.label}
          </span>
        ))}
      </div>

      <div className="legend relationship-legend">
        {Object.entries(RELATIONSHIP_STYLES).map(([type, style]) => (
          <span className="legend-item" key={type}>
            <span
              className="legend-line"
              style={{ background: style.color, color: style.color }}
            />
            {style.label}
          </span>
        ))}
      </div>
    </div>
  );
}

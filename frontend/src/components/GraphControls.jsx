import { useState } from 'react';

import {
  NODE_STYLES,
  RELATIONSHIP_STYLES,
} from '../utils/graphModel.js';

export default function GraphControls() {
  const [isVisible, setIsVisible] = useState(true);

  if (!isVisible) {
    return (
      <button
        aria-label="Expandir leyenda"
        className="legend-toggle legend-toggle-collapsed"
        onClick={() => setIsVisible(true)}
        type="button"
      />
    );
  }

  return (
    <div className="graph-legend" aria-label="Leyenda del grafo">
      <button
        aria-label="Ocultar leyenda"
        className="legend-toggle legend-toggle-expanded"
        onClick={() => setIsVisible(false)}
        type="button"
      />
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
              className={style.dashed ? 'legend-line dashed' : 'legend-line'}
              style={{ background: style.color, color: style.color }}
            />
            {style.label}
          </span>
        ))}
      </div>
    </div>
  );
}

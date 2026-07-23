import { NODE_STYLES, getNodeTitle, getPrimaryLabel } from '../utils/graphModel.js';
import { isDedicatedContentNode } from '../utils/nodeContent.js';

export default function NodeContentPopover({ node, onClose }) {
  const nodeType = getPrimaryLabel(node);
  const nodeTypeStyle = NODE_STYLES[nodeType] || NODE_STYLES.Content;
  const infoGroups = getNodeInfoGroups(node);

  if (!node || isDedicatedContentNode(node)) return null;

  return (
    <aside className="node-reader-overlay" aria-label="Informacion del nodo">
      <article className="node-reader-page">
        <header className="node-reader-header">
          <button aria-label="Cerrar" className="node-reader-close" onClick={onClose} type="button">
            <CloseIcon />
          </button>
          <div className="node-reader-heading">
            <h2>{getNodeTitle(node)}</h2>
            <span className="node-type-tag node-reader-type-tag" style={{ '--node-type-color': nodeTypeStyle.color }}>
              <span className="node-type-dot" />
              {nodeTypeStyle.label || nodeType}
            </span>
          </div>
        </header>

        <div className="node-reader-body">
          {infoGroups.length ? (
            <div className="node-info-sections">
              {infoGroups.map((group) => (
                <section className="node-info-section" key={group.title}>
                  <h3>{group.title}</h3>
                  <dl>
                    {group.items.map((item) => (
                      <div className="node-info-row" key={`${group.title}-${item.label}`}>
                        <dt>{item.label}</dt>
                        <dd>{renderInfoValue(item)}</dd>
                      </div>
                    ))}
                  </dl>
                </section>
              ))}
            </div>
          ) : (
            <p className="node-info-empty">Este nodo no tiene informacion adicional.</p>
          )}
        </div>
      </article>
    </aside>
  );
}

function CloseIcon() {
  return (
    <svg aria-hidden="true" focusable="false" viewBox="0 0 24 24">
      <path d="M6.7 5.3 18.7 17.3" />
      <path d="M18.7 5.3 6.7 17.3" />
    </svg>
  );
}

function getNodeInfoGroups(node) {
  if (!node) return [];

  const nodeType = getPrimaryLabel(node);
  const properties = node.properties || {};
  const groups = [];

  if (nodeType === 'Document') {
    groups.push({
      title: 'Documento',
      items: compactInfoItems([
        infoItem('Tipo de fuente', firstValue(properties.source_type, 'upload')),
        infoItem('Extension', properties.source_extension),
        infoItem('Estado', properties.processing_status),
        infoItem('Paginas', properties.page_count),
        infoItem('Parrafos', properties.paragraph_count),
        infoItem('Palabras', properties.word_count, { formatter: formatNumber }),
        infoItem('Caracteres', properties.character_count, { formatter: formatNumber }),
      ]),
    });
  } else if (nodeType === 'Section') {
    groups.push({
      title: 'Estructura',
      items: compactInfoItems([
        infoItem('Nivel', properties.level),
        infoItem('Orden', properties.order),
        infoItem('Tipo de encabezado', properties.heading_type),
        infoItem('Numeracion', properties.numbering),
        infoItem('Linea inicial', firstValue(properties.start_line, properties.start_position)),
        infoItem('Linea final', firstValue(properties.end_line, properties.end_position)),
      ]),
    });
    groups.push({
      title: 'Contenido fuente',
      items: compactInfoItems([
        infoItem('Palabras', properties.word_count, { formatter: formatNumber }),
        infoItem('Caracteres', properties.character_count, { formatter: formatNumber }),
        infoItem('Secciones fuente', properties.source_section_count),
        infoItem('Chunks fuente', properties.source_chunk_count),
        infoItem('Metodo de compaccion', properties.compaction_method),
        infoItem('Titulos fuente', properties.source_section_titles),
      ]),
    });
  } else if (nodeType === 'Concept') {
    groups.push({
      title: 'Concepto',
      items: compactInfoItems([
        infoItem('Descripcion', properties.description),
        infoItem('Alias', properties.aliases),
        infoItem('Dominio', properties.domain),
      ]),
    });
  } else {
    groups.push({
      title: 'Informacion',
      items: compactInfoItems([
        infoItem('Orden', properties.order),
        infoItem('Creado', properties.created_at, { formatter: formatDate }),
        infoItem('Actualizado', properties.updated_at, { formatter: formatDate }),
        infoItem('Manual', properties.manual, { formatter: formatBoolean }),
        infoItem('Palabras', properties.word_count, { formatter: formatNumber }),
        infoItem('Caracteres', properties.character_count, { formatter: formatNumber }),
      ]),
    });
  }

  const identifierItems = compactInfoItems([
    infoItem('ID del nodo', node.node_id),
    infoItem('ID del documento', properties.document_id),
  ]);

  if (!['Document', 'Section', 'Concept'].includes(nodeType) && identifierItems.length) {
    groups.push({ title: 'Identificadores', items: identifierItems });
  }

  return groups
    .map((group) => ({
      ...group,
      items: group.items.filter((item) => !isTitleDuplicate(item, node)),
    }))
    .filter((group) => group.items.length);
}

function infoItem(label, value, options = {}) {
  return {
    label,
    type: options.type || '',
    value,
    formatter: options.formatter,
  };
}

function compactInfoItems(items) {
  return items.filter((item) => hasInfoValue(item.value));
}

function hasInfoValue(value) {
  if (Array.isArray(value)) return value.some(hasInfoValue);
  if (value === null || value === undefined) return false;
  if (typeof value === 'string') return value.trim().length > 0;
  return true;
}

function renderInfoValue(item) {
  const value = item.formatter ? item.formatter(item.value) : formatValue(item.value);

  if (item.type === 'url') {
    const href = String(item.value || '').trim();
    return (
      <a href={href} rel="noreferrer" target="_blank">
        {value}
      </a>
    );
  }

  return value;
}

function formatValue(value) {
  if (Array.isArray(value)) return value.filter(hasInfoValue).map(formatValue).join(', ');
  if (typeof value === 'boolean') return formatBoolean(value);
  return String(value);
}

function formatNumber(value) {
  const number = Number(value);
  if (!Number.isFinite(number)) return formatValue(value);
  return new Intl.NumberFormat('es-MX').format(number);
}

function formatBytes(value) {
  const bytes = Number(value);
  if (!Number.isFinite(bytes)) return formatValue(value);
  if (bytes < 1024) return `${bytes} B`;

  const units = ['KB', 'MB', 'GB'];
  let size = bytes / 1024;
  let unitIndex = 0;
  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex += 1;
  }
  return `${new Intl.NumberFormat('es-MX', { maximumFractionDigits: 1 }).format(size)} ${units[unitIndex]}`;
}

function formatDate(value) {
  const date = new Date(value);
  if (Number.isNaN(date.getTime())) return formatValue(value);
  return new Intl.DateTimeFormat('es-MX', {
    dateStyle: 'medium',
    timeStyle: 'short',
  }).format(date);
}

function formatPercent(value) {
  const number = Number(value);
  if (!Number.isFinite(number)) return formatValue(value);
  const normalized = number > 1 ? number / 100 : number;
  return new Intl.NumberFormat('es-MX', {
    maximumFractionDigits: 1,
    style: 'percent',
  }).format(normalized);
}

function formatBoolean(value) {
  return value ? 'Si' : 'No';
}

function firstValue(...values) {
  return values.find(hasInfoValue);
}

function isTitleDuplicate(item, node) {
  const title = getNodeTitle(node).trim();
  if (!title) return false;
  return String(item.value || '').trim() === title;
}

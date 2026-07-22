import katex from 'katex';
import 'katex/dist/katex.min.css';

const BLOCK_MATH_DELIMITER = '$$';
const KATEX_OPTIONS = {
  throwOnError: false,
  strict: false,
  trust: false,
  output: 'htmlAndMathml',
};

export default function MarkdownRenderer({ markdown = '' }) {
  const blocks = parseMarkdownBlocks(markdown);

  if (!blocks.length) {
    return <p className="markdown-empty">Sin contenido.</p>;
  }

  return (
    <div className="markdown-content">
      {blocks.map((block, index) => renderBlock(block, index))}
    </div>
  );
}

export function markdownToPlainText(markdown = '') {
  return String(markdown || '')
    .replace(/```[\s\S]*?```/g, (match) => match.replace(/```[^\n]*\n?|\n?```/g, ' '))
    .replace(/\$\$([\s\S]*?)\$\$/g, '$1')
    .replace(/!\[([^\]]*)\]\([^)]+\)/g, '$1')
    .replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/[*_~>#-]/g, ' ')
    .replace(/\|/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

export function markdownToContentDocument(markdown = '') {
  return {
    type: 'doc',
    content: parseMarkdownBlocks(markdown).map(markdownBlockToDocumentNode),
  };
}

function parseMarkdownBlocks(markdown) {
  const lines = String(markdown || '').replace(/\r\n/g, '\n').split('\n');
  const blocks = [];
  let index = 0;

  while (index < lines.length) {
    const line = lines[index];

    if (!line.trim()) {
      index += 1;
      continue;
    }

    if (line.trim().startsWith('```')) {
      const language = line.trim().slice(3).trim();
      const codeLines = [];
      index += 1;
      while (index < lines.length && !lines[index].trim().startsWith('```')) {
        codeLines.push(lines[index]);
        index += 1;
      }
      if (index < lines.length) index += 1;
      blocks.push({ type: 'code', language, text: codeLines.join('\n') });
      continue;
    }

    if (line.trim() === BLOCK_MATH_DELIMITER) {
      const mathLines = [];
      index += 1;
      while (index < lines.length && lines[index].trim() !== BLOCK_MATH_DELIMITER) {
        mathLines.push(lines[index]);
        index += 1;
      }
      if (index < lines.length) index += 1;
      blocks.push({ type: 'math', text: mathLines.join('\n') });
      continue;
    }

    const headingMatch = line.match(/^(#{1,6})\s+(.+)$/);
    if (headingMatch) {
      blocks.push({
        type: 'heading',
        level: headingMatch[1].length,
        text: headingMatch[2].trim(),
      });
      index += 1;
      continue;
    }

    if (/^\s*([-*_])(?:\s*\1){2,}\s*$/.test(line)) {
      blocks.push({ type: 'hr' });
      index += 1;
      continue;
    }

    if (/^\s*>/.test(line)) {
      const quoteLines = [];
      while (index < lines.length && /^\s*>/.test(lines[index])) {
        quoteLines.push(lines[index].replace(/^\s*>\s?/, ''));
        index += 1;
      }
      blocks.push({ type: 'blockquote', blocks: parseMarkdownBlocks(quoteLines.join('\n')) });
      continue;
    }

    if (isTableStart(lines, index)) {
      const header = splitTableRow(lines[index]);
      const alignments = splitTableRow(lines[index + 1]).map(parseAlignment);
      const rows = [];
      index += 2;
      while (index < lines.length && isTableRow(lines[index])) {
        rows.push(splitTableRow(lines[index]));
        index += 1;
      }
      blocks.push({ type: 'table', header, alignments, rows });
      continue;
    }

    if (isListLine(line)) {
      const ordered = /^\s*\d+\.\s+/.test(line);
      const items = [];
      while (index < lines.length && isListLine(lines[index], ordered)) {
        const item = parseListItem(lines[index], ordered);
        items.push(item);
        index += 1;
      }
      blocks.push({ type: ordered ? 'ordered-list' : 'unordered-list', items });
      continue;
    }

    const paragraphLines = [line.trim()];
    index += 1;
    while (
      index < lines.length &&
      lines[index].trim() &&
      !startsMarkdownBlock(lines, index)
    ) {
      paragraphLines.push(lines[index].trim());
      index += 1;
    }
    blocks.push({ type: 'paragraph', text: paragraphLines.join(' ') });
  }

  return blocks;
}

function startsMarkdownBlock(lines, index) {
  const line = lines[index];
  return (
    line.trim().startsWith('```') ||
    line.trim() === BLOCK_MATH_DELIMITER ||
    /^(#{1,6})\s+/.test(line) ||
    /^\s*>/.test(line) ||
    /^\s*([-*_])(?:\s*\1){2,}\s*$/.test(line) ||
    isListLine(line) ||
    isTableStart(lines, index)
  );
}

function isListLine(line, expectedOrdered = null) {
  const unordered = /^\s*[-*+]\s+/.test(line);
  const ordered = /^\s*\d+\.\s+/.test(line);
  if (expectedOrdered === true) return ordered;
  if (expectedOrdered === false) return unordered;
  return unordered || ordered;
}

function parseListItem(line, ordered) {
  const markerPattern = ordered ? /^\s*\d+\.\s+/ : /^\s*[-*+]\s+/;
  let text = line.replace(markerPattern, '');
  const checkedMatch = text.match(/^\[( |x|X)\]\s+(.*)$/);
  if (!checkedMatch) return { text, checked: null };

  text = checkedMatch[2];
  return { text, checked: checkedMatch[1].toLowerCase() === 'x' };
}

function isTableStart(lines, index) {
  return isTableRow(lines[index]) && index + 1 < lines.length && isTableDivider(lines[index + 1]);
}

function isTableRow(line = '') {
  return line.includes('|') && splitTableRow(line).length > 1;
}

function isTableDivider(line = '') {
  const cells = splitTableRow(line);
  return cells.length > 1 && cells.every((cell) => /^:?-{3,}:?$/.test(cell.trim()));
}

function splitTableRow(line) {
  return line
    .trim()
    .replace(/^\|/, '')
    .replace(/\|$/, '')
    .split('|')
    .map((cell) => cell.trim());
}

function parseAlignment(cell) {
  const value = cell.trim();
  if (value.startsWith(':') && value.endsWith(':')) return 'center';
  if (value.endsWith(':')) return 'right';
  return 'left';
}

function renderBlock(block, index) {
  if (block.type === 'heading') {
    const HeadingTag = `h${block.level}`;
    return <HeadingTag key={index}>{renderInline(block.text)}</HeadingTag>;
  }

  if (block.type === 'paragraph') {
    return <p key={index}>{renderInline(block.text)}</p>;
  }

  if (block.type === 'unordered-list' || block.type === 'ordered-list') {
    const ListTag = block.type === 'ordered-list' ? 'ol' : 'ul';
    return (
      <ListTag key={index} className={hasChecklist(block.items) ? 'contains-checklist' : undefined}>
        {block.items.map((item, itemIndex) => (
          <li className={item.checked === null ? undefined : 'task-list-item'} key={itemIndex}>
            {item.checked === null ? null : (
              <input checked={item.checked} readOnly type="checkbox" />
            )}
            <span>{renderInline(item.text)}</span>
          </li>
        ))}
      </ListTag>
    );
  }

  if (block.type === 'blockquote') {
    return <blockquote key={index}>{block.blocks.map(renderBlock)}</blockquote>;
  }

  if (block.type === 'code') {
    return (
      <pre className="markdown-code-block" key={index}>
        {block.language ? <span className="markdown-code-language">{block.language}</span> : null}
        <code>{block.text}</code>
      </pre>
    );
  }

  if (block.type === 'math') {
    return renderMath(block.text, true, index);
  }

  if (block.type === 'table') {
    return (
      <div className="markdown-table-scroll" key={index}>
        <table>
          <thead>
            <tr>
              {block.header.map((cell, cellIndex) => (
                <th align={block.alignments[cellIndex] || 'left'} key={cellIndex}>
                  {renderInline(cell)}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {block.rows.map((row, rowIndex) => (
              <tr key={rowIndex}>
                {block.header.map((_, cellIndex) => (
                  <td align={block.alignments[cellIndex] || 'left'} key={cellIndex}>
                    {renderInline(row[cellIndex] || '')}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    );
  }

  if (block.type === 'hr') {
    return <hr key={index} />;
  }

  return null;
}

function hasChecklist(items) {
  return items.some((item) => item.checked !== null);
}

function renderInline(text) {
  const parts = parseInlineParts(String(text || ''));
  return parts.map((part, index) => renderInlinePart(part, index));
}

function parseInlineParts(text) {
  const pattern = /(`[^`]+`|\$\$[^$]+\$\$|\$[^$\n]+\$|!\[[^\]]*\]\([^)]+\)|\[[^\]]+\]\([^)]+\)|\*\*[^*]+\*\*|__[^_]+__|~~[^~]+~~|\*[^*]+\*|_[^_]+_)/g;
  const parts = [];
  let lastIndex = 0;
  let match;

  while ((match = pattern.exec(text)) !== null) {
    if (match.index > lastIndex) {
      parts.push({ type: 'text', text: text.slice(lastIndex, match.index) });
    }
    parts.push(parseInlineToken(match[0]));
    lastIndex = match.index + match[0].length;
  }

  if (lastIndex < text.length) {
    parts.push({ type: 'text', text: text.slice(lastIndex) });
  }

  return parts;
}

function parseInlineToken(token) {
  if (token.startsWith('`')) return { type: 'code', text: token.slice(1, -1) };
  if (token.startsWith('$$')) return { type: 'math', text: token.slice(2, -2) };
  if (token.startsWith('$')) return { type: 'math', text: token.slice(1, -1) };
  if (token.startsWith('![')) {
    const match = token.match(/^!\[([^\]]*)\]\(([^)]+)\)$/);
    return { type: 'image', alt: match?.[1] || '', href: match?.[2] || '' };
  }
  if (token.startsWith('[')) {
    const match = token.match(/^\[([^\]]+)\]\(([^)]+)\)$/);
    return { type: 'link', text: match?.[1] || token, href: match?.[2] || '' };
  }
  if (token.startsWith('**') || token.startsWith('__')) {
    return { type: 'strong', text: token.slice(2, -2) };
  }
  if (token.startsWith('~~')) return { type: 'delete', text: token.slice(2, -2) };
  return { type: 'emphasis', text: token.slice(1, -1) };
}

function renderInlinePart(part, index) {
  if (part.type === 'text') return part.text;
  if (part.type === 'code') return <code key={index}>{part.text}</code>;
  if (part.type === 'math') return renderMath(part.text, false, index);
  if (part.type === 'strong') return <strong key={index}>{renderInline(part.text)}</strong>;
  if (part.type === 'emphasis') return <em key={index}>{renderInline(part.text)}</em>;
  if (part.type === 'delete') return <del key={index}>{renderInline(part.text)}</del>;
  if (part.type === 'link') {
    const href = safeHref(part.href);
    return href ? (
      <a href={href} key={index} rel="noreferrer" target="_blank">
        {renderInline(part.text)}
      </a>
    ) : part.text;
  }
  if (part.type === 'image') {
    const href = safeHref(part.href);
    return href ? <img alt={part.alt} key={index} src={href} /> : part.alt;
  }
  return part.text || '';
}

function renderMath(latex, displayMode, key) {
  try {
    const html = katex.renderToString(String(latex || ''), {
      ...KATEX_OPTIONS,
      displayMode,
    });
    const Tag = displayMode ? 'div' : 'span';
    return (
      <Tag
        className={displayMode ? 'markdown-math-block' : 'markdown-math-inline'}
        dangerouslySetInnerHTML={{ __html: html }}
        key={key}
      />
    );
  } catch {
    const Tag = displayMode ? 'div' : 'span';
    return (
      <Tag className={displayMode ? 'markdown-math-block is-invalid' : 'markdown-math-inline is-invalid'} key={key}>
        {latex}
      </Tag>
    );
  }
}

function safeHref(href = '') {
  const trimmed = href.trim();
  if (/^(https?:|mailto:)/i.test(trimmed)) return trimmed;
  if (trimmed.startsWith('#') || trimmed.startsWith('/')) return trimmed;
  return '';
}

function markdownBlockToDocumentNode(block) {
  if (block.type === 'heading') {
    return {
      type: 'heading',
      attrs: { level: block.level },
      content: [{ type: 'text', text: block.text }],
    };
  }
  if (block.type === 'code') return { type: 'codeBlock', attrs: { language: block.language }, text: block.text };
  if (block.type === 'math') return { type: 'mathBlock', text: block.text };
  if (block.type === 'table') return { type: 'table', rows: [block.header, ...block.rows] };
  if (block.type === 'unordered-list' || block.type === 'ordered-list') {
    return {
      type: block.type,
      content: block.items.map((item) => ({ type: 'listItem', checked: item.checked, text: item.text })),
    };
  }
  if (block.type === 'blockquote') {
    return { type: 'blockquote', content: block.blocks.map(markdownBlockToDocumentNode) };
  }
  if (block.type === 'hr') return { type: 'horizontalRule' };
  return {
    type: 'paragraph',
    content: [{ type: 'text', text: block.text || '' }],
  };
}

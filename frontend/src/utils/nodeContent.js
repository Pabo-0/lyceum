import { getPrimaryLabel } from './graphModel.js';

const DEDICATED_CONTENT_NODE_TYPES = new Set(['Chunk', 'Content']);

export function isDedicatedContentNode(node) {
  return DEDICATED_CONTENT_NODE_TYPES.has(getPrimaryLabel(node));
}

export function getNodeContent(node) {
  const properties = node?.properties || {};
  return (
    properties.content_markdown ||
    properties.content_text ||
    properties.text ||
    properties.content ||
    properties.body ||
    ''
  );
}

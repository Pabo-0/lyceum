// List documents for a React document picker.
MATCH (d:Document)
RETURN
  d.document_id AS document_id,
  d.title AS title,
  d.source_extension AS source_extension,
  d.word_count AS word_count,
  d.processing_status AS processing_status
ORDER BY d.title;

// Get the reading graph for one document.
MATCH path = (d:Document {document_id: $document_id})-[:HAS_SECTION|HAS_SUBSECTION|HAS_CHUNK*1..]->(n)
RETURN path;

// Get sections and chunks for one document in a tabular shape.
MATCH (d:Document {document_id: $document_id})-[:HAS_SECTION|HAS_SUBSECTION*1..]->(s:Section)
OPTIONAL MATCH (s)-[:HAS_CHUNK]->(c:Chunk)
RETURN
  s.node_id AS section_node_id,
  s.title AS section_title,
  s.level AS section_level,
  s.order AS section_order,
  c.node_id AS chunk_node_id,
  c.text AS chunk_text,
  c.order AS chunk_order
ORDER BY section_order, chunk_order;

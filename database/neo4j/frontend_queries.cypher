// List documents for a React document picker.
MATCH (d:Document)
RETURN
  d.document_id AS document_id,
  d.title AS title,
  d.source_extension AS source_extension,
  d.word_count AS word_count,
  d.processing_status AS processing_status
ORDER BY d.title;

// Get sections and chunks for one document.
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

// Get concept mentions for one document.
MATCH (d:Document {document_id: $document_id})-[:HAS_SECTION|HAS_SUBSECTION*1..]->(:Section)-[:HAS_CHUNK]->(chunk:Chunk)
MATCH (chunk)-[mention:MENTIONS]->(concept:Concept)
RETURN
  chunk.node_id AS chunk_node_id,
  concept.node_id AS concept_node_id,
  concept.canonical_name AS canonical_name,
  concept.display_name AS display_name,
  mention.score AS score,
  mention.occurrence_count AS occurrence_count,
  mention.method AS method
ORDER BY canonical_name;

// Get semantic candidate relationships for one document.
MATCH (d:Document {document_id: $document_id})-[:HAS_SECTION|HAS_SUBSECTION*1..]->(:Section)-[:HAS_CHUNK]->(:Chunk)-[:MENTIONS]->(source:Concept)
MATCH (source)-[relationship:RELATED_TO|PREREQUISITE_CANDIDATE]->(target:Concept)
RETURN DISTINCT
  source.canonical_name AS source,
  type(relationship) AS relationship_type,
  target.canonical_name AS target,
  relationship.weight AS weight,
  relationship.confidence AS confidence,
  relationship.method AS method,
  relationship.source AS source_scope,
  relationship.reason AS reason
ORDER BY relationship.confidence DESC, relationship.weight DESC;

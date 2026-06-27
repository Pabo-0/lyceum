CREATE CONSTRAINT document_node_id IF NOT EXISTS
FOR (n:Document)
REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT section_node_id IF NOT EXISTS
FOR (n:Section)
REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT chunk_node_id IF NOT EXISTS
FOR (n:Chunk)
REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT concept_node_id IF NOT EXISTS
FOR (n:Concept)
REQUIRE n.node_id IS UNIQUE;

CREATE INDEX document_title IF NOT EXISTS
FOR (n:Document)
ON (n.title);

CREATE INDEX section_title IF NOT EXISTS
FOR (n:Section)
ON (n.title);

CREATE INDEX concept_canonical_name IF NOT EXISTS
FOR (n:Concept)
ON (n.canonical_name);

CREATE INDEX has_section_relationship_id IF NOT EXISTS
FOR ()-[r:HAS_SECTION]-()
ON (r.relationship_id);

CREATE INDEX has_subsection_relationship_id IF NOT EXISTS
FOR ()-[r:HAS_SUBSECTION]-()
ON (r.relationship_id);

CREATE INDEX has_chunk_relationship_id IF NOT EXISTS
FOR ()-[r:HAS_CHUNK]-()
ON (r.relationship_id);

CREATE INDEX mentions_relationship_id IF NOT EXISTS
FOR ()-[r:MENTIONS]-()
ON (r.relationship_id);

CREATE INDEX related_to_relationship_id IF NOT EXISTS
FOR ()-[r:RELATED_TO]-()
ON (r.relationship_id);

CREATE INDEX prerequisite_candidate_relationship_id IF NOT EXISTS
FOR ()-[r:PREREQUISITE_CANDIDATE]-()
ON (r.relationship_id);

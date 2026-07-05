CREATE CONSTRAINT document_node_id IF NOT EXISTS FOR (n:Document) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT section_node_id IF NOT EXISTS FOR (n:Section) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT chunk_node_id IF NOT EXISTS FOR (n:Chunk) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT concept_node_id IF NOT EXISTS FOR (n:Concept) REQUIRE n.node_id IS UNIQUE;

CREATE INDEX document_title IF NOT EXISTS FOR (n:Document) ON (n.title);

CREATE INDEX section_title IF NOT EXISTS FOR (n:Section) ON (n.title);

CREATE INDEX concept_title IF NOT EXISTS FOR (n:Concept) ON (n.title);

CREATE INDEX directional_relationship_id IF NOT EXISTS FOR ()-[r:DIRECTIONAL]-() ON (r.relationship_id);

CREATE INDEX bidirectional_relationship_id IF NOT EXISTS FOR ()-[r:BIDIRECTIONAL]-() ON (r.relationship_id);

CREATE INDEX semantic_relationship_id IF NOT EXISTS FOR ()-[r:SEMANTIC]-() ON (r.relationship_id);

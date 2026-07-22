CREATE CONSTRAINT document_node_id IF NOT EXISTS FOR (n:Document) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT section_node_id IF NOT EXISTS FOR (n:Section) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT content_node_id IF NOT EXISTS FOR (n:Content) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT chunk_node_id IF NOT EXISTS FOR (n:Chunk) REQUIRE n.node_id IS UNIQUE;

CREATE CONSTRAINT concept_node_id IF NOT EXISTS FOR (n:Concept) REQUIRE n.node_id IS UNIQUE;

CREATE INDEX document_title IF NOT EXISTS FOR (n:Document) ON (n.title);

CREATE INDEX section_title IF NOT EXISTS FOR (n:Section) ON (n.title);

CREATE INDEX content_title IF NOT EXISTS FOR (n:Content) ON (n.title);

CREATE INDEX chunk_title IF NOT EXISTS FOR (n:Chunk) ON (n.title);

CREATE INDEX concept_title IF NOT EXISTS FOR (n:Concept) ON (n.title);

CREATE INDEX contains_relationship_id IF NOT EXISTS FOR ()-[r:CONTAINS]-() ON (r.relationship_id);

CREATE INDEX relates_relationship_id IF NOT EXISTS FOR ()-[r:RELATES]-() ON (r.relationship_id);

CREATE INDEX depends_on_relationship_id IF NOT EXISTS FOR ()-[r:DEPENDS_ON]-() ON (r.relationship_id);

CREATE INDEX evaluates_relationship_id IF NOT EXISTS FOR ()-[r:EVALUATES]-() ON (r.relationship_id);

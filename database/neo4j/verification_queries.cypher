MATCH (n) RETURN labels(n) AS labels, count(n) AS count ORDER BY labels;

MATCH ()-[r]->() RETURN type(r) AS relationship_type, count(r) AS count ORDER BY relationship_type;

MATCH (d:Document)-[r:DIRECTIONAL]->(s:Section) WHERE r.role = "contains_section" RETURN d.title AS document, count(s) AS sections ORDER BY document;

MATCH (:Section)-[r:DIRECTIONAL]->(c:Chunk) WHERE r.role = "contains_chunk" RETURN count(c) AS chunks;

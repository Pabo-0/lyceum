MATCH (n) RETURN labels(n) AS labels, count(n) AS count ORDER BY labels;

MATCH ()-[r]->() RETURN type(r) AS relationship_type, count(r) AS count ORDER BY relationship_type;

MATCH (d:Document)-[r:CONTAINS]->(s:Section) WHERE r.role = "section" RETURN d.title AS document, count(s) AS sections ORDER BY document;

MATCH (:Section)-[r:CONTAINS]->(c:Chunk) WHERE r.role = "chunk" RETURN count(c) AS chunks;

MATCH (:Concept)-[r:RELATES|DEPENDS_ON]->(:Concept) RETURN type(r) AS relationship_type, count(r) AS count ORDER BY relationship_type;

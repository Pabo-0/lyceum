MATCH (n)
RETURN labels(n) AS labels, count(n) AS count
ORDER BY labels;

MATCH ()-[r]->()
RETURN type(r) AS relationship_type, count(r) AS count
ORDER BY relationship_type;

MATCH (d:Document)-[:HAS_SECTION]->(s:Section)
RETURN d.title AS document, count(s) AS sections
ORDER BY document;

MATCH (:Section)-[:HAS_CHUNK]->(c:Chunk)
RETURN count(c) AS chunks;

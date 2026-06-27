MATCH (n)
RETURN labels(n) AS labels, count(n) AS count
ORDER BY labels;

MATCH ()-[r]->()
RETURN type(r) AS relationship_type, count(r) AS count
ORDER BY relationship_type;

MATCH (d:Document)-[:HAS_SECTION]->(s:Section)
RETURN d.title AS document, count(s) AS sections
ORDER BY document;

MATCH (:Chunk)-[r:MENTIONS]->(:Concept)
RETURN count(r) AS chunk_mentions;

MATCH (:Concept)-[r:RELATED_TO]->(:Concept)
RETURN count(r) AS related_to_candidates;

MATCH (:Concept)-[r:PREREQUISITE_CANDIDATE]->(:Concept)
RETURN count(r) AS prerequisite_candidates;

from pathlib import Path
import json
import sys
import tempfile
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.neo4j_cypher import (
    build_neo4j_schema_cypher,
    graph_to_cypher,
    split_cypher_statements,
)
from document_processing.storage import DocumentStore
from scripts.export_neo4j_cypher import export_neo4j_cypher


class Neo4jCypherTests(unittest.TestCase):
    def test_builds_schema_and_graph_cypher(self) -> None:
        graph = {
            "nodes": [
                {
                    "node_id": "document:sample",
                    "labels": ["Document"],
                    "properties": {
                        "document_id": "sample",
                        "title": 'Sample "Graph"',
                        "word_count": 3,
                    },
                },
                {
                    "node_id": "section:sample:section-1",
                    "labels": ["Section"],
                    "properties": {
                        "section_id": "section-1",
                        "title": "1. Derivadas",
                    },
                },
                {
                    "node_id": "chunk:sample:chunk-1",
                    "labels": ["Chunk"],
                    "properties": {
                        "chunk_id": "chunk-1",
                        "text": "La derivada mide la tasa de cambio.",
                        "word_count": 7,
                    },
                },
            ],
            "relationships": [
                {
                    "relationship_id": "relationship:sample",
                    "relationship_type": "HAS_SECTION",
                    "source_id": "document:sample",
                    "target_id": "section:sample:section-1",
                    "properties": {"order": 1},
                },
                {
                    "relationship_id": "relationship:sample-chunk",
                    "relationship_type": "HAS_CHUNK",
                    "source_id": "section:sample:section-1",
                    "target_id": "chunk:sample:chunk-1",
                    "properties": {"order": 1},
                }
            ],
        }

        schema = build_neo4j_schema_cypher()
        cypher = graph_to_cypher(graph, include_schema=True)

        self.assertIn("CREATE CONSTRAINT document_node_id", schema)
        self.assertIn("MERGE (n:Document", cypher)
        self.assertIn("MERGE (n:Section", cypher)
        self.assertIn("MERGE (n:Chunk", cypher)
        self.assertIn("MERGE (source)-[r:HAS_SECTION", cypher)
        self.assertIn("MERGE (source)-[r:HAS_CHUNK", cypher)
        self.assertIn('title: "Sample \\"Graph\\""', cypher)
        self.assertNotIn("Concept", schema)
        self.assertNotIn("MENTIONS", schema)

    def test_splits_cypher_without_breaking_text_values(self) -> None:
        cypher = (
            'MERGE (n:Chunk {node_id: "chunk:1"}) '
            'SET n += {text: "Idea uno; idea dos"};\n'
            'MATCH (n {node_id: "chunk:1"}) RETURN n;'
        )

        statements = split_cypher_statements(cypher)

        self.assertEqual(len(statements), 2)
        self.assertIn("Idea uno; idea dos", statements[0])

    def test_exports_all_documents_cypher(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            store = DocumentStore(
                storage_path=root / "storage/documents.json",
                documents_dir=root / "storage/documents",
                originals_dir=root / "storage/originals",
                normalized_dir=root / "storage/normalized",
            )
            store.save_all(
                [
                    {
                        "document_id": "sample",
                        "title": "Sample",
                        "source_path": "sample.md",
                        "source_extension": ".md",
                        "processing_status": "neo4j_export_ready",
                        "document_dir": "storage/documents/sample",
                    }
                ]
            )
            document_dir = root / "storage/documents/sample"
            document_dir.mkdir(parents=True)
            (document_dir / "metadata.json").write_text(
                '{"document_id":"sample","title":"Sample"}',
                encoding="utf-8",
            )
            graph = {
                "nodes": [
                    {
                        "node_id": "document:sample",
                        "labels": ["Document"],
                        "properties": {"document_id": "sample", "title": "Sample"},
                    }
                ],
                "relationships": [],
                "node_count": 1,
                "relationship_count": 0,
            }
            required_files = {
                "normalization_report.json": "{}",
                "structure.json": "{}",
                "concepts.json": '{"concepts":[]}',
                "concept_mentions.json": '{"mentions":[]}',
                "canonical_concepts.json": '{"concepts":[]}',
                "normalized_concept_mentions.json": '{"mentions":[]}',
                "semantic_relationships.json": '{"relationships":[]}',
                "graph.json": json.dumps(graph),
                "original.txt": "Sample",
                "normalized.txt": "Sample",
            }
            for filename, content in required_files.items():
                (document_dir / filename).write_text(content, encoding="utf-8")

            summary = export_neo4j_cypher(store, root / "storage/neo4j")

            self.assertEqual(summary["document_count"], 1)
            self.assertTrue((root / "storage/neo4j/schema.cypher").exists())
            self.assertTrue((root / "storage/neo4j/all_documents.cypher").exists())
            self.assertTrue(
                (root / "storage/neo4j/verification_queries.cypher").exists()
            )


if __name__ == "__main__":
    unittest.main()

from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from scripts.migrate_graph_visual_model import migrate_graph


class GraphVisualModelMigrationTests(unittest.TestCase):
    def test_migrates_legacy_node_and_relationship_types(self) -> None:
        graph = {
            "nodes": [
                {
                    "node_id": "note:1",
                    "labels": ["Note"],
                    "properties": {"title": "Nota antigua"},
                },
                {
                    "node_id": "section:1",
                    "labels": ["Section"],
                    "properties": {"title": "Tema"},
                },
                {
                    "node_id": "chunk:1",
                    "labels": ["Chunk"],
                    "properties": {"title": "Parrafo"},
                },
            ],
            "relationships": [
                {
                    "relationship_id": "relationship:section",
                    "relationship_type": "HAS_CHUNK",
                    "source_id": "section:1",
                    "target_id": "chunk:1",
                    "properties": {"order": 1},
                },
                {
                    "relationship_id": "relationship:semantic",
                    "relationship_type": "RELATED_TO",
                    "source_id": "chunk:1",
                    "target_id": "note:1",
                    "properties": {"reason": "Legacy candidate"},
                },
            ],
        }

        migrated = migrate_graph(graph)

        self.assertEqual(migrated["nodes"][0]["labels"], ["Concept"])
        self.assertEqual(
            [relationship["relationship_type"] for relationship in migrated["relationships"]],
            ["DIRECTIONAL", "SEMANTIC"],
        )
        self.assertEqual(
            migrated["relationships"][0]["properties"]["role"],
            "contains_chunk",
        )
        self.assertEqual(
            migrated["relationship_counts_by_type"],
            {"DIRECTIONAL": 1, "SEMANTIC": 1},
        )
        self.assertEqual(migrated["node_counts_by_label"]["Concept"], 1)


if __name__ == "__main__":
    unittest.main()

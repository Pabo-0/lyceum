from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.concept_deduplicator import deduplicate_concepts
from document_processing.concept_extractor import extract_concepts
from document_processing.graph_builder import build_initial_graph
from document_processing.metadata import build_metadata
from document_processing.structural_segmenter import segment_structure


class GraphBuilderTests(unittest.TestCase):
    def test_builds_initial_graph_nodes_and_relationships(self) -> None:
        content = (
            "# Algebra lineal\n\n"
            "## 1. Vectores\n\n"
            "Los vectores tienen direccion y magnitud. "
            "Los vectores se representan en espacios vectoriales.\n"
        )
        structure = segment_structure(content)
        extraction = extract_concepts(structure, max_concepts=8)
        deduplication = deduplicate_concepts(extraction)
        metadata = build_metadata(
            Path("algebra.md"),
            content,
            content,
            processing_status="graph_built",
        )

        graph = build_initial_graph(metadata, structure, deduplication)
        relationship_types = {
            relationship.relationship_type
            for relationship in graph.relationships
        }

        self.assertEqual(graph.node_counts_by_label["Document"], 1)
        self.assertGreaterEqual(graph.node_counts_by_label["Section"], 2)
        self.assertGreaterEqual(graph.node_counts_by_label["Chunk"], 1)
        self.assertGreaterEqual(graph.node_counts_by_label["Concept"], 1)
        self.assertIn("HAS_SECTION", relationship_types)
        self.assertIn("HAS_SUBSECTION", relationship_types)
        self.assertIn("HAS_CHUNK", relationship_types)
        self.assertIn("MENTIONS", relationship_types)


if __name__ == "__main__":
    unittest.main()

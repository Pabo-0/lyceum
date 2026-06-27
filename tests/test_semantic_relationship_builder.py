from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.concept_deduplicator import deduplicate_concepts
from document_processing.concept_extractor import extract_concepts
from document_processing.semantic_relationship_builder import build_semantic_relationships
from document_processing.structural_segmenter import segment_structure


class SemanticRelationshipBuilderTests(unittest.TestCase):
    def test_builds_related_and_prerequisite_candidates(self) -> None:
        content = (
            "# Algebra lineal\n\n"
            "## 1. Vectores\n\n"
            "Los vectores tienen magnitud y direccion. "
            "Los vectores ayudan a representar datos.\n\n"
            "## 1.1 Bases vectoriales\n\n"
            "Las bases vectoriales organizan vectores y combinaciones lineales.\n"
        )
        structure = segment_structure(content)
        extraction = extract_concepts(structure, max_concepts=12)
        deduplication = deduplicate_concepts(extraction)

        result = build_semantic_relationships(structure, deduplication)
        relationship_types = {
            relationship.relationship_type
            for relationship in result.relationships
        }
        methods = set(result.methods)

        self.assertIn("RELATED_TO", relationship_types)
        self.assertIn("PREREQUISITE_CANDIDATE", relationship_types)
        self.assertIn("chunk_cooccurrence", methods)
        self.assertTrue(
            all(
                relationship.weight > 0
                and relationship.confidence > 0
                and relationship.reason
                for relationship in result.relationships
            )
        )


if __name__ == "__main__":
    unittest.main()

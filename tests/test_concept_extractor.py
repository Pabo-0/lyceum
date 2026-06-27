from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.concept_extractor import extract_concepts
from document_processing.ngram_generator import generate_candidate_terms
from document_processing.structural_segmenter import segment_structure
from document_processing.term_normalizer import normalize_term


class ConceptExtractorTests(unittest.TestCase):
    def test_normalizes_accents_and_edges(self) -> None:
        self.assertEqual(normalize_term("La Membrána celular."), "membrana celular")

    def test_generates_ngram_candidates_without_stopword_edges(self) -> None:
        candidates = generate_candidate_terms("La membrana celular regula transporte celular.")

        self.assertIn("membrana celular", candidates)
        self.assertIn("transporte celular", candidates)
        self.assertNotIn("la membrana", candidates)

    def test_extracts_concepts_and_mentions_from_chunks(self) -> None:
        content = (
            "# Biologia celular\n\n"
            "## 1. Membrana celular\n\n"
            "La membrana celular regula transporte celular. "
            "La membrana celular protege la celula.\n\n"
            "## 2. Energia celular\n\n"
            "La energia celular depende de mitocondrias y metabolismo celular.\n"
        )
        structure = segment_structure(content)

        result = extract_concepts(structure, max_concepts=12)
        concept_names = {concept.normalized_name for concept in result.concepts}

        self.assertIn("membrana celular", concept_names)
        self.assertIn("energia celular", concept_names)
        self.assertGreater(result.mention_count, 0)
        self.assertTrue(
            any(mention.normalized_name == "membrana celular" for mention in result.mentions)
        )


if __name__ == "__main__":
    unittest.main()

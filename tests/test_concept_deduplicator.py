from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.concept_deduplicator import (
    canonicalize_concept_name,
    deduplicate_concepts,
)
from document_processing.models import Concept, ConceptExtractionResult, ConceptMention


class ConceptDeduplicatorTests(unittest.TestCase):
    def test_canonicalizes_common_variants(self) -> None:
        self.assertEqual(canonicalize_concept_name("La derivada"), "derivada")
        self.assertEqual(canonicalize_concept_name("derivadas"), "derivada")
        self.assertEqual(canonicalize_concept_name("concepto de derivada"), "derivada")

    def test_groups_variants_and_preserves_mentions(self) -> None:
        concepts = [
            _concept("concept-1", "derivada", 0.5),
            _concept("concept-2", "derivadas", 0.4),
            _concept("concept-3", "limite", 0.3),
        ]
        mentions = [
            _mention("mention-1", "concept-1", "derivada", "chunk-1"),
            _mention("mention-2", "concept-2", "derivadas", "chunk-2"),
            _mention("mention-3", "concept-3", "limite", "chunk-2"),
        ]
        extraction = ConceptExtractionResult(
            concepts=concepts,
            mentions=mentions,
            concept_count=len(concepts),
            mention_count=len(mentions),
            extraction_methods=["test"],
        )

        result = deduplicate_concepts(extraction)
        names = {concept.canonical_name for concept in result.concepts}
        derivative = next(
            concept for concept in result.concepts if concept.canonical_name == "derivada"
        )

        self.assertEqual(names, {"derivada", "limite"})
        self.assertEqual(set(derivative.variant_terms), {"derivada", "derivadas"})
        self.assertEqual(result.mention_count, 3)


def _concept(concept_id: str, name: str, score: float) -> Concept:
    return Concept(
        concept_id=concept_id,
        name=name,
        normalized_name=name,
        score=score,
        frequency=1,
        document_frequency=1,
        section_frequency=1,
        chunk_frequency=1,
        extraction_method="test",
    )


def _mention(
    mention_id: str,
    concept_id: str,
    name: str,
    chunk_id: str,
) -> ConceptMention:
    return ConceptMention(
        mention_id=mention_id,
        concept_id=concept_id,
        normalized_name=name,
        text=name,
        section_id="section-1",
        chunk_id=chunk_id,
        score=0.1,
        occurrence_count=1,
        extraction_method="test",
    )


if __name__ == "__main__":
    unittest.main()

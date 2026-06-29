from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.chunk_title_extractor import build_chunk_titles
from document_processing.concept_deduplicator import deduplicate_concepts
from document_processing.concept_extractor import extract_concepts
from document_processing.structural_segmenter import segment_structure


class ChunkTitleExtractorTests(unittest.TestCase):
    def test_builds_unique_human_titles_without_graph_concepts(self) -> None:
        content = (
            "# Estrategias de aprendizaje autorregulado\n\n"
            "## 1. Planificacion\n\n"
            "La planificacion del aprendizaje define metas y recursos. "
            "Las estrategias de lectura ayudan a ordenar el estudio.\n\n"
            "La revision del progreso permite ajustar el esfuerzo. "
            "El monitoreo personal detecta dudas durante la actividad.\n"
        )
        structure = segment_structure(content, max_chunk_words=20)
        extraction = extract_concepts(structure, max_concepts=12)
        deduplication = deduplicate_concepts(extraction)

        titles = build_chunk_titles(structure, deduplication)
        title_values = [title.title for title in titles.values()]

        self.assertEqual(len(title_values), structure.chunk_count)
        self.assertEqual(len({title.lower() for title in title_values}), len(title_values))
        self.assertTrue(all(not title.startswith("chunk-") for title in title_values))


if __name__ == "__main__":
    unittest.main()

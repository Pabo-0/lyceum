from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.reading_graph_compactor import compact_structure_for_reading_graph
from document_processing.structural_segmenter import segment_structure


class ReadingGraphCompactorTests(unittest.TestCase):
    def test_compacts_dense_heading_structure_into_visible_sections(self) -> None:
        body = "# Documento de prueba\n\n"
        for index in range(1, 13):
            body += f"## {index}. Tema {index}\n\n"
            body += (
                "Este apartado explica una idea con suficiente detalle para "
                "probar la compactacion del grafo de lectura. "
            ) * 4
            body += "\n\n"
            body += f"### {index}.1 Detalle {index}\n\n"
            body += (
                "El detalle agrega contexto relacionado y ejemplos breves "
                "que no necesitan convertirse en otro tema visible. "
            ) * 3
            body += "\n\n"

        structure = segment_structure(body)
        compacted = compact_structure_for_reading_graph(
            structure,
            document_title="Documento de prueba",
            document_word_count=1600,
        )

        self.assertLessEqual(compacted.section_count, compacted.max_visible_sections)
        self.assertLess(compacted.section_count, structure.section_count)
        self.assertLess(compacted.chunk_count, structure.chunk_count)
        self.assertTrue(
            all(section.compaction_method == "merged_adjacent_sections" for section in compacted.sections)
        )
        self.assertTrue(
            any(chunk.source_chunk_ids and len(chunk.source_chunk_ids) > 1 for section in compacted.sections for chunk in section.chunks)
        )

    def test_merges_many_small_paragraphs_under_single_section(self) -> None:
        body = "# Documento\n\n" + "\n\n".join(
            f"Parrafo {index} con informacion breve sobre aprendizaje urbano y decisiones publicas."
            for index in range(1, 10)
        )
        structure = segment_structure(body)
        compacted = compact_structure_for_reading_graph(
            structure,
            document_title="Documento",
            document_word_count=130,
        )

        self.assertEqual(compacted.section_count, 1)
        self.assertLess(compacted.chunk_count, structure.chunk_count)


if __name__ == "__main__":
    unittest.main()

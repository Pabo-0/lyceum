from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.structural_segmenter import segment_structure


class StructuralSegmenterTests(unittest.TestCase):
    def test_detects_markdown_sections_subsections_and_chunks(self) -> None:
        content = (
            "# Documento\n\n"
            "## 1. Introduccion\n\n"
            "Primer parrafo.\n\n"
            "## 1.1 Detalle\n\n"
            "Segundo parrafo.\n"
        )

        structure = segment_structure(content)

        self.assertEqual(structure.section_count, 3)
        self.assertEqual(structure.subsection_count, 2)
        self.assertEqual(structure.chunk_count, 2)
        self.assertEqual(structure.sections[0].title, "Documento")
        self.assertEqual(structure.sections[1].parent_section_id, "section-1")
        self.assertEqual(structure.sections[2].parent_section_id, "section-2")
        self.assertEqual(structure.sections[1].chunks[0].text, "Primer parrafo.")

    def test_detects_numbered_plain_text_headings(self) -> None:
        content = (
            "Biologia celular\n\n"
            "1. Introduccion\n\n"
            "Texto inicial.\n\n"
            "1.1 Membrana celular\n\n"
            "Texto de detalle.\n"
        )

        structure = segment_structure(content)

        self.assertEqual(structure.section_count, 3)
        self.assertEqual(structure.sections[0].heading_type, "title_line")
        self.assertEqual(structure.sections[1].heading_type, "numbered")
        self.assertEqual(structure.sections[2].numbering, "1.1")
        self.assertEqual(structure.sections[1].parent_section_id, "section-1")
        self.assertEqual(structure.sections[2].parent_section_id, "section-2")


if __name__ == "__main__":
    unittest.main()

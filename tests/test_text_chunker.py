from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.structural_segmenter import segment_structure
from document_processing.text_chunker import split_text_into_chunks


class TextChunkerTests(unittest.TestCase):
    def test_keeps_short_paragraph_as_one_chunk(self) -> None:
        chunks = split_text_into_chunks("Un parrafo corto.", max_words=10)

        self.assertEqual(len(chunks), 1)
        self.assertEqual(chunks[0].chunk_type, "paragraph")
        self.assertEqual(chunks[0].word_count, 3)

    def test_splits_long_paragraph_by_word_limit(self) -> None:
        text = " ".join(f"palabra{i}" for i in range(1, 26))

        chunks = split_text_into_chunks(text, max_words=10)

        self.assertEqual(len(chunks), 3)
        self.assertTrue(all(chunk.word_count <= 10 for chunk in chunks))
        self.assertTrue(all(chunk.chunk_type == "split_paragraph" for chunk in chunks))
        self.assertEqual([chunk.word_count for chunk in chunks], [9, 9, 7])

    def test_structural_segmenter_keeps_chunks_attached_to_section(self) -> None:
        content = "# Documento\n\n## 1. Tema\n\n" + " ".join(
            f"palabra{i}" for i in range(1, 26)
        )

        structure = segment_structure(content, max_chunk_words=10)

        topic_section = structure.sections[1]
        self.assertEqual(structure.chunk_count, 3)
        self.assertEqual(len(topic_section.chunks), 3)
        self.assertEqual(topic_section.chunks[0].parent_section_id, topic_section.section_id)


if __name__ == "__main__":
    unittest.main()

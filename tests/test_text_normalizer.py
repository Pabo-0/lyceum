from pathlib import Path
import sys
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.text_normalizer import normalize_text


class TextNormalizerTests(unittest.TestCase):
    def test_normalizes_line_endings_spaces_and_control_characters(self) -> None:
        raw_content = "Titulo\r\n\r\nParrafo\tcon   espacios.\x00\r\n\r\n\r\nOtro parrafo.  "

        normalized = normalize_text(raw_content)

        self.assertEqual(
            normalized,
            "Titulo\n\nParrafo con espacios.\n\nOtro parrafo.\n",
        )


if __name__ == "__main__":
    unittest.main()

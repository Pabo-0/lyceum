from pathlib import Path
import sys
import tempfile
import unittest


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

from document_processing.ingest_pipeline import ingest_file
from document_processing.storage import DocumentStore


class DocumentStoreTests(unittest.TestCase):
    def test_stores_document_as_index_and_separate_parts(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            root = Path(temp_dir)
            source = root / "sample.md"
            source.write_text("# Sample\n\n## 1. Intro\n\nBody text.", encoding="utf-8")
            store = DocumentStore(
                storage_path=root / "storage/documents.json",
                documents_dir=root / "storage/documents",
                originals_dir=root / "storage/originals",
                normalized_dir=root / "storage/normalized",
            )

            document = ingest_file(source, store)
            document_id = document.metadata.document_id
            document_dir = root / "storage/documents" / document_id
            loaded = store.load_all()

            self.assertEqual(len(loaded), 1)
            self.assertTrue((document_dir / "metadata.json").exists())
            self.assertTrue((document_dir / "structure.json").exists())
            self.assertTrue((document_dir / "concepts.json").exists())
            self.assertTrue((document_dir / "concept_mentions.json").exists())
            self.assertTrue((document_dir / "canonical_concepts.json").exists())
            self.assertTrue((document_dir / "normalized_concept_mentions.json").exists())
            self.assertTrue((document_dir / "semantic_relationships.json").exists())
            self.assertTrue((document_dir / "graph.json").exists())
            self.assertTrue((document_dir / "original.txt").exists())
            self.assertTrue((document_dir / "normalized.txt").exists())
            self.assertEqual(loaded[0]["metadata"]["title"], "Sample")
            self.assertIn("structure", loaded[0])
            self.assertIn("concept_extraction", loaded[0])
            self.assertIn("concept_deduplication", loaded[0])
            self.assertIn("semantic_relationships", loaded[0])
            self.assertIn("graph", loaded[0])


if __name__ == "__main__":
    unittest.main()

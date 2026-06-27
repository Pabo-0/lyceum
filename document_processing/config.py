from pathlib import Path


SUPPORTED_EXTENSIONS = {".txt", ".md"}
DEFAULT_STORAGE_PATH = Path("data/storage/documents.json")
DEFAULT_DOCUMENTS_DIR = Path("data/storage/documents")
DEFAULT_ORIGINALS_DIR = Path("data/storage/originals")
DEFAULT_NORMALIZED_DIR = Path("data/storage/normalized")
DEFAULT_CHUNK_MAX_WORDS = 120
DEFAULT_CONCEPT_NGRAM_RANGE = (1, 3)
DEFAULT_MAX_CONCEPTS_PER_DOCUMENT = 25
DEFAULT_MAX_CONCEPTS_PER_CHUNK = 6
DEFAULT_MIN_CONCEPT_SCORE = 0.12

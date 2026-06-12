import json
from pathlib import Path
from typing import Any

from document_processing.config import DEFAULT_ORIGINALS_DIR, DEFAULT_STORAGE_PATH
from document_processing.models import StoredDocument


class DocumentStore:
    def __init__(
        self,
        storage_path: Path = DEFAULT_STORAGE_PATH,
        originals_dir: Path = DEFAULT_ORIGINALS_DIR,
    ) -> None:
        self.storage_path = storage_path
        self.originals_dir = originals_dir

    def load_all(self) -> list[dict[str, Any]]:
        if not self.storage_path.exists():
            return []

        with self.storage_path.open("r", encoding="utf-8") as file:
            data = json.load(file)

        if not isinstance(data, list):
            raise ValueError(f"Storage file must contain a list: {self.storage_path}")

        return data

    def save_all(self, documents: list[dict[str, Any]]) -> None:
        self.storage_path.parent.mkdir(parents=True, exist_ok=True)
        with self.storage_path.open("w", encoding="utf-8") as file:
            json.dump(documents, file, ensure_ascii=False, indent=2)
            file.write("\n")

    def upsert(self, document: StoredDocument) -> None:
        documents = self.load_all()
        document_data = document.to_dict()
        document_id = document.metadata.document_id

        without_current = [
            item
            for item in documents
            if item.get("metadata", {}).get("document_id") != document_id
        ]
        without_current.append(document_data)

        self.save_all(without_current)
        self.save_original_copy(document)

    def save_original_copy(self, document: StoredDocument) -> None:
        self.originals_dir.mkdir(parents=True, exist_ok=True)
        output_path = self.originals_dir / f"{document.metadata.document_id}.txt"
        output_path.write_text(document.original_content, encoding="utf-8")


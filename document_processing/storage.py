import json
from pathlib import Path
from typing import Any

from document_processing.config import (
    DEFAULT_DOCUMENTS_DIR,
    DEFAULT_NORMALIZED_DIR,
    DEFAULT_ORIGINALS_DIR,
    DEFAULT_STORAGE_PATH,
)
from document_processing.models import StoredDocument


class DocumentStore:
    def __init__(
        self,
        storage_path: Path = DEFAULT_STORAGE_PATH,
        documents_dir: Path = DEFAULT_DOCUMENTS_DIR,
        originals_dir: Path = DEFAULT_ORIGINALS_DIR,
        normalized_dir: Path = DEFAULT_NORMALIZED_DIR,
    ) -> None:
        self.storage_path = storage_path
        self.documents_dir = documents_dir
        self.originals_dir = originals_dir
        self.normalized_dir = normalized_dir

    def load_all(self) -> list[dict[str, Any]]:
        if not self.storage_path.exists():
            return []

        with self.storage_path.open("r", encoding="utf-8") as file:
            data = json.load(file)

        if not isinstance(data, list):
            raise ValueError(f"Storage file must contain a list: {self.storage_path}")

        if self._is_index(data):
            return [self.load_document(item["document_id"]) for item in data]

        return data

    def save_all(self, documents: list[dict[str, Any]]) -> None:
        self.storage_path.parent.mkdir(parents=True, exist_ok=True)
        with self.storage_path.open("w", encoding="utf-8") as file:
            json.dump(documents, file, ensure_ascii=False, indent=2)
            file.write("\n")

    def upsert(self, document: StoredDocument) -> None:
        document_id = document.metadata.document_id
        self.save_document_parts(document)
        self.save_index_entry(document)

    def load_document(self, document_id: str) -> dict[str, Any]:
        document_dir = self.documents_dir / document_id
        metadata = self._read_json(document_dir / "metadata.json")
        normalization_report = self._read_json(document_dir / "normalization_report.json")
        structure = self._read_json(document_dir / "structure.json")
        concepts = self._read_optional_json(document_dir / "concepts.json", {"concepts": []})
        mentions = self._read_optional_json(
            document_dir / "concept_mentions.json",
            {"mentions": []},
        )
        concept_summary = self._read_optional_json(
            document_dir / "concept_extraction_summary.json",
            {
                "concept_count": len(concepts.get("concepts", [])),
                "mention_count": len(mentions.get("mentions", [])),
                "extraction_methods": [],
            },
        )
        canonical_concepts = self._read_optional_json(
            document_dir / "canonical_concepts.json",
            {"concepts": []},
        )
        normalized_mentions = self._read_optional_json(
            document_dir / "normalized_concept_mentions.json",
            {"mentions": []},
        )
        deduplication_summary = self._read_optional_json(
            document_dir / "concept_deduplication_summary.json",
            {
                "concept_count": len(canonical_concepts.get("concepts", [])),
                "mention_count": len(normalized_mentions.get("mentions", [])),
                "variant_count": 0,
                "normalization_methods": [],
            },
        )
        graph = self._read_optional_json(
            document_dir / "graph.json",
            {
                "nodes": [],
                "relationships": [],
                "node_count": 0,
                "relationship_count": 0,
                "node_counts_by_label": {},
                "relationship_counts_by_type": {},
            },
        )
        original_content = self._read_text(document_dir / "original.txt")
        normalized_content = self._read_text(document_dir / "normalized.txt")

        return {
            "metadata": metadata,
            "original_content": original_content,
            "normalized_content": normalized_content,
            "normalization_report": normalization_report,
            "structure": structure,
            "concept_extraction": {
                "concepts": concepts.get("concepts", []),
                "mentions": mentions.get("mentions", []),
                "concept_count": concept_summary.get(
                    "concept_count",
                    len(concepts.get("concepts", [])),
                ),
                "mention_count": concept_summary.get(
                    "mention_count",
                    len(mentions.get("mentions", [])),
                ),
                "extraction_methods": concept_summary.get("extraction_methods", []),
            },
            "concept_deduplication": {
                "concepts": canonical_concepts.get("concepts", []),
                "mentions": normalized_mentions.get("mentions", []),
                "concept_count": deduplication_summary.get(
                    "concept_count",
                    len(canonical_concepts.get("concepts", [])),
                ),
                "mention_count": deduplication_summary.get(
                    "mention_count",
                    len(normalized_mentions.get("mentions", [])),
                ),
                "variant_count": deduplication_summary.get("variant_count", 0),
                "normalization_methods": deduplication_summary.get(
                    "normalization_methods",
                    [],
                ),
            },
            "graph": graph,
        }

    def save_document_parts(self, document: StoredDocument) -> None:
        document_id = document.metadata.document_id
        document_dir = self.documents_dir / document_id
        document_dir.mkdir(parents=True, exist_ok=True)

        self._write_json(document_dir / "metadata.json", document.metadata.to_dict())
        self._write_json(
            document_dir / "normalization_report.json",
            document.normalization_report.to_dict(),
        )
        self._write_json(document_dir / "structure.json", document.structure.to_dict())
        concept_extraction = document.concept_extraction.to_dict()
        self._write_json(
            document_dir / "concepts.json",
            {"concepts": concept_extraction["concepts"]},
        )
        self._write_json(
            document_dir / "concept_mentions.json",
            {"mentions": concept_extraction["mentions"]},
        )
        self._write_json(
            document_dir / "concept_extraction_summary.json",
            {
                "concept_count": concept_extraction["concept_count"],
                "mention_count": concept_extraction["mention_count"],
                "extraction_methods": concept_extraction["extraction_methods"],
            },
        )
        concept_deduplication = document.concept_deduplication.to_dict()
        self._write_json(
            document_dir / "canonical_concepts.json",
            {"concepts": concept_deduplication["concepts"]},
        )
        self._write_json(
            document_dir / "normalized_concept_mentions.json",
            {"mentions": concept_deduplication["mentions"]},
        )
        self._write_json(
            document_dir / "concept_deduplication_summary.json",
            {
                "concept_count": concept_deduplication["concept_count"],
                "mention_count": concept_deduplication["mention_count"],
                "variant_count": concept_deduplication["variant_count"],
                "normalization_methods": concept_deduplication["normalization_methods"],
            },
        )
        self._write_json(document_dir / "graph.json", document.graph.to_dict())
        self._write_text(document_dir / "original.txt", document.original_content)
        self._write_text(document_dir / "normalized.txt", document.normalized_content)
        self._write_json(
            document_dir / "manifest.json",
            {
                "document_id": document_id,
                "metadata_path": "metadata.json",
                "normalization_report_path": "normalization_report.json",
                "structure_path": "structure.json",
                "concepts_path": "concepts.json",
                "concept_mentions_path": "concept_mentions.json",
                "concept_extraction_summary_path": "concept_extraction_summary.json",
                "canonical_concepts_path": "canonical_concepts.json",
                "normalized_concept_mentions_path": "normalized_concept_mentions.json",
                "concept_deduplication_summary_path": "concept_deduplication_summary.json",
                "graph_path": "graph.json",
                "original_content_path": "original.txt",
                "normalized_content_path": "normalized.txt",
            },
        )

        self.save_legacy_text_copies(document)

    def save_index_entry(self, document: StoredDocument) -> None:
        index = self.load_index()
        document_id = document.metadata.document_id
        source_path = document.metadata.source_path
        entry = {
            "document_id": document_id,
            "title": document.metadata.title,
            "source_path": document.metadata.source_path,
            "source_extension": document.metadata.source_extension,
            "processing_status": document.metadata.processing_status,
            "document_dir": (self.documents_dir / document_id).as_posix(),
            "metadata_path": (self.documents_dir / document_id / "metadata.json").as_posix(),
            "structure_path": (self.documents_dir / document_id / "structure.json").as_posix(),
            "concepts_path": (self.documents_dir / document_id / "concepts.json").as_posix(),
            "concept_mentions_path": (
                self.documents_dir / document_id / "concept_mentions.json"
            ).as_posix(),
            "canonical_concepts_path": (
                self.documents_dir / document_id / "canonical_concepts.json"
            ).as_posix(),
            "normalized_concept_mentions_path": (
                self.documents_dir / document_id / "normalized_concept_mentions.json"
            ).as_posix(),
            "graph_path": (self.documents_dir / document_id / "graph.json").as_posix(),
        }
        without_current = [
            item
            for item in index
            if item.get("document_id") != document_id
            and item.get("source_path") != source_path
        ]
        without_current.append(entry)
        self.save_all(without_current)

    def load_index(self) -> list[dict[str, Any]]:
        if not self.storage_path.exists():
            return []

        with self.storage_path.open("r", encoding="utf-8") as file:
            data = json.load(file)

        if not isinstance(data, list):
            raise ValueError(f"Storage file must contain a list: {self.storage_path}")

        if self._is_index(data):
            return data

        return [
            {
                "document_id": item["metadata"]["document_id"],
                "title": item["metadata"]["title"],
                "source_path": item["metadata"]["source_path"],
                "source_extension": item["metadata"]["source_extension"],
                "processing_status": item["metadata"]["processing_status"],
                "document_dir": (
                    self.documents_dir / item["metadata"]["document_id"]
                ).as_posix(),
                "metadata_path": (
                    self.documents_dir / item["metadata"]["document_id"] / "metadata.json"
                ).as_posix(),
                "structure_path": (
                    self.documents_dir / item["metadata"]["document_id"] / "structure.json"
                ).as_posix(),
                "concepts_path": (
                    self.documents_dir / item["metadata"]["document_id"] / "concepts.json"
                ).as_posix(),
                "concept_mentions_path": (
                    self.documents_dir
                    / item["metadata"]["document_id"]
                    / "concept_mentions.json"
                ).as_posix(),
                "canonical_concepts_path": (
                    self.documents_dir
                    / item["metadata"]["document_id"]
                    / "canonical_concepts.json"
                ).as_posix(),
                "normalized_concept_mentions_path": (
                    self.documents_dir
                    / item["metadata"]["document_id"]
                    / "normalized_concept_mentions.json"
                ).as_posix(),
                "graph_path": (
                    self.documents_dir / item["metadata"]["document_id"] / "graph.json"
                ).as_posix(),
            }
            for item in data
        ]

    def save_legacy_text_copies(self, document: StoredDocument) -> None:
        self.originals_dir.mkdir(parents=True, exist_ok=True)
        self.normalized_dir.mkdir(parents=True, exist_ok=True)

        document_id = document.metadata.document_id
        self._write_text(self.originals_dir / f"{document_id}.txt", document.original_content)
        self._write_text(
            self.normalized_dir / f"{document_id}.txt",
            document.normalized_content,
        )

    def _is_index(self, data: list[dict[str, Any]]) -> bool:
        return all(
            "document_id" in item and "metadata" not in item
            for item in data
        )

    def _read_json(self, path: Path) -> dict[str, Any]:
        with path.open("r", encoding="utf-8") as file:
            data = json.load(file)
        if not isinstance(data, dict):
            raise ValueError(f"JSON file must contain an object: {path}")
        return data

    def _read_optional_json(self, path: Path, default: dict[str, Any]) -> dict[str, Any]:
        if not path.exists():
            return default
        return self._read_json(path)

    def _write_json(self, path: Path, data: dict[str, Any]) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        with path.open("w", encoding="utf-8") as file:
            json.dump(data, file, ensure_ascii=False, indent=2)
            file.write("\n")

    def _read_text(self, path: Path) -> str:
        return path.read_text(encoding="utf-8")

    def _write_text(self, path: Path, content: str) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")

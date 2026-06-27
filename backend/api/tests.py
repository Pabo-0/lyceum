import json
import tempfile
from pathlib import Path

from django.test import Client, TestCase, override_settings


class ApiEndpointTests(TestCase):
    def setUp(self) -> None:
        self.temp_dir = tempfile.TemporaryDirectory()
        self.root = Path(self.temp_dir.name)
        self.override = override_settings(
            LYCEUM_STORAGE_PATH=self.root / "storage/documents.json",
            LYCEUM_DOCUMENTS_DIR=self.root / "storage/documents",
            LYCEUM_ORIGINALS_DIR=self.root / "storage/originals",
            LYCEUM_NORMALIZED_DIR=self.root / "storage/normalized",
            LYCEUM_UPLOADS_DIR=self.root / "uploads",
            LYCEUM_NEO4J_EXPORT_DIR=self.root / "storage/neo4j",
            NEO4J={
                "URI": "bolt://localhost:7687",
                "USER": "neo4j",
                "PASSWORD": "",
                "DATABASE": "",
                "SYNC_ON_INGEST": False,
            },
        )
        self.override.enable()
        self.client = Client()

    def tearDown(self) -> None:
        self.override.disable()
        self.temp_dir.cleanup()

    def test_document_endpoints_and_node_patch(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "calculo.md",
                    "content": (
                        "# Calculo diferencial\n\n"
                        "## 1. Derivadas\n\n"
                        "La derivada mide la tasa de cambio de una funcion.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(created.status_code, 201)
        created_body = created.json()
        document_id = created_body["document"]["metadata"]["document_id"]
        graph = created_body["document"]["graph"]
        node_id = graph["nodes"][0]["node_id"]

        listed = self.client.get("/documents/")
        self.assertEqual(listed.status_code, 200)
        self.assertEqual(len(listed.json()["documents"]), 1)

        detail = self.client.get(f"/documents/{document_id}/")
        self.assertEqual(detail.status_code, 200)
        self.assertEqual(detail.json()["document"]["metadata"]["document_id"], document_id)

        graph_response = self.client.get(f"/documents/{document_id}/graph/")
        self.assertEqual(graph_response.status_code, 200)
        self.assertGreater(graph_response.json()["graph"]["node_count"], 0)

        patched = self.client.patch(
            f"/nodes/{node_id}/",
            data=json.dumps({"properties": {"frontend_label": "Nodo visible"}}),
            content_type="application/json",
        )
        self.assertEqual(patched.status_code, 200)
        self.assertEqual(
            patched.json()["node"]["properties"]["frontend_label"],
            "Nodo visible",
        )

    def test_relationship_delete_endpoint(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "algebra.md",
                    "content": (
                        "# Algebra\n\n"
                        "## 1. Vectores\n\n"
                        "Los vectores se relacionan con matrices y espacios vectoriales.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        relationship_id = created.json()["document"]["graph"]["relationships"][0][
            "relationship_id"
        ]

        deleted = self.client.delete(f"/relationships/{relationship_id}/")

        self.assertEqual(deleted.status_code, 200)
        self.assertEqual(
            deleted.json()["deleted_relationship"]["relationship_id"],
            relationship_id,
        )

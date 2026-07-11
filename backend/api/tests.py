import json
import tempfile
from pathlib import Path
from urllib.parse import quote

from django.core.files.uploadedfile import SimpleUploadedFile
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
        returned_graph = graph_response.json()["graph"]
        self.assertGreater(returned_graph["node_count"], 0)
        self.assertNotIn("Concept", returned_graph["node_counts_by_label"])
        self.assertEqual(
            set(returned_graph["relationship_counts_by_type"]),
            {"DIRECTIONAL"},
        )

        patched = self.client.patch(
            f"/nodes/{quote(node_id, safe='')}/",
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

        deleted = self.client.delete(f"/relationships/{quote(relationship_id, safe='')}/")

        self.assertEqual(deleted.status_code, 200)
        self.assertEqual(
            deleted.json()["deleted_relationship"]["relationship_id"],
            relationship_id,
        )

    def test_document_delete_endpoint_removes_saved_backend_data(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "borrar.md",
                    "content": (
                        "# Documento para borrar\n\n"
                        "## 1. Tema\n\n"
                        "Este documento debe eliminarse completo.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(created.status_code, 201)
        created_body = created.json()
        document_id = created_body["document"]["metadata"]["document_id"]
        source_path = Path(created_body["document"]["metadata"]["source_path"])
        document_dir = self.root / "storage/documents" / document_id
        original_copy = self.root / "storage/originals" / f"{document_id}.txt"
        normalized_copy = self.root / "storage/normalized" / f"{document_id}.txt"

        self.assertTrue(source_path.exists())
        self.assertTrue(document_dir.exists())
        self.assertTrue(original_copy.exists())
        self.assertTrue(normalized_copy.exists())

        deleted = self.client.delete(f"/documents/{document_id}/")

        self.assertEqual(deleted.status_code, 200)
        deleted_body = deleted.json()
        self.assertEqual(deleted_body["deleted_document"]["document_id"], document_id)
        self.assertEqual(deleted_body["neo4j_export"]["document_count"], 0)
        self.assertTrue(deleted_body["upload_delete"]["deleted"])
        self.assertFalse(source_path.exists())
        self.assertFalse(document_dir.exists())
        self.assertFalse(original_copy.exists())
        self.assertFalse(normalized_copy.exists())

        listed = self.client.get("/documents/")
        self.assertEqual(listed.status_code, 200)
        self.assertEqual(listed.json()["documents"], [])

        missing_graph = self.client.get(f"/documents/{document_id}/graph/")
        self.assertEqual(missing_graph.status_code, 404)

    def test_document_rename_endpoint_updates_index_metadata_and_graph(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "renombrar.md",
                    "content": (
                        "# Titulo original\n\n"
                        "## 1. Tema\n\n"
                        "Este documento cambiara de nombre.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(created.status_code, 201)
        document_id = created.json()["document"]["metadata"]["document_id"]

        renamed = self.client.patch(
            f"/documents/{document_id}/",
            data=json.dumps({"title": "Nombre elegido por el usuario"}),
            content_type="application/json",
        )

        self.assertEqual(renamed.status_code, 200)
        renamed_body = renamed.json()
        self.assertEqual(renamed_body["document"]["metadata"]["title"], "Nombre elegido por el usuario")

        listed = self.client.get("/documents/")
        self.assertEqual(listed.status_code, 200)
        self.assertEqual(listed.json()["documents"][0]["title"], "Nombre elegido por el usuario")

        graph = self.client.get(f"/documents/{document_id}/graph/").json()["graph"]
        document_node = next(
            node for node in graph["nodes"] if "Document" in node["labels"]
        )
        self.assertEqual(document_node["properties"]["title"], "Nombre elegido por el usuario")

    def test_manual_graph_editing_endpoints(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "grafo.md",
                    "content": (
                        "# Grafo editable\n\n"
                        "## 1. Tema base\n\n"
                        "El usuario puede corregir nodos y relaciones.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        document_id = created.json()["document"]["metadata"]["document_id"]
        document_node_id = created.json()["document"]["graph"]["nodes"][0]["node_id"]

        first_node = self.client.post(
            f"/documents/{document_id}/nodes/",
            data=json.dumps(
                {
                    "labels": ["Concept"],
                    "properties": {
                        "title": "Concepto manual",
                        "text": "Contenido escrito por el usuario.",
                    },
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(first_node.status_code, 201)
        first_node_body = first_node.json()
        concept_id = first_node_body["node"]["node_id"]
        self.assertEqual(first_node_body["graph"]["node_counts_by_label"]["Concept"], 1)

        relabel_source = self.client.post(
            f"/documents/{document_id}/nodes/",
            data=json.dumps(
                {
                    "labels": ["Concept"],
                    "properties": {"title": "Temporal", "text": "Cambiara de tipo."},
                }
            ),
            content_type="application/json",
        )
        relabel_id = relabel_source.json()["node"]["node_id"]
        relabeled_node = self.client.patch(
            f"/nodes/{relabel_id}/",
            data=json.dumps(
                {
                    "labels": ["Chunk"],
                    "properties": {
                        "title": "Contenido manual",
                        "text": "Texto convertido en parrafo.",
                    },
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(relabeled_node.status_code, 200)
        self.assertEqual(relabeled_node.json()["node"]["labels"], ["Chunk"])
        self.assertEqual(
            relabeled_node.json()["node"]["properties"]["title"],
            "Contenido manual",
        )

        second_node = self.client.post(
            f"/documents/{document_id}/nodes/",
            data=json.dumps(
                {
                    "labels": ["Concept"],
                    "properties": {"title": "Concepto duplicado", "text": "Mas notas."},
                }
            ),
            content_type="application/json",
        )
        duplicate_id = second_node.json()["node"]["node_id"]

        relationship = self.client.post(
            f"/documents/{document_id}/relationships/",
            data=json.dumps(
                {
                    "source_id": document_node_id,
                    "target_id": concept_id,
                    "relationship_type": "SEMANTIC",
                    "properties": {"reason": "Relacion manual"},
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(relationship.status_code, 201)
        relationship_id = relationship.json()["relationship"]["relationship_id"]
        self.assertIn("SEMANTIC", relationship.json()["graph"]["relationship_counts_by_type"])

        changed = self.client.patch(
            f"/relationships/{quote(relationship_id, safe='')}/",
            data=json.dumps(
                {
                    "relationship_type": "DIRECTIONAL",
                    "properties": {"status": "confirmed"},
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(changed.status_code, 200)
        self.assertEqual(changed.json()["relationship"]["relationship_type"], "DIRECTIONAL")

        merged = self.client.post(
            f"/documents/{document_id}/nodes/merge/",
            data=json.dumps(
                {
                    "target_node_id": concept_id,
                    "source_node_ids": [duplicate_id],
                    "properties": {"title": "Concepto fusionado"},
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(merged.status_code, 200)
        self.assertEqual(merged.json()["node"]["properties"]["title"], "Concepto fusionado")
        self.assertEqual(merged.json()["graph"]["node_counts_by_label"]["Concept"], 1)

    def test_uploads_document_file(self) -> None:
        uploaded_file = SimpleUploadedFile(
            "biologia.md",
            (
                b"# Biologia celular\n\n"
                b"## 1. Membrana\n\n"
                b"La membrana celular regula el paso de sustancias.\n"
            ),
            content_type="text/markdown",
        )

        response = self.client.post("/documents/", {"file": uploaded_file})

        self.assertEqual(response.status_code, 201)
        body = response.json()
        self.assertEqual(body["document"]["metadata"]["source_extension"], ".md")
        self.assertGreater(body["document"]["graph"]["node_count"], 0)
        self.assertNotIn("Concept", body["document"]["graph"]["node_counts_by_label"])

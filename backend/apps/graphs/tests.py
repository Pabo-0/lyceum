import json
import tempfile
from pathlib import Path
from urllib.parse import quote

from django.contrib.auth import get_user_model
from django.core.files.uploadedfile import SimpleUploadedFile
from django.db import IntegrityError, transaction
from django.test import Client, TestCase, override_settings

from apps.graphs.models import (
    GraphSpace,
    GraphView,
    GraphViewNodePosition,
)
from apps.workspaces.models import UploadedAsset


class GeneralDatabaseModelTests(TestCase):
    def test_user_creation_creates_private_workspace(self) -> None:
        user_model = get_user_model()
        user = user_model.objects.create_user(
            username="pablo",
            password="test-password",
            locale="es-MX",
        )

        self.assertEqual(user.workspace.owner, user)
        self.assertEqual(user.workspace.slug, "pablo")
        self.assertEqual(user.workspace.default_language, "es-MX")

    def test_graph_view_constraints_keep_one_default_and_one_position_per_node(self) -> None:
        user = get_user_model().objects.create_user(username="ana")
        graph_space = GraphSpace.objects.create(
            workspace=user.workspace,
            title="Matematicas",
            graph_ref="graph-matematicas",
        )
        default_view = GraphView.objects.create(
            graph_space=graph_space,
            title="Vista principal",
            is_default=True,
        )

        with self.assertRaises(IntegrityError):
            with transaction.atomic():
                GraphView.objects.create(
                    graph_space=graph_space,
                    title="Otra vista por defecto",
                    is_default=True,
                )

        GraphViewNodePosition.objects.create(
            graph_view=default_view,
            node_id="node-1",
            x=10.0,
            y=-2.5,
        )

        with self.assertRaises(IntegrityError):
            with transaction.atomic():
                GraphViewNodePosition.objects.create(
                    graph_view=default_view,
                    node_id="node-1",
                    x=0.0,
                    y=0.0,
                )


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
            LYCEUM_GRAPH_BACKEND="file",
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
            {"CONTAINS"},
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

        document_delete = self.client.delete(f"/documents/{document_id}/")
        self.assertEqual(document_delete.status_code, 200)

        detail_after_delete = self.client.get(f"/documents/{document_id}/")
        self.assertEqual(detail_after_delete.status_code, 404)

    def test_document_nodes_cannot_be_deleted(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "redes.md",
                    "content": (
                        "# Redes neuronales\n\n"
                        "## 1. Capas\n\n"
                        "Una red conecta capas con pesos entrenables.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(created.status_code, 201)
        body = created.json()
        document_id = body["document"]["metadata"]["document_id"]
        document_node = next(
            node
            for node in body["document"]["graph"]["nodes"]
            if "Document" in node["labels"]
        )

        deleted = self.client.delete(f"/nodes/{quote(document_node['node_id'], safe='')}/")

        self.assertEqual(deleted.status_code, 400)
        self.assertEqual(deleted.json()["error"], "Document nodes cannot be deleted")

        detail = self.client.get(f"/documents/{document_id}/")
        self.assertEqual(detail.status_code, 200)

    def test_deleting_section_removes_child_sections_and_chunks(self) -> None:
        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "secciones.md",
                    "content": (
                        "# Documento con secciones\n\n"
                        "## 1. Primera seccion\n\n"
                        "La primera seccion tiene contenido suficiente para crear chunks.\n\n"
                        "## 2. Segunda seccion\n\n"
                        "La segunda seccion debe conservarse despues del borrado.\n"
                    ),
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(created.status_code, 201)
        graph = created.json()["document"]["graph"]
        document_id = created.json()["document"]["metadata"]["document_id"]
        node_by_id = {node["node_id"]: node for node in graph["nodes"]}
        section_id = next(
            node["node_id"]
            for node in graph["nodes"]
            if "Section" in node["labels"]
            and node["properties"].get("title") == "1. Primera seccion"
        )
        other_section_id = next(
            node["node_id"]
            for node in graph["nodes"]
            if "Section" in node["labels"]
            and node["properties"].get("title") == "2. Segunda seccion"
        )
        child_ids = {
            relationship["target_id"]
            for relationship in graph["relationships"]
            if relationship["source_id"] == section_id
            and relationship["relationship_type"] == "CONTAINS"
            and relationship.get("properties", {}).get("role") in {"subsection", "chunk"}
            and (
                "Section" in node_by_id[relationship["target_id"]]["labels"]
                or "Chunk" in node_by_id[relationship["target_id"]]["labels"]
            )
        }
        self.assertGreater(len(child_ids), 0)

        deleted = self.client.delete(f"/nodes/{quote(section_id, safe='')}/")

        self.assertEqual(deleted.status_code, 200)
        deleted_node_ids = {node["node_id"] for node in deleted.json()["deleted_nodes"]}
        self.assertEqual(deleted_node_ids, {section_id, *child_ids})
        updated_graph = deleted.json()["graph"]
        remaining_node_ids = {node["node_id"] for node in updated_graph["nodes"]}
        self.assertNotIn(section_id, remaining_node_ids)
        self.assertTrue(child_ids.isdisjoint(remaining_node_ids))
        self.assertIn(other_section_id, remaining_node_ids)
        for relationship in updated_graph["relationships"]:
            self.assertNotIn(relationship["source_id"], deleted_node_ids)
            self.assertNotIn(relationship["target_id"], deleted_node_ids)

    def test_signup_and_document_upload_persist_general_database_rows(self) -> None:
        signup = self.client.post(
            "/api/users/signup/",
            data=json.dumps(
                {
                    "username": "mariana",
                    "email": "mariana@example.com",
                    "password": "secret123",
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(signup.status_code, 201)
        session = signup.json()["session"]
        workspace_id = session["workspace"]["id"]

        created = self.client.post(
            "/documents/",
            data=json.dumps(
                {
                    "filename": "fisica.md",
                    "content": (
                        "# Fisica\n\n"
                        "## 1. Cinematica\n\n"
                        "La cinematica estudia el movimiento, la velocidad y la aceleracion.\n"
                    ),
                }
            ),
            content_type="application/json",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
            HTTP_X_LYCEUM_USER_ID=session["user"]["id"],
        )
        self.assertEqual(created.status_code, 201)
        document = created.json()["document"]
        document_id = document["metadata"]["document_id"]

        graph_space = GraphSpace.objects.get(graph_ref=document_id)
        self.assertEqual(str(graph_space.workspace_id), workspace_id)
        self.assertEqual(GraphView.objects.filter(graph_space=graph_space, is_default=True).count(), 1)
        self.assertEqual(UploadedAsset.objects.filter(graph_space=graph_space).count(), 1)
        self.assertEqual(document["metadata"]["workspace_id"], workspace_id)
        self.assertEqual(document["graph"]["node_counts_by_label"]["Document"], 1)
        self.assertGreater(document["graph"]["node_counts_by_label"]["Section"], 0)
        self.assertGreater(document["graph"]["node_counts_by_label"]["Chunk"], 0)
        self.assertEqual(set(document["graph"]["relationship_counts_by_type"]), {"CONTAINS"})

        manual_node = self.client.post(
            f"/documents/{document_id}/nodes/",
            data=json.dumps(
                {
                    "labels": ["Content"],
                    "properties": {
                        "title": "Nota de repaso",
                        "text": "Recordar comparar velocidad y aceleracion.",
                    },
                }
            ),
            content_type="application/json",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
        )
        self.assertEqual(manual_node.status_code, 201)
        saved_manual_node = manual_node.json()["node"]
        self.assertEqual(saved_manual_node["labels"], ["Content"])
        self.assertTrue(saved_manual_node["properties"]["manual"])
        self.assertEqual(saved_manual_node["properties"]["content_version"], 1)

        manual_section = self.client.post(
            f"/documents/{document_id}/nodes/",
            data=json.dumps(
                {
                    "labels": ["Section"],
                    "properties": {
                        "title": "Seccion manual",
                    },
                }
            ),
            content_type="application/json",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
        )
        self.assertEqual(manual_section.status_code, 400)
        self.assertIn("Section nodes are created", manual_section.json()["error"])

        position = self.client.post(
            f"/documents/{document_id}/node-positions/",
            data=json.dumps({"node_id": "node-1", "x": 12, "y": -4}),
            content_type="application/json",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
        )
        self.assertEqual(position.status_code, 200)
        self.assertEqual(
            GraphViewNodePosition.objects.filter(
                graph_view__graph_space=graph_space,
                node_id="node-1",
            ).count(),
            1,
        )

        graph_response = self.client.get(
            f"/documents/{document_id}/graph/",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
        )
        self.assertEqual(graph_response.status_code, 200)
        self.assertEqual(
            graph_response.json()["node_positions"]["node-1"],
            {"x": 12.0, "y": -4.0},
        )

        reset_positions = self.client.delete(
            f"/documents/{document_id}/node-positions/",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
        )
        self.assertEqual(reset_positions.status_code, 200)
        self.assertEqual(reset_positions.json()["deleted_position_count"], 1)
        self.assertFalse(
            GraphViewNodePosition.objects.filter(
                graph_view__graph_space=graph_space,
                node_id="node-1",
            ).exists(),
        )

        reset_graph_response = self.client.get(
            f"/documents/{document_id}/graph/",
            HTTP_X_LYCEUM_WORKSPACE_ID=workspace_id,
        )
        self.assertEqual(reset_graph_response.status_code, 200)
        self.assertEqual(reset_graph_response.json()["node_positions"], {})

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
        concept_properties = first_node_body["node"]["properties"]
        self.assertEqual(concept_properties["content_text"], "Contenido escrito por el usuario.")
        self.assertEqual(concept_properties["content_markdown"], "Contenido escrito por el usuario.")
        self.assertEqual(concept_properties["content_version"], 1)
        self.assertEqual(concept_properties["content_json"]["type"], "doc")
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
                    "labels": ["Content"],
                    "properties": {
                        "title": "Contenido manual",
                        "text": "Texto convertido en contenido.",
                    },
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(relabeled_node.status_code, 400)
        self.assertIn("Node type cannot be changed", relabeled_node.json()["error"])
        unchanged_graph = self.client.get(f"/documents/{document_id}/graph/")
        unchanged_node = next(
            node for node in unchanged_graph.json()["graph"]["nodes"] if node["node_id"] == relabel_id
        )
        self.assertEqual(unchanged_node["labels"], ["Concept"])
        self.assertEqual(unchanged_node["properties"]["title"], "Temporal")

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
                    "relationship_type": "RELATES",
                    "properties": {"reason": "Relacion manual"},
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(relationship.status_code, 201)
        relationship_id = relationship.json()["relationship"]["relationship_id"]
        self.assertIn("RELATES", relationship.json()["graph"]["relationship_counts_by_type"])

        changed = self.client.patch(
            f"/relationships/{quote(relationship_id, safe='')}/",
            data=json.dumps(
                {
                    "relationship_type": "CONTAINS",
                    "properties": {"status": "confirmed"},
                }
            ),
            content_type="application/json",
        )
        self.assertEqual(changed.status_code, 200)
        self.assertEqual(changed.json()["relationship"]["relationship_type"], "CONTAINS")

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
        self.assertIn(
            "Mas notas.",
            merged.json()["node"]["properties"]["content_text"],
        )
        self.assertEqual(merged.json()["graph"]["node_counts_by_label"]["Concept"], 2)

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

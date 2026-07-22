from pathlib import Path
import json
import os
import sys
from urllib.parse import quote


sys.dont_write_bytecode = True
PROJECT_ROOT = Path(__file__).resolve().parents[1]
BACKEND_DIR = PROJECT_ROOT / "backend"
for path in (BACKEND_DIR, PROJECT_ROOT):
    path_string = str(path)
    if path_string not in sys.path:
        sys.path.insert(0, path_string)

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings")

import django


django.setup()

from django.test import Client


def main() -> int:
    client = Client(HTTP_HOST="localhost")
    listed = client.get("/documents/")
    if listed.status_code != 200:
        print(f"GET /documents/ failed: {listed.status_code}")
        return 1

    documents = listed.json().get("documents", [])
    if not documents:
        print("No documents found through API.")
        return 1

    document_id = documents[0]["document_id"]
    graph_response = client.get(f"/documents/{document_id}/graph/")
    if graph_response.status_code != 200:
        print(f"GET /documents/{document_id}/graph/ failed: {graph_response.status_code}")
        return 1

    graph = graph_response.json()["graph"]
    document_node = next(
        node for node in graph["nodes"] if "Document" in node["labels"]
    )

    node_id = ""
    relationship_id = ""
    try:
        node_response = client.post(
            f"/documents/{document_id}/nodes/",
            data=json.dumps(
                {
                    "labels": ["Concept"],
                    "properties": {
                        "title": "Smoke test temporal",
                        "text": "Nodo temporal de validacion AuraDB.",
                    },
                }
            ),
            content_type="application/json",
        )
        if node_response.status_code != 201:
            print(f"POST node failed: {node_response.status_code}")
            return 1
        node_id = node_response.json()["node"]["node_id"]

        relationship_response = client.post(
            f"/documents/{document_id}/relationships/",
            data=json.dumps(
                {
                    "source_id": document_node["node_id"],
                    "target_id": node_id,
                    "relationship_type": "RELATES",
                    "properties": {"reason": "Smoke test temporal"},
                }
            ),
            content_type="application/json",
        )
        if relationship_response.status_code != 201:
            print(f"POST relationship failed: {relationship_response.status_code}")
            return 1
        relationship_id = relationship_response.json()["relationship"]["relationship_id"]

        patch_node = client.patch(
            f"/nodes/{quote(node_id, safe='')}/",
            data=json.dumps({"properties": {"frontend_label": "Smoke actualizado"}}),
            content_type="application/json",
        )
        if patch_node.status_code != 200:
            print(f"PATCH node failed: {patch_node.status_code}")
            return 1

        patch_relationship = client.patch(
            f"/relationships/{quote(relationship_id, safe='')}/",
            data=json.dumps(
                {
                    "relationship_type": "CONTAINS",
                    "properties": {"status": "confirmed"},
                }
            ),
            content_type="application/json",
        )
        if patch_relationship.status_code != 200:
            print(f"PATCH relationship failed: {patch_relationship.status_code}")
            return 1
    finally:
        if relationship_id:
            client.delete(f"/relationships/{quote(relationship_id, safe='')}/")
        if node_id:
            client.delete(f"/nodes/{quote(node_id, safe='')}/")

    final_graph = client.get(f"/documents/{document_id}/graph/").json()["graph"]
    if any(node["node_id"] == node_id for node in final_graph["nodes"]):
        print("Temporary node cleanup failed.")
        return 1

    print("Neo4j endpoint smoke test passed.")
    print(f"documents={len(documents)}")
    print(f"initial_nodes={graph['node_count']}")
    print(f"final_nodes={final_graph['node_count']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

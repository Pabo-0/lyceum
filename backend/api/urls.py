from django.urls import path

from . import views


urlpatterns = [
    path("documents/", views.documents_collection, name="documents_collection"),
    path("documents/<str:document_id>/", views.document_detail, name="document_detail"),
    path(
        "documents/<str:document_id>/graph/",
        views.document_graph,
        name="document_graph",
    ),
    path(
        "documents/<str:document_id>/nodes/",
        views.document_nodes,
        name="document_nodes",
    ),
    path(
        "documents/<str:document_id>/nodes/merge/",
        views.document_node_merge,
        name="document_node_merge",
    ),
    path(
        "documents/<str:document_id>/relationships/",
        views.document_relationships,
        name="document_relationships",
    ),
    path("nodes/<path:node_id>/", views.node_detail, name="node_detail"),
    path(
        "relationships/<path:relationship_id>/",
        views.relationship_detail,
        name="relationship_detail",
    ),
]

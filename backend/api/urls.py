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
    path("nodes/<path:node_id>/", views.node_detail, name="node_detail"),
    path(
        "relationships/<path:relationship_id>/",
        views.relationship_detail,
        name="relationship_detail",
    ),
]

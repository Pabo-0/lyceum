from django.contrib import admin

from .models import GraphSpace, GraphView, GraphViewNodePosition


@admin.register(GraphSpace)
class GraphSpaceAdmin(admin.ModelAdmin):
    list_display = ("title", "workspace", "graph_backend", "graph_ref", "status", "created_at")
    list_filter = ("status", "graph_backend")
    search_fields = ("title", "graph_ref", "workspace__name")


@admin.register(GraphView)
class GraphViewAdmin(admin.ModelAdmin):
    list_display = ("title", "graph_space", "layout_mode", "is_default", "updated_at")
    list_filter = ("layout_mode", "is_default")
    search_fields = ("title", "graph_space__title")


@admin.register(GraphViewNodePosition)
class GraphViewNodePositionAdmin(admin.ModelAdmin):
    list_display = ("node_id", "graph_view", "x", "y", "pinned", "hidden", "collapsed")
    list_filter = ("pinned", "hidden", "collapsed")
    search_fields = ("node_id", "graph_view__title", "graph_view__graph_space__title")

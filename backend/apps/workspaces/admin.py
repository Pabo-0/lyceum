from django.contrib import admin

from .models import UploadedAsset, Workspace


@admin.register(Workspace)
class WorkspaceAdmin(admin.ModelAdmin):
    list_display = ("name", "owner", "slug", "default_language", "status", "created_at")
    list_filter = ("status", "default_language")
    search_fields = ("name", "slug", "owner__username", "owner__email")


@admin.register(UploadedAsset)
class UploadedAssetAdmin(admin.ModelAdmin):
    list_display = ("file_name", "workspace", "graph_space", "mime_type", "size_bytes", "status")
    list_filter = ("status", "mime_type")
    search_fields = ("file_name", "file_path", "workspace__name", "graph_space__title")


import uuid

from django.conf import settings
from django.db import models

from apps.choices import LifecycleStatus


class AssetStatus(models.TextChoices):
    UPLOADED = "uploaded", "Uploaded"
    PROCESSING = "processing", "Processing"
    READY = "ready", "Ready"
    FAILED = "failed", "Failed"
    DELETED = "deleted", "Deleted"


class Workspace(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    owner = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="workspace",
    )
    name = models.CharField(max_length=120)
    slug = models.SlugField(max_length=120, unique=True)
    default_language = models.CharField(max_length=16, default="es-MX")
    status = models.CharField(
        max_length=16,
        choices=LifecycleStatus.choices,
        default=LifecycleStatus.ACTIVE,
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "api_workspace"
        ordering = ["name", "created_at"]

    def __str__(self) -> str:
        return self.name


class UploadedAsset(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    workspace = models.ForeignKey(
        Workspace,
        on_delete=models.CASCADE,
        related_name="uploaded_assets",
    )
    graph_space = models.ForeignKey(
        "graphs.GraphSpace",
        on_delete=models.SET_NULL,
        related_name="uploaded_assets",
        blank=True,
        null=True,
    )
    file_name = models.CharField(max_length=255)
    file_path = models.TextField()
    mime_type = models.CharField(max_length=120, blank=True)
    size_bytes = models.BigIntegerField(blank=True, null=True)
    status = models.CharField(
        max_length=16,
        choices=AssetStatus.choices,
        default=AssetStatus.UPLOADED,
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "api_uploadedasset"
        ordering = ["-created_at", "file_name"]

    def __str__(self) -> str:
        return self.file_name


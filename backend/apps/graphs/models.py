import uuid

from django.db import models

from apps.choices import LifecycleStatus


class GraphBackend(models.TextChoices):
    NEO4J = "neo4j", "Neo4j"
    FILE = "file", "File"


class LayoutMode(models.TextChoices):
    MANUAL = "manual", "Manual"
    FORCE = "force", "Force"
    HIERARCHY = "hierarchy", "Hierarchy"
    RADIAL = "radial", "Radial"


class GraphSpace(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    workspace = models.ForeignKey(
        "workspaces.Workspace",
        on_delete=models.CASCADE,
        related_name="graph_spaces",
    )
    title = models.CharField(max_length=160)
    status = models.CharField(
        max_length=16,
        choices=LifecycleStatus.choices,
        default=LifecycleStatus.ACTIVE,
    )
    graph_backend = models.CharField(
        max_length=32,
        choices=GraphBackend.choices,
        default=GraphBackend.NEO4J,
    )
    graph_ref = models.CharField(max_length=255, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "api_graphspace"
        ordering = ["title", "created_at"]
        constraints = [
            models.UniqueConstraint(
                fields=["workspace", "title"],
                name="unique_graph_space_title_per_workspace",
            ),
        ]

    def __str__(self) -> str:
        return self.title


class GraphView(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    graph_space = models.ForeignKey(
        GraphSpace,
        on_delete=models.CASCADE,
        related_name="views",
    )
    title = models.CharField(max_length=120)
    layout_mode = models.CharField(
        max_length=32,
        choices=LayoutMode.choices,
        default=LayoutMode.MANUAL,
    )
    is_default = models.BooleanField(default=False)
    viewport_x = models.FloatField(blank=True, null=True)
    viewport_y = models.FloatField(blank=True, null=True)
    zoom = models.FloatField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "api_graphview"
        ordering = ["-is_default", "title", "created_at"]
        constraints = [
            models.UniqueConstraint(
                fields=["graph_space", "title"],
                name="unique_graph_view_title_per_graph_space",
            ),
            models.UniqueConstraint(
                fields=["graph_space"],
                condition=models.Q(is_default=True),
                name="unique_default_graph_view_per_graph_space",
            ),
        ]

    def __str__(self) -> str:
        return f"{self.graph_space}: {self.title}"


class GraphViewNodePosition(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    graph_view = models.ForeignKey(
        GraphView,
        on_delete=models.CASCADE,
        related_name="node_positions",
    )
    node_id = models.CharField(max_length=255)
    x = models.FloatField()
    y = models.FloatField()
    pinned = models.BooleanField(default=False)
    hidden = models.BooleanField(default=False)
    collapsed = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = "api_graphviewnodeposition"
        ordering = ["node_id"]
        constraints = [
            models.UniqueConstraint(
                fields=["graph_view", "node_id"],
                name="unique_node_position_per_graph_view",
            ),
        ]

    def __str__(self) -> str:
        return f"{self.node_id} @ {self.graph_view}"

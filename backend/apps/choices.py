from django.db import models


class LifecycleStatus(models.TextChoices):
    ACTIVE = "active", "Active"
    DRAFT = "draft", "Draft"
    SUGGESTED = "suggested", "Suggested"
    ARCHIVED = "archived", "Archived"
    DELETED = "deleted", "Deleted"

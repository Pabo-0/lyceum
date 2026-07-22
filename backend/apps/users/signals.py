from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.text import slugify

from apps.workspaces.models import Workspace

from .models import User


@receiver(post_save, sender=User)
def create_default_workspace(sender, instance: User, created: bool, **kwargs) -> None:
    if not created:
        return

    base_slug = slugify(instance.username or instance.email or str(instance.pk)) or "workspace"
    slug = base_slug
    suffix = 2
    while Workspace.objects.filter(slug=slug).exists():
        slug = f"{base_slug}-{suffix}"
        suffix += 1

    display_name = instance.get_full_name() or instance.username or instance.email or "Usuario"
    Workspace.objects.create(
        owner=instance,
        name=f"Workspace de {display_name}",
        slug=slug,
        default_language=instance.locale or "es-MX",
    )


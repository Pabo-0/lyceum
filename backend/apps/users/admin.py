from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin

from .models import User


@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    fieldsets = DjangoUserAdmin.fieldsets + (
        ("Lyceum", {"fields": ("locale",)}),
    )
    list_display = ("username", "email", "locale", "is_staff", "is_superuser", "is_active")


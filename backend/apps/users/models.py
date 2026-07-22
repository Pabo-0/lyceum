from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    locale = models.CharField(max_length=16, default="es-MX")

    class Meta:
        db_table = "api_user"

    def __str__(self) -> str:
        return self.get_username()


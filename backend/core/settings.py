import os
import sys
from pathlib import Path

from dotenv import load_dotenv


def env_bool(name: str, default: bool = False) -> bool:
    value = os.getenv(name)
    if value is None:
        return default
    return value.strip().lower() in {"1", "true", "yes", "on"}


def env_list(name: str, default: list[str] | None = None) -> list[str]:
    value = os.getenv(name)
    if not value:
        return default or []
    return [item.strip() for item in value.split(",") if item.strip()]


def env_path(name: str, default: Path) -> Path:
    value = os.getenv(name)
    if not value:
        return default
    path = Path(value)
    if path.is_absolute():
        return path
    return BASE_DIR / path


def runtime_tmp_path(name: str) -> Path:
    return Path(os.getenv("TMPDIR") or os.getenv("TEMP") or "/tmp") / name


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
PROJECT_ROOT = BASE_DIR.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

load_dotenv(BASE_DIR / ".env")


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.2/howto/deployment/checklist/

SECRET_KEY = os.getenv("DJANGO_SECRET_KEY")
if not SECRET_KEY:
    raise RuntimeError("DJANGO_SECRET_KEY must be set in backend/.env")

DEBUG = env_bool("DJANGO_DEBUG", default=False)

DEFAULT_ALLOWED_HOSTS = ["localhost", "127.0.0.1", ".vercel.app"]
for vercel_host in (
    os.getenv("VERCEL_URL"),
    os.getenv("VERCEL_PROJECT_PRODUCTION_URL"),
):
    if vercel_host and vercel_host not in DEFAULT_ALLOWED_HOSTS:
        DEFAULT_ALLOWED_HOSTS.append(vercel_host)

ALLOWED_HOSTS = env_list("DJANGO_ALLOWED_HOSTS", DEFAULT_ALLOWED_HOSTS)
CSRF_TRUSTED_ORIGINS = env_list("DJANGO_CSRF_TRUSTED_ORIGINS")


# Application definition

INSTALLED_APPS = [
    'api',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'core.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'core.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': env_path("DJANGO_SQLITE_NAME", BASE_DIR / "db.sqlite3"),
    }
}

NEO4J = {
    "URI": os.getenv("NEO4J_URI", "bolt://localhost:7687"),
    "USER": os.getenv("NEO4J_USER", "neo4j"),
    "PASSWORD": os.getenv("NEO4J_PASSWORD", ""),
    "DATABASE": os.getenv("NEO4J_DATABASE", ""),
    "SYNC_ON_INGEST": env_bool("NEO4J_SYNC_ON_INGEST", default=False),
}

IS_VERCEL = env_bool("VERCEL", default=False)
DEFAULT_RUNTIME_STORAGE_ROOT = (
    runtime_tmp_path("lyceum-storage")
    if IS_VERCEL
    else PROJECT_ROOT / "data/storage"
)
DEFAULT_UPLOADS_DIR = (
    runtime_tmp_path("lyceum-uploads")
    if IS_VERCEL
    else PROJECT_ROOT / "data/uploads"
)

LYCEUM_SEED_RUNTIME_STORAGE = env_bool(
    "LYCEUM_SEED_RUNTIME_STORAGE",
    default=IS_VERCEL,
)
LYCEUM_SEED_STORAGE_DIR = env_path(
    "LYCEUM_SEED_STORAGE_DIR",
    PROJECT_ROOT / "data/storage",
)
LYCEUM_STORAGE_PATH = env_path(
    "LYCEUM_STORAGE_PATH",
    DEFAULT_RUNTIME_STORAGE_ROOT / "documents.json",
)
LYCEUM_DOCUMENTS_DIR = env_path(
    "LYCEUM_DOCUMENTS_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "documents",
)
LYCEUM_ORIGINALS_DIR = env_path(
    "LYCEUM_ORIGINALS_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "originals",
)
LYCEUM_NORMALIZED_DIR = env_path(
    "LYCEUM_NORMALIZED_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "normalized",
)
LYCEUM_UPLOADS_DIR = env_path(
    "LYCEUM_UPLOADS_DIR",
    DEFAULT_UPLOADS_DIR,
)
LYCEUM_NEO4J_EXPORT_DIR = env_path(
    "LYCEUM_NEO4J_EXPORT_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "neo4j",
)


# Password validation
# https://docs.djangoproject.com/en/5.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.2/topics/i18n/

LANGUAGE_CODE = 'es-mx'

TIME_ZONE = 'America/Mexico_City'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.2/howto/static-files/

STATIC_URL = 'static/'
STATIC_ROOT = BASE_DIR / 'staticfiles'
FRONTEND_DIST_DIR = PROJECT_ROOT / "frontend/dist"
STATICFILES_DIRS = [FRONTEND_DIST_DIR] if FRONTEND_DIST_DIR.exists() else []

# Default primary key field type
# https://docs.djangoproject.com/en/5.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

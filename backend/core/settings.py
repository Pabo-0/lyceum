import os
import sys
from pathlib import Path

import dj_database_url
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


def runtime_writable_path(name: str, default: Path) -> Path:
    path = env_path(name, default)
    if not IS_VERCEL:
        return path

    try:
        path.resolve(strict=False).relative_to(PROJECT_ROOT.resolve(strict=False))
    except ValueError:
        return path

    return default


def read_key_value_file(path: Path) -> dict[str, str]:
    if not path.exists():
        return {}

    values: dict[str, str] = {}
    for line in path.read_text(encoding="utf-8").splitlines():
        clean_line = line.strip()
        if not clean_line or clean_line.startswith("#"):
            continue

        separator = "=" if "=" in clean_line else ":"
        if separator not in clean_line:
            continue

        key, value = clean_line.split(separator, 1)
        key = key.strip()
        if not key:
            continue
        values[key] = value.strip().strip('"').strip("'")

    return values


def default_neo4j_credentials_file() -> Path | None:
    credentials_dir = PROJECT_ROOT.parent / "Credentials"
    if not credentials_dir.exists():
        return None

    candidates = sorted(credentials_dir.glob("Neo4j-*.txt"))
    return candidates[0] if candidates else None


def env_or_file(names: tuple[str, ...], file_values: dict[str, str], default: str = "") -> str:
    for name in names:
        value = os.getenv(name)
        if value:
            return value

    for name in names:
        value = file_values.get(name)
        if value:
            return value

    return default


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
IS_VERCEL = env_bool("VERCEL", default=False)

DEFAULT_ALLOWED_HOSTS = ["localhost", "127.0.0.1", ".vercel.app"]
for vercel_host in (
    os.getenv("VERCEL_URL"),
    os.getenv("VERCEL_PROJECT_PRODUCTION_URL"),
):
    if vercel_host and vercel_host not in DEFAULT_ALLOWED_HOSTS:
        DEFAULT_ALLOWED_HOSTS.append(vercel_host)

ALLOWED_HOSTS = list(dict.fromkeys(DEFAULT_ALLOWED_HOSTS + env_list("DJANGO_ALLOWED_HOSTS")))
CSRF_TRUSTED_ORIGINS = env_list("DJANGO_CSRF_TRUSTED_ORIGINS")


# Application definition

INSTALLED_APPS = [
    'apps.users.apps.UsersConfig',
    'apps.workspaces.apps.WorkspacesConfig',
    'apps.graphs.apps.GraphsConfig',
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

DATABASE_URL = os.getenv("DATABASE_URL", "").strip()
if not DATABASE_URL:
    raise RuntimeError("DATABASE_URL must be set to the Neon Postgres connection string.")

DATABASES = {
    "default": dj_database_url.config(
        default=DATABASE_URL,
        conn_max_age=int(os.getenv("DATABASE_CONN_MAX_AGE", "600")),
        conn_health_checks=True,
    )
}

AUTH_USER_MODEL = "users.User"

NEO4J_CREDENTIALS_FILE = env_path(
    "LYCEUM_NEO4J_CREDENTIALS_FILE",
    default_neo4j_credentials_file() or PROJECT_ROOT.parent / "Credentials/Neo4j.txt",
)
NEO4J_FILE_VALUES = read_key_value_file(NEO4J_CREDENTIALS_FILE)
NEO4J = {
    "URI": env_or_file(("NEO4J_URI",), NEO4J_FILE_VALUES, "bolt://localhost:7687"),
    "USER": env_or_file(
        ("NEO4J_USER", "NEO4J_USERNAME"),
        NEO4J_FILE_VALUES,
        "neo4j",
    ),
    "PASSWORD": env_or_file(("NEO4J_PASSWORD",), NEO4J_FILE_VALUES),
    "DATABASE": env_or_file(("NEO4J_DATABASE",), NEO4J_FILE_VALUES),
    "SYNC_ON_INGEST": env_bool("NEO4J_SYNC_ON_INGEST", default=False),
}
LYCEUM_GRAPH_BACKEND = os.getenv(
    "LYCEUM_GRAPH_BACKEND",
    "neo4j" if NEO4J["PASSWORD"] else "file",
).strip().lower()

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
LYCEUM_STORAGE_PATH = runtime_writable_path(
    "LYCEUM_STORAGE_PATH",
    DEFAULT_RUNTIME_STORAGE_ROOT / "documents.json",
)
LYCEUM_DOCUMENTS_DIR = runtime_writable_path(
    "LYCEUM_DOCUMENTS_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "documents",
)
LYCEUM_ORIGINALS_DIR = runtime_writable_path(
    "LYCEUM_ORIGINALS_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "originals",
)
LYCEUM_NORMALIZED_DIR = runtime_writable_path(
    "LYCEUM_NORMALIZED_DIR",
    DEFAULT_RUNTIME_STORAGE_ROOT / "normalized",
)
LYCEUM_UPLOADS_DIR = runtime_writable_path(
    "LYCEUM_UPLOADS_DIR",
    DEFAULT_UPLOADS_DIR,
)
LYCEUM_NEO4J_EXPORT_DIR = runtime_writable_path(
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

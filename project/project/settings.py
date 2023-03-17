import os
from datetime import timedelta
from pathlib import Path

import split_settings.tools
from dotenv import load_dotenv
from split_settings.tools import include

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
ROOT_DIR = Path(__file__).resolve().parent.parent.parent

# путь к .env файлу для определения значений переменных окружения
dotenv_path = ROOT_DIR / 'docker/.env'

if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)
else:
    raise Exception('.env-файл со значениями переменных окружения не найден!')

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-nfzds1ctbcra6nwrs5z$sxgcw(+0)mjv!)xm&pnv0*^=vfnv6y'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG_ = os.environ.get('DEBUG')
DEBUG = True if DEBUG_ == 'True' else False

LOGGING_ON = True
ALLOWED_HOSTS = ['*']

FROM_DOCKER_IMAGE = 'FROM_DOCKER_IMAGE' in os.environ

HOST = '0.0.0.0' if FROM_DOCKER_IMAGE else 'localhost'

SITE_PORT = os.environ.get('SITE_PORT')
PG_HOST = os.environ.get('PG_DOCKER_IMAGE_HOST') or 'localhost'
PG_PORT = os.environ.get('PG_PORT') or 5432

BROKER = os.environ.get('BROKER')

if BROKER not in ('rabbitmq', 'redis'):
    raise Exception('environemnt variable BROKER in .env must be one from redis or rabbitmq!')

REDIS_PORT = os.environ.get('REDIS_PORT')
RABBITMQ_PORT = os.environ.get('RABBITMQ_PORT')

ROOT_URLCONF = 'project.urls'

WSGI_APPLICATION = 'project.wsgi.application'

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

CKEDITOR_UPLOAD_PATH = 'uploads'

include(
    'conf/api.py',
    'conf/auth.py',
    'conf/db.py',
    'conf/email.py',
    'conf/installed_apps.py',
    'conf/media.py',
    'conf/middleware.py',
    'conf/static.py',
    'conf/templates.py',
    'conf/timezone.py',

    'conf/debug_toolbar.py',
    'conf/redis_config.py',
    'conf/rabbitmq_config.py'
)

# include('conf/integrations/*.py')
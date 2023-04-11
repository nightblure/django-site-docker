import os
from datetime import timedelta
from pathlib import Path

from dotenv import load_dotenv
from split_settings.tools import include

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
ROOT_DIR = Path(__file__).resolve().parent.parent.parent

dotenv_path = BASE_DIR / '.env'

if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)
else:
    raise Exception(f'.env file must be in src folder (try to find in {dotenv_path})')

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-nfzds1ctbcra6nwrs5z$sxgcw(+0)mjv!)xm&pnv0*^=vfnv6y'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = os.environ.get('DEBUG')

LOGGING_ON = True
ALLOWED_HOSTS = ['*']

PROD = 'PROD' in os.environ

SITE_PORT = os.environ.get('SITE_PORT')

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
    'conf/rabbitmq_config.py',
    'conf/sentry.py'
)

# wildcard import!
# include('conf/integrations/*.py')
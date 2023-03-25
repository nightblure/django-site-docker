import os

from django.conf import settings

DB_HOST = 'localhost'

if settings.FROM_DOCKER_IMAGE:
    DB_HOST = os.environ.get('PG_DOCKER_IMAGE_HOST')

DB_PORT = os.environ.get('DB_PORT')
DB_NAME = os.environ.get('POSTGRES_DB')

DB_USER = os.environ.get('POSTGRES_USER')
DB_PASSWORD = os.environ.get('POSTGRES_PASSWORD')

DATABASES = {
    'default': {
        # 'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': BASE_DIR / 'db.sqlite3',

        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': DB_NAME,
        'USER': DB_USER,
        'PASSWORD': DB_PASSWORD,
        'HOST': DB_HOST,
        'PORT': DB_PORT,
    }
}

print(DATABASES['default'])

import os

from django.conf import settings

REDIS_PORT = os.environ.get('REDIS_PORT')
REDIS_HOST = 'localhost'

if settings.PROD:
    REDIS_HOST = os.environ.get('REDIS_DOCKER_IMAGE_HOST')

REDIS_BROKER_URL = f"redis://{REDIS_HOST}:{REDIS_PORT}"

CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': REDIS_BROKER_URL,
        'OPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient'
        }
    }
}

# 15 minutes cooldown for cache
CACHE_TTL = 60 * 15

import os

from django.conf import settings

REDIS_PORT = 6379
RABBITMQ_PORT = 5672
BROKER_PORT = REDIS_PORT

# если приложение разворачивается из docker-образа в контейнер, то хостом брокера будет не локалхост, а редис
# аналогичную логику нужно применять к хосту rabbitmq
BROKER_HOST = 'redis' if settings.FROM_DOCKER_IMAGE else 'localhost'

REDIS_BROKER_URL = f"redis://{BROKER_HOST}:{BROKER_PORT}"
# RABBITMQ_BROKER_URL = f'amqp://guest:guest@{BROKER_HOST}:{BROKER_PORT}'

BROKER_URL = REDIS_BROKER_URL

CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': BROKER_URL,
        'OPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient'
        }
    }
}

# 15 minutes cooldown for cache
CACHE_TTL = 60 * 15

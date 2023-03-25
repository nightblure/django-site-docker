import os

from django.conf import settings

RABBITMQ_PORT = os.environ.get('RABBITMQ_PORT')
RABBITMQ_HOST = 'localhost'

if settings.PROD:
    RABBITMQ_HOST = os.environ.get('RABBITMQ_DOCKER_IMAGE_HOST')

RABBITMQ_BROKER_URL = f'amqp://guest:guest@{RABBITMQ_HOST}:{RABBITMQ_PORT}'

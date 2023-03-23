import os

from project.conf.redis_config import REDIS_BROKER_URL
from project.conf.rabbitmq_config import RABBITMQ_BROKER_URL

BROKER = os.environ.get('BROKER')

if BROKER not in ('rabbitmq', 'redis'):
    raise Exception('env var BROKER must be one from `redis` or `rabbitmq`')


broker_url = RABBITMQ_BROKER_URL if BROKER == 'rabbitmq' else REDIS_BROKER_URL
# хранить данные можно только в redis
result_backend = REDIS_BROKER_URL

print(f'CELERY_BROKER_URL: {broker_url}')
print(f'CELERY_RESULT_BACKEND: {result_backend}')

ACCEPT_CONTENT = ['json']
task_serializer = 'json'
result_serializer = 'json'

ACKS_LATE = True
WORKER_PREFETCH_MULTIPLIER = 1
worker_max_memory_per_child = 12000  # 12 MB

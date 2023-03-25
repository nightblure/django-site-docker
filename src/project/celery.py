import os

from django.conf import settings
from celery import Celery

BROKER = os.environ.get('BROKER')

if BROKER not in ('rabbitmq', 'redis'):
    raise Exception('env var BROKER must be one from `redis` or `rabbitmq`')

__all__ = [
    "celery_app",
]

# без этой переменной импорт переменных из settings не будет работать
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')

broker_url = settings.RABBITMQ_BROKER_URL if BROKER == 'rabbitmq' else settings.REDIS_BROKER_URL
print(f'CELERY_BROKER_URL: {broker_url}')

celery_app = Celery('project')
celery_app.conf.update(
    broker_url=broker_url,
    result_backend=settings.REDIS_BROKER_URL,
    task_ignore_result=True,
    ACCEPT_CONTENT=['json'],
    task_serializer='json',
    result_serializer='json',
    acks_late=True,
)
celery_app.autodiscover_tasks()

""" 
ЗАПУСК сервисов из папки project:
- celery -A project worker -l info -P solo (очередь celery, запускать обязательно)
- celery -A project flower (мониторинг, необязательно)
"""

import os
# без этой переменной импорт переменных из settings не будет работать
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')

from project import celery_config
from celery import Celery

app = Celery('project')
app.config_from_object(celery_config, namespace='CELERY')
app.autodiscover_tasks()

""" 
ЗАПУСК celery из папки project
celery -A project worker -l info -P solo
"""
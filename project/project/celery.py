import os
# без этой переменной импорт переменных из settings не будет работать
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')

import project.conf.celery_config as celery_config
from celery import Celery

celery_app = Celery('project')
celery_app.config_from_object(celery_config, namespace='CELERY')
celery_app.autodiscover_tasks()

""" 
ЗАПУСК celery из папки project
celery -A project worker -l info -P solo
"""
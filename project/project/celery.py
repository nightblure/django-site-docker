import os

from celery import Celery

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'project.settings')

app = Celery('project')
app.config_from_object('project.settings', namespace='CELERY')
app.autodiscover_tasks()

""" 
ЗАПУСК celery из папки project
celery -A project worker -l info -P solo из папки 
"""
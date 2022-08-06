# from project.project import celery_app
import os.path

from celery import shared_task
import datetime
import requests

"""
непонятно почему ругается 
на импорт project.project
поэтому запускаю не через объект celery_app, 
а с помощью shared_task
"""

#@celery_app.task
@shared_task
def test_task():

    with open('tasks_log.txt', 'a') as file:
        file.write(f"task info.. | {datetime.datetime.now().strftime('%d.%m.%Y %H:%M:%S')}\n")



BOT_TOKEN = '5552326282:AAHDk4hNElVZI4QAoxa9RlZICvZo_QwWZww'
BOT_NAME = 'inzera_bot'
GROUP_ID = '-685273008'
TELEGRAM_URL = f'https://api.telegram.org/bot{BOT_TOKEN}/sendMessage'

@shared_task
def send_tg_message(text, reciever_id=GROUP_ID):
    requests.post(TELEGRAM_URL, json={
        'chat_id': reciever_id,
        'text': text
    })




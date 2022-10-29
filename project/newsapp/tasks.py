import os
from celery import shared_task
from django.core.mail import send_mail

from project.celery import app


# @shared_task(bind=True, ignore_result=True)
@app.task(bind=True, ignore_result=True)
def send_mails(self, users, news_title, news_content):
    recievers = [email for user, email in users]
    message = f'Привет! Только что опубликована новость "{news_title}": {news_content}'
    subject = f'News site alert'

    send_mail(
        subject,
        message,
        'vanobel159@gmail.com', # settings.EMAIL_HOST_USER
        recievers
    )
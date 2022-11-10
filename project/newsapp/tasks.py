from celery import shared_task
from django.core.mail import send_mail, send_mass_mail
import os
from project.celery import celery_app
from django.conf import settings


# @shared_task(bind=True, ignore_result=True)
@celery_app.task(
    bind=True,
    ignore_result=True,
    max_retries=3,
    expires=20,
    soft_limit_timeout=10,
    default_retry_delay=30, # seconds
)
# self - инстанс Celery. с декоратором shared_task этот параметр не нужен
def send_mails(self, users, news_title, news_content, news_id):
    sender = settings.EMAIL_HOST_USER
    subject = f'News site notification service'
    messages = []

    for user, user_email in users:
        message = f'Привет, {user}! \nТолько что была опубликована новость "{news_title}"\n\n'
        message += f'Посмотреть новость на сайте: http://localhost:{settings.SITE_PORT}/news/{news_id}/'

        messages.append(
            (subject, message, sender, [user_email])
        )

    send_mass_mail(messages, fail_silently=False)

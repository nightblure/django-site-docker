from django.apps import apps
from django.core.cache import cache
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver

from project import celery_app
from newsapp.tasks import send_mails


@receiver(pre_save, sender='newsapp.News')
def on_change(sender, instance, **kwargs):
    # if instance.id is None then new object will be created, else it's edit
    if instance.id is None:
        # todo: если id пустой, то как пользователь в письме получит ссылку на созданную новость?
        _send_mails(instance)
    else:
        # чистим кэш при изменении новостей
        # todo как почистить записи кэша с определенным кей-префиксом?
        cache.clear()

# @receiver(post_save, sender='newsapp.News')
# def news_post_save(sender, instance, **kwargs):
#     pass

# метод для рассылки email-сообщений подписанным пользователям при создании новой новости
def _send_mails(instance):
    # решаем проблему циклического импорта
    user_model = apps.get_model('newsapp', 'User')
    celery_info = celery_app.control.inspect()
    celery_stats = celery_info.stats()

    """ если celery недоступен, выходим из метода """
    if not celery_stats:
        print('celery is not available')
        return

    users = [(obj.username, obj.email) for obj in user_model.objects.filter(is_subscriber=True)]
    print(users, instance.title, instance.content)
    send_mails.apply_async(
        args=(
            users,
            instance.title,
            instance.content,
            instance.pk
        )
    )

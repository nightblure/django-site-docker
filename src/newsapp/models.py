from django.conf import settings
from django.contrib.auth.models import AbstractUser
from django.db import models
from django.urls import reverse
from django.utils.text import slugify

# ИМПОРТ ДЛЯ ТОГО, ЧТОБЫ ДЖАНГА ЗНАЛА ПРО ОБРАБОТЧИКИ СИГНАЛОВ
import newsapp.signals
from categoriesapp.models import Category


class User(AbstractUser):
    bio = models.TextField(max_length=500, blank=True)
    avatar = models.ImageField(null=True)
    is_subscriber = models.BooleanField(null=False, default=False)


class News(models.Model):
    # db_column - переопределяем имя поля в БД
    # id = models.IntegerField(primary_key=True, db_column='id', verbose_name='Идентификатор')
    title = models.CharField(max_length=150)
    # blank = True - может принимать пустое значение
    content = models.TextField()
    created_at = models.DateTimeField(null=True, auto_now_add=True)
    updated_at = models.DateTimeField(null=True, auto_now=True)
    # upload_to - директория загрузки
    # можно переделать поле на imagePath и написать свою логику загрузки
    image = models.ImageField(upload_to='images/%Y/%m/%d/', null=True, blank=True)
    # default - значение по умолчанию
    is_published = models.BooleanField(default=True)
    category = models.ForeignKey(Category, on_delete=models.PROTECT, db_column='category_id')
    views_count = models.IntegerField(default=0)
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT)
    slug = models.SlugField(unique=True, max_length=250)

    # строковое представление для корректного отображения в админке
    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title, allow_unicode=True)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        kwargs = {
            'news_slug': self.slug
        }
        return reverse('one_news_route', kwargs=kwargs)

    # специальный подкласс для кастомизации админки
    class Meta:
        verbose_name = 'Новость'
        verbose_name_plural = 'Новости'
        # '-' перед полем укажет на обратный порядок сортировки
        # ordering = ['-created_at']






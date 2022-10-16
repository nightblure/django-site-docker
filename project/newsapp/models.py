from django.db import models
from django.urls import reverse
from django.contrib.auth.models import User

# http://127.0.0.1:8000/admin/


class Category(models.Model):
    title = models.CharField(max_length=150, verbose_name='Категория')
    slug = models.SlugField(unique=True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        kwargs = {
            # 'category_id': self.id,
            'category_slug': self.slug
        }

        # имя маршрута и аргументы
        # их надо прописывать в соответствии с именами маршрута и аргументов в urls.py
        return reverse('news_by_category_route', kwargs=kwargs)

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'
        # '-' перед полем укажет на обратный порядок сортировки
        # ordering = ['title']


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
    user = models.ForeignKey(User, on_delete=models.PROTECT)

    # строковое представление для корректного отображения в админке
    def __str__(self):
        return self.title

    # специальный подкласс для кастомизации админки
    class Meta:
        verbose_name = 'Новость'
        verbose_name_plural = 'Новости'
        # '-' перед полем укажет на обратный порядок сортировки
        # ordering = ['-created_at']

    def get_absolute_url(self):
        kwargs = {
            'news_id': self.id
        }
        return reverse('one_news_route', kwargs=kwargs)


class Like(models.Model):
    news = models.ForeignKey(News, on_delete=models.PROTECT)
    user = models.ForeignKey(User, on_delete=models.PROTECT)

    class Meta:
        verbose_name = 'Лайк'
        verbose_name_plural = 'Лайки'
        # ordering = ['user']
        constraints = [
            models.UniqueConstraint(fields=['user', 'news'], name='unique_constraint')
        ]
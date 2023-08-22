from django.db import models
from django.urls import reverse
from django.utils.text import slugify


class Category(models.Model):
    title = models.CharField(max_length=150, verbose_name='Категория')
    slug = models.SlugField(unique=True, max_length=150)

    def __str__(self):
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title, allow_unicode=True)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        kwargs = {
            # 'category_id': self.id,
            'category_slug': self.slug
        }

        # имя маршрута и аргументы
        # их надо прописывать в соответствии с именами маршрута и аргументов в urls.py
        return reverse('news_by_category_route', kwargs=kwargs)

    class Meta:
        db_table = "newsapp_category"
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'
        # '-' перед полем укажет на обратный порядок сортировки
        # ordering = ['title']

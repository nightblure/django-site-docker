from django.db import models

from newsapp.models import News, User


class Like(models.Model):
    news = models.ForeignKey(News, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        db_table = 'newsapp_like'
        verbose_name = 'Лайк'
        verbose_name_plural = 'Лайки'
        # ordering = ['user']
        constraints = [
            models.UniqueConstraint(fields=['user', 'news'], name='unique_constraint')
        ]

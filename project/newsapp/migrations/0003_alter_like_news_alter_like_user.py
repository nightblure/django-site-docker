# Generated by Django 4.0.3 on 2022-10-25 08:33

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('newsapp', '0002_comment'),
    ]

    operations = [
        migrations.AlterField(
            model_name='like',
            name='news',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='newsapp.news'),
        ),
        migrations.AlterField(
            model_name='like',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
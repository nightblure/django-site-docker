# Generated by Django 4.1.5 on 2023-03-19 10:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('newsapp', '0013_alter_news_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='slug',
            field=models.SlugField(max_length=150, unique=True),
        ),
        migrations.AlterField(
            model_name='news',
            name='slug',
            field=models.SlugField(max_length=250, unique=True),
        ),
    ]
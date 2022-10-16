from django import template
from django.template import defaulttags
from django.db.models import Count, F

from ..models import Category, News

register = template.Library()


@register.simple_tag()
def get_categories():
    return Category.objects.all()


# отбираем только категории, у которых имеется хотя бы одна опубликованная новость
@register.inclusion_tag('categories_list.html')
def show_categories():
    categories = get_categories() \
        .filter(news__is_published=True) \
        .annotate(count=Count('news')) \
        .filter(count__gt=0)

    return {"categories": categories}


@defaulttags.register.filter()
def dict_value(dict_, key):
    return dict_.get(key, 0)

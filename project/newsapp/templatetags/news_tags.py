import math
import re

from django import template
from django.core.cache import cache
from django.template import defaulttags
from django.db.models import Count, F

from project.conf.redis_config import CACHE_TTL
from ..models import Category, News

register = template.Library()


# отбираем только категории, у которых имеется хотя бы одна опубликованная новость
@register.inclusion_tag('categories/categories_list.html')
def show_categories():

    if 'categories' in cache:
        categories = cache.get('categories')
    else:
        categories = Category.objects \
            .filter(news__is_published=True) \
            .annotate(count=Count('news')) \
            .filter(count__gt=0)

        cache.set('categories', categories, timeout=CACHE_TTL)

    return {"categories": categories}


@defaulttags.register.filter()
def dict_value(dict_, key):
    return dict_.get(key, 0)


# region ТЕГИ ДЛЯ НОВОЙ ПАГИНАЦИИ https://www.youtube.com/watch?v=NjTF3kfHdm4&list=WL&index=13&ab_channel=HARDCODD
@register.filter
def set_page(uri, number):
    """Sets `page` property to uri string"""

    if '?page=' in uri or '&page=' in uri:
        uri = re.sub(r'page=[\d]+', f'page={number}', uri)
    elif re.search(r'/?[\w]+=', uri):
        uri = f'{uri}&page={number}'
    else:
        uri = f'?page={number}'

    return uri


@register.filter
def remove_page(uri):
    """Removes `page` property from uri string"""

    if '?page=' in uri or '&page=' in uri:
        uri = re.sub(r'[?&]page=[\d]+', '', uri)
    if re.search('/&', uri):
        uri = re.sub('/&', '/?', uri)

    return uri


@register.filter(name='round')
def roundto(number, to=100):
    return int(math.ceil(number / to)) * to

#endregion
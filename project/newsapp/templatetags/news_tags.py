from django import template
from django.db.models import Count, F

from ..models import Category

register = template.Library()


@register.simple_tag()
def get_categories():
    return Category.objects.all()


@register.inclusion_tag('categories_list.html')
def show_categories():
    # categories = get_categories()
    categories = Category.objects.annotate(count=Count('news'), filter=F('news__is_published')).filter(count__gt=0)
    return {"categories": categories}

from django.db.models import Q
from django.views.decorators.cache import cache_page
from django.views.generic import ListView

from newsapp.models import News
from newsapp.views.utils import get_news_likes_count_dict, get_user_liked_posts
from newsapp.mixins import CacheMixin
from project.conf.redis_config import CACHE_TTL
from project.redis import redis_instance

""" 
для function-based представлений достаточно использовать декоратор @cache_page(CACHE_TTL)
тестирование перфоманса: loadtest -n 100 -k http://localhost:8000/ (https://www.npmjs.com/package/loadtest)
"""
class NewsList(ListView):
# class NewsList(CacheMixin, ListView):
    model = News
    template_name = 'news/news_list.html'
    context_object_name = 'news'
    paginate_by = 10

    # @cache_page(CACHE_TTL, key_prefix='news_cache')
    def get(self, request, *args, **kwargs):
        return super(NewsList, self).get(request, *args, **kwargs)
    
    # @cache_page(CACHE_TTL, key_prefix='news_cache')
    # def get(self, request, *args, **kwargs):
    #     return super(NewsList, self).get(request, *args, **kwargs)

    def get_context_data(self, *, object_list=None, **kwargs):
        # чтобы не перетереть контекст, получаем его из базового класса
        # и добавляем то, что нам нужно
        context = super().get_context_data(**kwargs)
        context['title'] = 'Новости'

        # собираем словарь вида {news_pk: likes_count}
        # почему-то не получается сделать запросом, поэтому сделал вручную через цикл и словарь
        # news_likes_objects = Like.objects.all().annotate(count=Count('news_id'))
        news_likes = get_news_likes_count_dict()
        context['news_likes'] = news_likes

        # собираем список новостей, лайкнутых текущим пользователем
        user_liked_posts = get_user_liked_posts(self.request.user.pk)
        context['user_liked_posts'] = user_liked_posts

        if 'search' in self.request.GET:
            context['search_str'] = self.request.GET['search']

        return context

    def get_queryset(self):
        search_str = self.request.GET.get('search', None)

        if not search_str:
            return News.objects.all()

        news = News.objects.filter(Q(title__icontains=search_str) | Q(content__icontains=search_str))
        return news

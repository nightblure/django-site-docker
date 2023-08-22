from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.db.models import F
from django.db.models import Q
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import CreateView, DeleteView, DetailView, ListView, UpdateView

from commentsapp.models import Comment
from newsapp.forms import NewsForm
from newsapp.models import Category
from newsapp.models import News
from newsapp.models import User
from newsapp.utils import get_news_likes_count_dict, get_user_liked_posts
from project.redis import get_redis_instance


class CreateNews(SuccessMessageMixin, LoginRequiredMixin, CreateView):
    form_class = NewsForm
    template_name = 'news/create_news.html'
    success_message = 'Новость успешно опубликована'

    # записываем в атрибут юзер текущего пользователя при создании новости
    def form_valid(self, form):
        # записываем пользователя, создавшего новость
        form.instance.author = self.request.user
        return super().form_valid(form)


class DeleteNews(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = News
    success_url = reverse_lazy('home_route')
    success_message = 'Новость успешно удалена'


class OneNews(DetailView):
    model = News
    slug_url_kwarg = 'news_slug'
    template_name = 'news/news_page.html'
    context_object_name = 'news_item'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        news_slug = self.kwargs['news_slug']
        comments = Comment.objects.filter(news__slug=news_slug).order_by('-created')
        context['comments'] = comments
        return context

    def get_queryset(self):
        news_slug = self.kwargs['news_slug']
        news_obj = News.objects.filter(slug=news_slug)

        """
        news_item = get_object_or_404(News, pk=news_id)
        # корректный вариант с точки зрения concurrency. += 1 было бы некорректно
        news_item.views_count = F('views_count') + 1
        news_item.save()
        """
        # выполняем запрос update для увеличения счетчика просмотров, если пользователь читает новость
        news_obj.update(views_count=F('views_count') + 1)
        return news_obj


""" 
для function-based представлений достаточно использовать декоратор @cache_page(CACHE_TTL)
тестирование перфоманса: loadtest -n 100 -k http://localhost:8000/ (https://www.npmjs.com/package/loadtest)
"""

redis = get_redis_instance()


class NewsList(ListView):
    model = News
    template_name = 'news/news_list.html'
    context_object_name = 'news'
    paginate_by = 10

    def get_context_data(self, *, object_list=None, **kwargs):

        # чтобы не перетереть контекст, получаем его из базового класса
        # и добавляем то, что нам нужно
        context = super().get_context_data(**kwargs)
        context['title'] = 'Новости'

        # if 'likes' in cache and 'user_liked_posts' in cache:
        #     # context['news_likes'] = cache.get('likes')
        #     # context['user_liked_posts'] = cache.get('user_liked_posts')
        #     return context

        """
        собираем словарь вида {news_pk: likes_count}
        почему-то не получается сделать запросом, поэтому сделал вручную через цикл и словарь
        news_likes_objects = Like.objects.all().annotate(count=Count('news_id'))
        """
        news_likes = get_news_likes_count_dict()
        context['news_likes'] = news_likes

        # собираем список новостей, лайкнутых текущим пользователем
        user_liked_posts = get_user_liked_posts(self.request.user.pk)
        context['user_liked_posts'] = user_liked_posts

        if 'search' in self.request.GET:
            context['search_str'] = self.request.GET['search']

        # cache.set('likes', news_likes, timeout=CACHE_TTL)
        # cache.set('user_liked_posts', user_liked_posts, timeout=CACHE_TTL)
        return context

    def get_queryset(self):
        # if 'news' in cache:
        #     return cache.get('news')

        # todo для поиска сделать отдельное view? текущая реализация выглядит странно
        search_str = self.request.GET.get('search', None)

        if not search_str:
            news = News.objects.all()
        else:
            news = News.objects.filter(Q(title__icontains=search_str) | Q(content__icontains=search_str))

        # cache.set('news', news, timeout=CACHE_TTL)
        return news


class UpdateNewsView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = News
    template_name = 'news/edit_news.html'
    form_class = NewsForm
    success_message = 'Новость успешно отредактирована'
    context_object_name = 'news_obj'


class NewsByCategory(ListView):
    model = News
    template_name = 'news/news_by_category.html'
    context_object_name = 'news'
    allow_empty = True
    paginate_by = 3

    def get_category_id(self):
        category_slug = self.kwargs['category_slug']
        return Category.objects.get(slug=category_slug).pk

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        category_id = self.get_category_id()
        category_title = Category.objects.get(pk=category_id).title
        context['title'] = f'Новости в категории {category_title}'

        # собираем словарь вида {news_pk: likes_count}
        news_likes = get_news_likes_count_dict()
        context['news_likes'] = news_likes

        # собираем список новостей, лайкнутых текущим пользователем
        user_liked_posts = get_user_liked_posts(self.request.user.pk)
        context['user_liked_posts'] = user_liked_posts
        context['category'] = category_title
        return context

    def get_queryset(self):
        category_id = self.get_category_id()

        """
         select_related позволяет вытащить данные из связанной модели сразу (в данном случае из модели Категория)
         условно здесь кейс следующий: странице нужно использовать данные о категории N раз
         с помощью select_related мы заберем данные 1 раз и далее сможем читать их
         столько, сколько нужно, без лишних затрат на выполнение запросов.
         иначе мы бы просто выполняли запросы N раз и ухудшали перфоманс.

         это работает только для моделей со связью 1-1, 1-N
         для связи N-N используется в тех же целях prefetch_related
        """

        return News.objects.filter(
            category=category_id,
            is_published=True,
        ).select_related('category').order_by('-created_at')


class MailSubscribe(LoginRequiredMixin, View):

    def post(self, request, *args, **kwargs):
        user = User.objects.get(pk=request.user.pk)
        user.is_subscriber = True
        user.save()
        messages.success(request, 'Подписка успешно оформлена')
        return redirect('home_route')

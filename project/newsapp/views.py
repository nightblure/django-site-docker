import json
from collections import defaultdict

import requests
from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import ListView, DetailView, CreateView, DeleteView, UpdateView, FormView
from django.urls import reverse_lazy, reverse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import Paginator
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.contrib.auth import login, logout
from django.db.models import F, Count, Q, Sum, Max

from .models import News, Category, Like
from .forms import NewsForm, UserRegisterForm, UserLoginForm, AuthTokenForm


def get_auth_token_message(login, password, type='token'):
    data = {
        "username": f"{login}",
        "password": f"{password}"
    }

    if type == 'token':
        url = 'http://127.0.0.1:8000/auth/token/login'
    else:
        url = 'http://127.0.0.1:8000/api/v1/jwt_auth/'

    response = requests.post(url, data=data)
    response = response.json()
    # if type == 'jwt' and 'detail' in response:
    #     response = json.loads('{"non_field_errors": ["Невозможно войти с предоставленными учетными данными."]}')

    # return response['non_field_errors'][0] if 'non_field_errors' in response else f"token: {response['auth_token']}"
    return response


def auth_token_view(request):
    if request.method == 'POST':

        # вытаскиваем значения текстовых полей по html-атрибуту name
        login = request.POST['login']
        password = request.POST['password']

        message = get_auth_token_message(login, password)

        if 'auth_token' in message:
            messages.info(request, message)
        else:
            messages.error(request, message)

        return redirect('token_route')

    context = {
        'form': AuthTokenForm()
    }

    return render(request, 'auth_token.html', context)


def jwt_auth_token_view(request):
    if request.method == 'POST':

        # вытаскиваем значения текстовых полей по html-атрибуту name
        login = request.POST['login']
        password = request.POST['password']

        message = get_auth_token_message(login, password, 'jwt')

        if 'refresh' in message:
            messages.info(request, message)
        else:
            messages.error(request, message)

        return redirect('jwt_token_route')

    context = {
        'form': AuthTokenForm()
    }

    return render(request, 'jwt_token.html', context)


def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)

        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Успешная регистрация')
            return redirect('home_route')
        else:
            messages.error(request, 'Ошибка регистрации')

    else:
        form = UserRegisterForm()

    context = {
        'form': form,
        'title': 'Регистрация'
    }

    return render(request, 'register.html', context)


def user_login(request):
    if request.method == 'POST':
        form = UserLoginForm(data=request.POST)

        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('home_route')
    else:
        form = UserLoginForm()

    context = {
        'form': form,
        'title': 'Войти'
    }
    return render(request, 'login.html', context)


def user_logout(request):
    logout(request)
    return redirect('login_route')


# def test(request):
#     objects = [x for x in range(8)]
#     p = Paginator(objects, 2)
#     page_num = request.GET.get('page', 1)
#     page_objects = p.get_page(page_num)
#     context = {'page_obj': page_objects}
#     return render(request, 'news_list.html', context)


def get_user_liked_posts(user_id):
    likes_objects = Like.objects.all()
    return [obj.news.pk for obj in likes_objects.filter(user__pk=user_id)]


def get_news_likes_count_dict():
    news_likes = defaultdict(int)
    likes_objects = Like.objects.all()

    for obj in likes_objects:
        news_likes[obj.news.pk] += 1

    return news_likes

# замена для функции index
class NewsList(ListView):
    model = News
    template_name = 'news_list.html'
    context_object_name = 'news'
    paginate_by = 3

    def get_context_data(self, *, object_list=None, **kwargs):
        # чтобы не перетереть контекст, получаем его из базового класса
        # и добавляем то, что нам нужно
        context = super().get_context_data(**kwargs)
        context['title'] = 'Список новостей'

        # собираем словарь вида {news_pk: likes_count}
        # почему-то не получается сделать запросом, поэтому сделал вручную через цикл и словарь
        # news_likes_objects = Like.objects.all().annotate(count=Count('news_id'))
        news_likes = get_news_likes_count_dict()
        context['news_likes'] = news_likes

        # собираем список новостей, лайкнутых текущим пользователем
        user_liked_posts = get_user_liked_posts(self.request.user.pk)
        context['user_liked_posts'] = user_liked_posts
        return context

    def get_queryset(self):
        # тест работы задачи при загрузке главной страницы
        # send_tg_message.delay('hi')
        return News.objects.filter(is_published=True).order_by('-created_at')


def like_view(request, **kwargs):
    news_id = kwargs['news_id']
    news_obj = News.objects.get(pk=news_id)
    Like.objects.create(user=request.user, news=news_obj)
    return redirect('home_route')


def unlike_view(request, **kwargs):
    news_id = kwargs['news_id']
    Like.objects.filter(user=request.user, news__pk=news_id).delete()
    return redirect('home_route')

# замена для функции get_news_by_category
class NewsByCategory(ListView):
    model = News
    template_name = 'news_by_category.html'
    context_object_name = 'news'
    allow_empty = True
    paginate_by = 3

    def get_category_id(self, category_slug):
        # return self.kwargs['category_id']
        return Category.objects.get(slug=category_slug).pk

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        category_id = self.get_category_id(self.kwargs['category_slug'])
        category_title = Category.objects.get(pk=category_id).title
        context['title'] = f'Новости в категории {category_title}'

        # собираем словарь вида {news_pk: likes_count}
        news_likes = get_news_likes_count_dict()
        context['news_likes'] = news_likes

        # собираем список новостей, лайкнутых текущим пользователем
        user_liked_posts = get_user_liked_posts(self.request.user.pk)
        context['user_liked_posts'] = user_liked_posts

        return context

    def get_queryset(self):
        category_id = self.get_category_id(self.kwargs['category_slug'])

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


# def index(request):
#     # вывод в порядке добавления
#     # news = News.objects.all()
#     # вывод по убыванию значения поля created_at
#     news = News.objects.order_by('-created_at')
#
#     # словарь переменных, передаваемых шаблону
#     context = {
#         'news': news,
#         'title': 'Список новостей',
#     }
#
#     # шаблон для рендера ищется по умолчанию в папке templates
#     return render(request, template_name='index.html', context=context)


# def get_news_by_category(request, category_title):
#     category = Category.objects.get(title=category_title)
#     news = News.objects.filter(category_id=category.pk)
#     title = f'Новости в категории {category.title}'
#
#     context = {
#         'news': news,
#         'category': category,
#         'title': title,
#     }
#
#     return render(request, 'news_by_category.html', context)


# def get_one_news(request, news_id):
#
#     cache_key = f'news_by_id_{news_id}'
#     news_item = cache.get(cache_key)
#
#     # чекаем наличие новости в кэше
#     if news_item:
#         print('news from cache')
#     else:
#         news_item = get_object_or_404(News, pk=news_id)
#         cache.set(cache_key, news_item)
#         print('news from DB')
#
#     context = {
#         'news_item': news_item
#     }
#     return render(request, 'one_news.html', context)


# замена для функции get_one_news
class OneNews(DetailView):
    model = News
    pk_url_kwarg = 'news_id'
    template_name = 'news_page.html'
    context_object_name = 'news_item'

    def get_queryset(self):
        news_id = self.kwargs['news_id']
        news_obj = News.objects.filter(pk=news_id)

        """
        news_item = get_object_or_404(News, pk=news_id)
        # корректный вариант с точки зрения concurrency. += 1 было бы некорректно
        news_item.views_count = F('views_count') + 1
        news_item.save()
        """
        # выполняем запрос update для увеличения счетчика просмотров, если пользователь читает новость
        news_obj.update(views_count=F('views_count') + 1)
        return news_obj


# замена для функции add_news
class CreateNews(LoginRequiredMixin, CreateView):
    form_class = NewsForm
    template_name = 'add_news.html'

    # записываем в атрибут юзер текущего пользователя при создании новости
    def form_valid(self, form):
        form.instance.user = self.request.user
        return super().form_valid(form)

    # используем свойства миксина, чтобы запретить добавление новостей для неавторизованного пользователя
    # login_url = reverse_lazy('home_route')
    raise_exception = True
    # редирект после отработки формы. по умолчанию редиректит на созданный объект
    # success_url = reverse_lazy('home_route')


# def add_news(request):
#
#     if request.method == 'POST':
#         form = NewsForm(request.POST, request.FILES)
#
#         if form.is_valid():
#             # распаковка словаря с данными, прошедшими валидацию, и сохранение в БД
#             # используется для форм, не связанных с моделью
#             #news = News.objects.create(**form.cleaned_data)
#             news = form.save()
#             return redirect(news) # 'home_route'
#     else:
#         form = NewsForm()
#
#     context = {
#         'title': 'Добавление новости',
#         'form': form
#     }
#
#     return render(request, 'add_news.html', context)


class DeleteNews(SuccessMessageMixin, DeleteView):
    model = News

    def get_success_url(self):
        messages.success(self.request, f'Новость успешно удалена')
        return reverse('home_route')

    def delete(self, request, *args, **kwargs):
        self.object = self.get_object()
        name = self.object.name
        request.session['name'] = name  # name will be change according to your need
        return super(DeleteView, self).delete(request, *args, **kwargs)


# почему-то не работает :с
# class edit_news(LoginRequiredMixin, UpdateView):
#     fields = ['title', 'content']
#     model = News
#     # fields = '__all__'
#     success_url = reverse_lazy('news_by_category_route')
#     template_name = 'edit_news.html'

def edit_news(request, pk):
    news_obj = News.objects.get(pk=pk)

    if request.method == 'POST':
        form = NewsForm(request.POST, request.FILES)

        if form.is_valid():
            data = form.cleaned_data
            data['user'] = request.user
            data['image'] = news_obj.image
            news_obj.__dict__.update(data)
            news_obj.category = Category.objects.get(title=data['category'])
            news_obj.save()
            messages.success(request, f'Новость успешно отредактирована')
            return redirect(news_obj)
    else:
        form = NewsForm()

    context = {
        'form': form,
        'categories': Category.objects.all(),
        'news_obj': news_obj,
        'title': f'Edit {news_obj.title}'
    }
    return render(request, 'edit_news.html', context)

import json
import os
from collections import defaultdict

import requests
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import PasswordChangeView
from django.contrib.messages.views import SuccessMessageMixin
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.views import View
from django.views.generic import ListView, DetailView, CreateView, DeleteView, UpdateView, FormView
from django.urls import reverse_lazy, reverse
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.paginator import Paginator
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.contrib import messages
from django.contrib.auth import login, logout
from django.db.models import F, Count, Q, Sum, Max
from django.contrib.auth.models import User

from project import settings
from .models import News, Category, Like
from .forms import NewsForm, UserRegisterForm, UserLoginForm, AuthTokenForm, EditUserProfileForm


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


class AuthTokenView(View):

    def get(self, request):
        return render(request, 'auth_token.html', {'form': AuthTokenForm()})

    def post(self, request):
        # вытаскиваем значения текстовых полей по html-атрибуту name
        login = request.POST['login']
        password = request.POST['password']

        message = get_auth_token_message(login, password)

        if 'auth_token' in message:
            messages.info(request, message)
        else:
            messages.error(request, message)

        return redirect('token_route')


class JWTTokenView(View):

    def get(self, request):
        return render(request, 'jwt_token.html', {'form': AuthTokenForm()})

    def post(self, request):
        # вытаскиваем значения текстовых полей по html-атрибуту name
        login = request.POST['login']
        password = request.POST['password']

        message = get_auth_token_message(login, password, 'jwt')

        if 'refresh' in message:
            messages.info(request, message)
        else:
            messages.error(request, message)

        return redirect('jwt_token_route')


class RegisterView(View):

    def get(self, request):
        return render(request, 'register.html', {'form': UserRegisterForm()})

    def post(self, request):
        form = UserRegisterForm(request.POST)

        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Успешная регистрация')
            return redirect('home_route')
        else:
            messages.error(request, 'Ошибка регистрации')

        return redirect('register_route')


class UserLoginView(View):

    def get(self, request):
        return render(request, 'login.html', {'form': UserLoginForm()})

    def post(self, request):
        form = UserLoginForm(data=request.POST)

        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('home_route')
        else:
            messages.error(request, 'Указаны неверные данные')

        return redirect('login_route')


def user_logout(request):
    logout(request)
    return redirect('login_route')


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


@login_required
def like_view(request, **kwargs):
    news_id = kwargs['news_id']
    news_obj = News.objects.get(pk=news_id)
    like_obj = Like.objects.filter(user=request.user, news__pk=news_id)

    if like_obj:
        like_obj.delete()
    else:
        Like.objects.create(user=request.user, news=news_obj)

    category = request.COOKIES['category']
    return redirect('news_by_category_route', category_slug=category)


# замена для функции get_news_by_category
class NewsByCategory(ListView):
    model = News
    template_name = 'news_by_category.html'
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

    def render_to_response(self, context, **response_kwargs):
        category = self.kwargs['category_slug']
        response = super(ListView, self).render_to_response(context, **response_kwargs)
        """
        костыль:
        запоминаем текущую категорию, чтобы вьюхи для кнопок лайка и анлайка 
        редиректили на текущую категорию. этот функционал можно полностью выпилить,
        если реализовать пост-запрос лайков/анлайков без релоада страницы
        """
        response.set_cookie('category', category)
        return response


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


class DeleteNews(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = News

    def get_success_url(self):
        messages.success(self.request, f'Новость успешно удалена')
        return reverse('home_route')

    def delete(self, request, *args, **kwargs):
        news_obj = self.get_object()
        News.objects.get(pk=news_obj.pk).delete()


class EditNewsView(SuccessMessageMixin, LoginRequiredMixin, UpdateView):
    # fields = ['title', 'content', 'is_published', 'category', 'image']
    model = News
    # success_url = reverse_lazy('news_by_category_route')
    template_name = 'edit_news.html'
    form_class = NewsForm
    success_message = 'Новость успешно изменена'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        news_obj = self.get_object()
        context['title'] = f'Edit {news_obj.title}'
        return context


class EditUserProfileView(LoginRequiredMixin, UpdateView):
    model = User
    form_class = EditUserProfileForm
    template_name = 'edit_user_profile.html'

    def get_success_url(self):
        messages.success(self.request, 'Настройки успешно применены')
        user = self.get_object()
        return reverse('edit_profile_route', kwargs={'user_name': user.username})

    def get_object(self, queryset=None):
        return User.objects.get(pk=self.request.user.pk)


class ChangeUserPasswordView(SuccessMessageMixin, PasswordChangeView):
    template_name = 'change_password.html'
    # form_class = ChangeUserPasswordForm
    success_message = 'Пароль успешно изменен'
    success_url = reverse_lazy('home_route')

    def form_invalid(self, form):
        messages.error(self.request, 'Проверьте, что пароль удовлетворяет требованиям безопасности, \
                                     и совпадает с повторно введенным паролем')
        return super().form_invalid(form)

import json
import os
from collections import defaultdict

import requests
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.contrib.auth.views import *
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

from newsapp.mixins import ResetPasswordMixin
from project import settings
from .models import News, Category, Like, User, Comment
from .forms import NewsForm, UserRegisterForm, UserLoginForm, AuthTokenForm, EditUserProfileForm, ChangeUserPasswordForm


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


class AuthTokenView(FormView):
    form_class = AuthTokenForm
    template_name = 'auth_token.html'

    def post(self, request, *args, **kwargs):
        # вытаскиваем значения текстовых полей по html-атрибуту name
        login = request.POST['login']
        password = request.POST['password']

        message = get_auth_token_message(login, password)

        if 'auth_token' in message:
            messages.info(request, message)
        else:
            messages.error(request, message)

        return redirect('token_route')


class JWTTokenView(FormView):
    form_class = AuthTokenForm
    template_name = 'jwt_token.html'

    def post(self, request, *args, **kwargs):
        # вытаскиваем значения текстовых полей по html-атрибуту name
        login = request.POST['login']
        password = request.POST['password']

        message = get_auth_token_message(login, password, 'jwt')

        if 'refresh' in message:
            messages.info(request, message)
        else:
            messages.error(request, message)

        return redirect('jwt_token_route')


class SignupView(FormView):
    form_class = UserRegisterForm
    template_name = 'signup.html'

    def post(self, request, *args, **kwargs):
        form = UserRegisterForm(request.POST)

        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, 'Успешная регистрация')
            return redirect('home_route')
        else:
            if User.objects.filter(username=request.POST['username']).exists():
                messages.error(request, 'Пользователь с таким логином уже зарегистрирован')
            else:
                messages.error(request, 'Ошибка регистрации')

        return redirect('register_route')


class UserLoginView(ResetPasswordMixin, FormView):
    form_class = UserLoginForm
    template_name = 'login.html'

    def post(self, request, *args, **kwargs):

        if 'reset_pass' in request.POST:
            username = request.POST['username']
            user = User.objects.filter(username=username).first()

            if not user:
                messages.error(self.request, f'Пользователя {username} не существует')
                return redirect('home_route')

            self.reset_password(user)
            messages.success(self.request, 'Пароль сброшен на 1234User. Войдите в учетную запись с новым паролем')
            return redirect('home_route')

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

        if 'search' in self.request.GET:
            context['search_str'] = self.request.GET['search']

        return context

    def get_queryset(self):
        search_str = self.request.GET.get('search', None)

        if not search_str:
            return News.objects.all()

        news = News.objects.filter(Q(title__icontains=search_str) | Q(content__icontains=search_str))
        return news


@login_required(login_url='login_route')
def like_view(request, **kwargs):
    news_id = kwargs['news_id']
    news_obj = News.objects.get(pk=news_id)
    like_obj = Like.objects.filter(user=request.user, news__pk=news_id)

    if like_obj:
        like_obj.delete()
    else:
        Like.objects.create(user=request.user, news=news_obj)

    # редирект на текущую страницу
    return redirect('home_route')


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


# замена для функции get_one_news
class OneNews(DetailView):
    model = News
    pk_url_kwarg = 'news_id'
    template_name = 'news_page.html'
    context_object_name = 'news_item'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        news_id = self.kwargs['news_id']
        comments = Comment.objects.filter(news__pk=news_id).order_by('-created')
        context['comments'] = comments
        return context

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
    success_url = reverse_lazy('home_route')
    success_message = 'Новость успешно удалена'


class EditNewsView(SuccessMessageMixin, LoginRequiredMixin, UpdateView):
    model = News
    template_name = 'edit_news.html'
    form_class = NewsForm
    success_message = 'Новость успешно отредактирована'
    context_object_name = 'news_obj'


class EditUserProfileView(ResetPasswordMixin, LoginRequiredMixin, UpdateView):
    model = User
    form_class = EditUserProfileForm
    template_name = 'edit_user_profile.html'

    def get_success_url(self):
        messages.success(self.request, 'Профиль успешно изменен')
        return reverse('edit_profile_route', kwargs={'user_name': self.request.user.username})

    def get_object(self, queryset=None):
        return User.objects.get(pk=self.request.user.pk)

    def post(self, request, *args, **kwargs):
        if 'reset_pass' in request.POST:
            self.reset_password(request.user)
            logout(request)
            messages.success(request, 'Пароль сброшен на 1234User. Войдите в учетную запись с новым паролем')
            return redirect('home_route')

        return super().post(request, *args, **kwargs)


class ChangeUserPasswordView(SuccessMessageMixin, PasswordChangeView):
    template_name = 'change_password.html'
    # form_class = ChangeUserPasswordForm
    success_message = 'Пароль успешно изменен'
    success_url = reverse_lazy('home_route')

    def form_invalid(self, form):
        messages.error(self.request, 'Проверьте, что пароль удовлетворяет требованиям безопасности, \
                                     и совпадает с повторно введенным паролем')
        return super().form_invalid(form)


def comment_view(request, news_id, username):

    user_obj = User.objects.get(pk=request.user.pk)
    news_obj = News.objects.get(pk=news_id)

    comment_text = request.POST['comment_text']

    if str(comment_text).isspace():
        messages.error(request, 'Комментарий не может быть пустым')
    else:
        comment_obj = Comment.objects.create(
            user=user_obj,
            news=news_obj,
            text=comment_text
        )

    return redirect('one_news_route', news_id=news_id)


def remove_comment_view(request, news_id, comment_id):
    comment_obj = Comment.objects.get(pk=comment_id).delete()
    return redirect('one_news_route', news_id=news_id)


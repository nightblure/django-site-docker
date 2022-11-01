from django.shortcuts import render, get_object_or_404, redirect
from django.views import View
from django.views.generic import FormView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages

from newsapp.models import User
from newsapp.forms import AuthTokenForm
from .utils import get_auth_token_message


class AuthTokenView(LoginRequiredMixin, FormView):
    form_class = AuthTokenForm
    template_name = 'auth/auth_token.html'

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


class JWTTokenView(LoginRequiredMixin, FormView):
    form_class = AuthTokenForm
    template_name = 'auth/jwt_token.html'

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


class MailSubscribe(LoginRequiredMixin, View):

    def post(self, request, *args, **kwargs):
        user = User.objects.get(pk=request.user.pk)
        user.is_subscriber = True
        user.save()
        messages.success(request, 'Подписка успешно оформлена')
        return redirect('home_route')

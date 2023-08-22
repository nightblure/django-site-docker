from django.contrib import messages
from django.contrib.auth import logout, login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import redirect
from django.views.generic import FormView

from newsapp.forms import AuthTokenForm
from newsapp.forms import UserRegisterForm, UserLoginForm
from newsapp.mixins import ResetPasswordMixin
from newsapp.models import User
from newsapp.utils import get_auth_token_message


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


class SignupView(FormView):
    form_class = UserRegisterForm
    template_name = 'auth/signup.html'

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


class LoginView(ResetPasswordMixin, FormView):
    form_class = UserLoginForm
    template_name = 'auth/login.html'

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

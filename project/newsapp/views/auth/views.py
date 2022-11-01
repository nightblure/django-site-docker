from django.contrib import messages
from django.contrib.auth import logout, login
from django.shortcuts import redirect
from django.views.generic import FormView

from newsapp.forms import UserRegisterForm, UserLoginForm
from newsapp.models import User
from newsapp.views.mixins import ResetPasswordMixin


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

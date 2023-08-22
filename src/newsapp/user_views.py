from django.contrib import messages
from django.contrib.auth import login, logout
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import PasswordChangeView
from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import redirect
from django.urls import reverse, reverse_lazy
from django.views.generic import UpdateView, FormView

from newsapp.forms import UserLoginForm, EditUserProfileForm
from newsapp.models import User
from newsapp.mixins import ResetPasswordMixin


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
    template_name = 'auth/change_password.html'
    # form_class = ChangeUserPasswordForm
    success_message = 'Пароль успешно изменен'
    success_url = reverse_lazy('home_route')

    def form_invalid(self, form):
        messages.error(self.request, 'Проверьте, что пароль удовлетворяет требованиям безопасности, \
                                     и совпадает с повторно введенным паролем')
        return super().form_invalid(form)

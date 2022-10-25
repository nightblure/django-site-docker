from django.contrib.auth.hashers import make_password

from newsapp.models import User


class ResetPasswordMixin:
    @staticmethod
    def reset_password(user):
        user = User.objects.filter(pk=user.pk).first()
        user.password = make_password('1234User')
        user.save()

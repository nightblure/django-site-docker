from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UserChangeForm, PasswordChangeForm
from django.utils.html import format_html

from .models import Category, News, User
from django.core.exceptions import ValidationError
import re
from string import Template
from django.utils.safestring import mark_safe
from django.forms import ImageField, ModelForm


class AuthTokenForm(forms.Form):
    login = forms.CharField(label='', widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'placeholder': 'Username'
        }))

    password = forms.CharField(label='', widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'placeholder': 'Password',
        }))


# примеры формы НЕ СВЯЗАННОЙ с моделью. тут приходится по сути дублировать свойства полей из модели
# формы, не связанные с моделью, нужны, когда нужно совершить действие, не связанное ни с одной из моделей
# например отправить что-то на почту и т.д.
# class NewsForm(forms.Form):
#
#     title = forms.CharField(max_length=150, label='Название', widget=forms.TextInput(
#         attrs={
#             'class': 'form-control'
#         }))
#
#     content = forms.CharField(label='Текст', widget=forms.Textarea(
#         attrs={
#             'class': 'form-control',
#             'rows': 5
#         }))
#
#     is_published = forms.BooleanField(label='Опубликовано?', initial=True)
#
#     categories = Category.objects.all()
#     category = forms.ModelChoiceField(empty_label='Выберите категорию',
#                                       label='Категория',
#                                       queryset=categories,
#                                       widget=forms.Select(attrs={'class': 'form-control'}))

# примеры формы СВЯЗАННОЙ с моделью. поскольку она связана с моделью, можно упростить генерацию модели
class NewsForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['category'].empty_label = None
        self.fields['is_published'].empty_label = None
        self.fields['title'].label = 'Название'
        self.fields['content'].label = 'Текст новости'
        self.fields['is_published'].label = 'Опубликовано?'
        self.fields['category'].label = 'Категория'

    class Meta:
        model = News
        fields = ['title', 'content', 'is_published', 'category', 'image']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'content': forms.Textarea(attrs={'class': 'form-control', 'rows': 5}),
            'category': forms.Select(attrs={'class': 'form-control'}),
        }

    # пример кастомного валидатора (проверяем начинается ли название новости с цифры)
    def clean_title(self):
        title = self.cleaned_data['title']
        if re.match(r'\d', title):
            raise ValidationError('Название не должно начинаться с цифры')
        return title


class CategoryForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['title'].label = 'Название'

    class Meta:
        model = Category
        fields = ('title', )
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
        }


class UserLoginForm(AuthenticationForm):
    username = forms.CharField(label='Имя пользователя', widget=forms.TextInput(attrs={'class': 'form-control'})),
    password = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': 'form-control'}))


# ПОЧЕМУ ВИДЖЕТЫ НЕ РАБОТАЮТ ПОЧТИ ДЛЯ ВСЕХ ПОЛЕЙ?
class UserRegisterForm(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # self.fields['username'].widget.attrs.pop('autofocus')

    username = forms.CharField(label='Имя пользователя'),
    email = forms.EmailField(label='E-mail', widget=forms.EmailInput(attrs={'class': 'form-control'})),
    password1 = forms.CharField(label='Пароль', widget=forms.PasswordInput(attrs={'class': 'form-control'})),
    password2 = forms.CharField(label='Подтверждение пароля', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    is_subscriber = forms.BooleanField(label='Подписаться на рассылку контента', required=False)

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2', 'is_subscriber')


class EditUserProfileForm(ModelForm):
    username = forms.CharField(label='Имя пользователя', widget=forms.TextInput(attrs={'class': 'form-control'})),
    email = forms.EmailField(label='E-mail', widget=forms.EmailInput(attrs={'class': 'form-control'}))
    is_subscriber = forms.BooleanField(label='Подписка на рассылку', required=False)

    class Meta:
        model = User
        fields = ('username', 'email', 'avatar', 'is_subscriber')


class ChangeUserPasswordForm(PasswordChangeForm):
    old_password = forms.CharField(label='Старый пароль', widget=forms.TextInput(attrs={'class': 'form-control'})),
    new_password1 = forms.CharField(label='Новый пароль', widget=forms.PasswordInput(attrs={'class': 'form-control'})),
    new_password2 = forms.CharField(label='Повторите пароль', widget=forms.PasswordInput(attrs={'class': 'form-control'})),

    class Meta:
        model = User
        fields = ('old_password', 'new_password1', 'new_password2')

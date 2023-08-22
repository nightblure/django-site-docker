from django.contrib import admin

from categoriesapp.models import Category
from commentsapp.models import Comment
from likesapp.models import Like
from newsapp.models import News, User
from django import forms
from ckeditor.widgets import CKEditorWidget


class NewsAdminForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorWidget())

    class Meta:
        model = News
        fields = '__all__'


# Расширение функционала админки
class NewsAdmin(admin.ModelAdmin):
    form = NewsAdminForm
    # поля, отображаемые в админке
    list_display = [
        'id', 'title', 'slug', 'author',
        'category', 'created_at', 'updated_at',
        'is_published', 'image'
    ]
    # поля-ссылки на записи
    list_display_links = ['id', 'title']
    search_fields = ['title', 'content']
    # поля доступные для быстрого редактирования в админке
    list_editable = ['is_published', 'category', 'author']
    # поля, запрещаемые для редактирования в админке
    readonly_fields = ['created_at', 'views_count']

    # автозаполнение слага
    prepopulated_fields = {
        'slug': ('title',)
    }


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'slug']
    list_display_links = ['id', 'title', 'slug']
    search_fields = ['title', ]

    # автозаполнение слага
    prepopulated_fields = {
        'slug': ('title',)
    }


class LikeAdmin(admin.ModelAdmin):
    list_display = ('news_id', 'news', 'user')
    list_display_links = ('news_id', 'news', 'user')


class CommentAdmin(admin.ModelAdmin):
    list_display = ('user', 'news', 'text')
    list_display_links = ('user', 'news', 'text')


class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'bio', 'avatar', 'is_subscriber')
    list_display_links = ('username', 'email', 'bio', 'avatar', 'is_subscriber')


# Register your models here.
admin.site.register(Category, CategoryAdmin)
admin.site.register(News, NewsAdmin)
admin.site.register(Like, LikeAdmin)
admin.site.register(Comment, CommentAdmin)
admin.site.register(User, UserAdmin)

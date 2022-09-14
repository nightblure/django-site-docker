from django.contrib import admin
from .models import News, Category
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
    list_display = ['id', 'title', 'category', 'created_at', 'updated_at', 'is_published', 'image']
    # поля-ссылки на записи
    list_display_links = ['id', 'title']
    search_fields = ['title', 'content']
    # поля доступные для быстрого редактирования в админке
    list_editable = ['is_published', 'category']
    # поля, запрещаемые для редактирования в админке
    readonly_fields = ['created_at', 'views_count']


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'slug']
    list_display_links = ['id', 'title', 'slug']
    search_fields = ['title',]

    # автозаполнение слага
    prepopulated_fields = {
        'slug': ('title',)
    }


# Register your models here.
admin.site.register(Category, CategoryAdmin)
admin.site.register(News, NewsAdmin)

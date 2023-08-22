from django.urls import path

from newsapp.views import (
    CreateNews,
    DeleteNews,
    OneNews,
    UpdateNewsView,
    NewsByCategory
)

urlpatterns = [
    path('by-category/<slug:category_slug>', NewsByCategory.as_view(), name='news_by_category_route'),
    path('create', CreateNews.as_view(), name='create_news_route'),
    path('<slug:news_slug>', OneNews.as_view(), name='one_news_route'),
    path('delete/<slug:slug>', DeleteNews.as_view(), name='delete_news_route'),
    path('edit/<slug:slug>', UpdateNewsView.as_view(), name='edit_news_route')
]

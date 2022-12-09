from django.urls import path

from newsapp.views.news.create import CreateNews
from newsapp.views.news.delete import DeleteNews
from newsapp.views.news.detail import OneNews
from newsapp.views.news.update import UpdateNewsView
from newsapp.views.news.views import NewsByCategory

urlpatterns = [
    path('by-category/<slug:category_slug>/', NewsByCategory.as_view(), name='news_by_category_route'),
    path('<int:news_id>/', OneNews.as_view(), name='one_news_route'),
    path('create/', CreateNews.as_view(), name='create_news_route'),
    path('delete/<int:pk>/', DeleteNews.as_view(), name='delete_news_route'),
    path('edit/<int:pk>/', UpdateNewsView.as_view(), name='edit_news_route')
]

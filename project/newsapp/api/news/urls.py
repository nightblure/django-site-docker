from django.urls import path, include, re_path

from newsapp.api.news.api import (
    NewsGetApi, UserNewsGetApi, OneNewsGetApi,
    NewsUpdateApi
)

urlpatterns = [
    path('', NewsGetApi.as_view()),
    path('my_news/', UserNewsGetApi.as_view()),
    path('<str:slug_title>/', OneNewsGetApi.as_view()),
    path('<str:slug_title>/update/', NewsUpdateApi.as_view())
    # path('api/v1/news/<int:pk>/', NewsAPIUpdate.as_view()),
    # path('api/v1/news_delete/<int:pk>/', NewsAPIDelete.as_view()),
    # path('by-category/<slug:category_slug>/', NewsByCategory.as_view(), name='news_by_category_route'),
    # path('<int:news_id>/', OneNews.as_view(), name='one_news_route'),
    # path('create/', CreateNews.as_view(), name='create_news_route'),
    # path('delete/<int:pk>/', DeleteNews.as_view(), name='delete_news_route'),
    # path('edit/<int:pk>/', UpdateNewsView.as_view(), name='edit_news_route')
]
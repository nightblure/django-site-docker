from django.urls import path

from newsapp.api.news.api import (
    NewsGetApi, UserNewsGetApi, OneNewsGetApi,
    NewsUpdateApi, NewsDeleteApi, NewsCreateApi,
    NewsGetByCategoryApi
)

urlpatterns = [
    path('', NewsGetApi.as_view(), name='news_api_route'),
    path('my_news/', UserNewsGetApi.as_view(), name='user_news_api_route'),
    path('create/', NewsCreateApi.as_view(), name='news_create_api_route'),
    path('<str:slug_title>/', OneNewsGetApi.as_view(), name='one_news_api_route'),
    path('by-category/<slug:category_slug>/', NewsGetByCategoryApi.as_view(), name='news_by_category_api_route'),
    path('<str:slug_title>/update/', NewsUpdateApi.as_view(), name='update_news_api_route'),
    path('<str:slug_title>/delete/', NewsDeleteApi.as_view(), name='delete_news_api_route')
]

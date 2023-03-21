from django.urls import path

from newsapp.api.news.api import (
    NewsGetApi, UserNewsGetApi, OneNewsGetApi,
    NewsUpdateApi, NewsDeleteApi, NewsCreateApi
)

urlpatterns = [
    path('', NewsGetApi.as_view()),
    path('my_news/', UserNewsGetApi.as_view()),
    path('create/', NewsCreateApi.as_view()),
    path('<str:slug_title>/', OneNewsGetApi.as_view()),
    # path('by-category/<slug:category_slug>/', NewsByCategory.as_view(), name='news_by_category_route'),
    path('<str:slug_title>/update/', NewsUpdateApi.as_view()),
    path('<str:slug_title>/delete/', NewsDeleteApi.as_view())
]
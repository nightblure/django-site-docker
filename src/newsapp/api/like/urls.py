from django.urls import path

from newsapp.api.like.api import LikeNewsApi, UnlikeNewsApi

urlpatterns = [
    path('like/<str:news_slug_title>/', LikeNewsApi.as_view()),
    path('unlike/<str:news_slug_title>/', UnlikeNewsApi.as_view()),
]
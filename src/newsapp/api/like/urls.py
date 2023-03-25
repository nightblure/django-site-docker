from django.urls import path

from newsapp.api.like.api import LikeNewsApi, UnlikeNewsApi

urlpatterns = [
    path('like/<str:news_slug_title>/', LikeNewsApi.as_view(), name='like_api_route'),
    path('unlike/<str:news_slug_title>/', UnlikeNewsApi.as_view(), name='unlike_api_route'),
]
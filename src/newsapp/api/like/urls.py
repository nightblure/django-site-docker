from django.urls import path

from newsapp.api.like.api import LikeNewsApi, UnlikeNewsApi, LikesApi

urlpatterns = [
    path('', LikesApi.as_view(), name='get_likes_api_route'),
    path('like/<str:news_slug_title>', LikeNewsApi.as_view(), name='like_api_route'),
    path('unlike/<str:news_slug_title>', UnlikeNewsApi.as_view(), name='unlike_api_route'),
]
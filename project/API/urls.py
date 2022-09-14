from rest_framework import routers

from django.urls import path, include, re_path

from api.views import *

BASE_API_URL = 'api/v1'

router = routers.SimpleRouter()
router.register(r'news', NewsViewSet, basename='news')

# print(router.urls)

urlpatterns = [
    path(f'{BASE_API_URL}/news/', NewsAPIList.as_view()),
    path(f'{BASE_API_URL}/news/<int:pk>/', NewsAPIUpdate.as_view()),
    path(f'{BASE_API_URL}/news_delete/<int:pk>/', NewsAPIDelete.as_view()),

    # маршруты, сгенерированные роутером
    # path(f'{BASE_API_URL}/', include(router.urls)),

    # с этим маршрутом становится доступна Session-based аутентификация
    # также в UI появляется кнопка login/logout
    path('api-auth/', include('rest_framework.urls')),

    # аутентификация по токену. генерация токена осуществляется
    # post-запросом на эндпоинт http://127.0.0.1:8000/auth/token/login
    # пример запроса:
    # {
    #     "username": "tokenuser",
    #     "password": "1234user"
    # }
    path(f'{BASE_API_URL}/auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
]
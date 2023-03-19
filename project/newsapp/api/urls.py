from rest_framework import routers

from django.urls import path, include, re_path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from newsapp.api.views import (
    NewsViewSet, NewsAPIList,
    NewsAPIUpdate, NewsAPIDelete,
    CategoryAPIList
)

router = routers.SimpleRouter()
router.register(r'news', NewsViewSet, basename='news')

# print(router.urls)

"""
маршруты для работы аутентификации на базе обычных токенов
для авторизации в Postman нужно добавить заголовок Authorization со значением "Token <token>"
токен генерируется на странице http://127.0.0.1:8000/auth/token/login
также для генерации токена на адрес выше можно отправить post-запрос:
{
    "username": "tokenuser",
    "password": "1234user"
}
"""
auth_patterns = [
    path('api/v1/auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
]

"""
# маршруты для работы аутентификации на базе JWT-токенов (Json Web Tokens)
# для авторизации в Postman нужно добавить заголовок Authorization со значением "Bearer <token>"
# токен генерируется на странице http://127.0.0.1:8000/api/v1/jwt_auth/
# также для генерации токена на адрес выше можно отправить post-запрос (нужно использовать access-часть токена!):
# {
#     "username": "tokenuser",
#     "password": "1234user"
# }
# https://www.youtube.com/watch?v=b4C6UTlSC-o&t=4s&ab_channel=selfedu
"""

jwt_patterns = [

    path('api/v1/jwt_auth/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/v1/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/v1/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]

urlpatterns = [
    path('api/v1/news/', include('newsapp.api.news_api.urls')),

    path('api/v1/categories/', CategoryAPIList.as_view()),

    # маршруты, сгенерированные роутером
    # path(f'{BASE_API_URL}/', include(router.urls)),

    # с этим маршрутом становится доступна Session-based аутентификация
    # также в UI появляется кнопка login/logout
    path('api-auth/', include('rest_framework.urls')),
]

urlpatterns.extend(auth_patterns)
urlpatterns.extend(jwt_patterns)
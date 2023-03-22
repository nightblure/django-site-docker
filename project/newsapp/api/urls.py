from rest_framework import routers

from django.urls import path, include, re_path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

"""
JWT Authorization example:
POST http://127.0.0.1:8000/api/v1/jwt_auth/
# {
#     "username": "admin",
#     "password": "1234user"
# }
"""

auth_patterns = [
    path('api/v1/auth/', include('djoser.urls')),
    re_path(r'^auth/', include('djoser.urls.authtoken')),
]

jwt_patterns = [

    path('api/v1/jwt_auth/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/v1/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/v1/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]

urlpatterns = [
    path('api/v1/', include('newsapp.api.like.urls')),
    path('api/v1/news/', include('newsapp.api.news.urls')),
    path('api/v1/categories/', include('newsapp.api.category.urls')),

    # с этим маршрутом становится доступна Session-based аутентификация
    # также в UI появляется кнопка login/logout
    path('api-auth/', include('rest_framework.urls')),
]

urlpatterns.extend(auth_patterns)
urlpatterns.extend(jwt_patterns)

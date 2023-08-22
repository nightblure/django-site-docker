from django.urls import path, include

from newsapp.auth_views import user_logout, LoginView, SignupView, AuthTokenView, JWTTokenView
from categoriesapp.views import CreateCategoryView
from commentsapp.views import comment_view, remove_comment_view
from newsapp.user_views import EditUserProfileView, ChangeUserPasswordView
from newsapp.views import MailSubscribe, NewsList
from likesapp.views import like_view

urlpatterns = [
    path('', NewsList.as_view(), name='home_route'),
    path('news/', include('newsapp.news_urls')),

    path('register', SignupView.as_view(), name='signup_route'),
    path('login', LoginView.as_view(), name='login_route'),
    path('logout', user_logout, name='logout_route'),

    path('auth-token', AuthTokenView.as_view(), name='token_route'),
    path('jwt-auth-token', JWTTokenView.as_view(), name='jwt_token_route'),

    path('like/<int:news_id>', like_view, name='like_route'),

    path('user/edit/<str:user_name>', EditUserProfileView.as_view(), name='edit_profile_route'),
    path('user/change-password/<str:user_name>', ChangeUserPasswordView.as_view(), name='change_password_route'),

    path('comment/create/<int:news_id>/<str:username>', comment_view, name='add_comment_route'),
    path('comment/delete/<int:news_id>/<int:comment_id>', remove_comment_view, name='remove_comment_route'),

    path('category/create', CreateCategoryView.as_view(), name='create_category_route'),

    path('subscribe', MailSubscribe.as_view(), name='subscribe_route'),
]

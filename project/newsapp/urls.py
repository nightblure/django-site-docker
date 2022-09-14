from django.urls import path
from .views import *

urlpatterns = [
    # path('', index, name='home_route'),
    path('', HomeNews.as_view(), name='home_route'),

    # path('news_by_category/<int:category_id>/', get_news_by_category, name='news_by_category_route'),
    # path('news_by_category/<int:category_id>/', NewsByCategory.as_view(), name='news_by_category_route'),
    path('news_by_category/<slug:category_slug>/', NewsByCategory.as_view(), name='news_by_category_route'),

    # path('news/<int:news_id>/', get_one_news, name='one_news_route'),
    path('news/<int:news_id>/', OneNews.as_view(), name='one_news_route'),

    # path('news/add-news/', add_news, name='add_news_route'),
    path('news/add-news/', CreateNews.as_view(), name='add_news_route'),

    path('register/', register, name='register_route'),
    path('login/', user_login, name='login_route'),
    path('logout/', user_logout, name='logout_route'),

    path('get_auth_token/', auth_token_view, name='token_route'),
]

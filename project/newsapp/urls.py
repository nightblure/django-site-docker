from django.urls import path

from .views import NewsList, NewsByCategory, OneNews, \
    CreateNews, SignupView, UserLoginView, user_logout, \
    AuthTokenView, JWTTokenView, DeleteNews, \
    EditNewsView, like_view, EditUserProfileView, ChangeUserPasswordView, \
    comment_view, remove_comment_view, CreateCategoryView

urlpatterns = [
    # path('', index, name='home_route'),
    path('', NewsList.as_view(), name='home_route'),

    # path('news_by_category/<int:category_id>/', get_news_by_category, name='news_by_category_route'),
    # path('news_by_category/<int:category_id>/', NewsByCategory.as_view(), name='news_by_category_route'),
    path('news-by-category/<slug:category_slug>/', NewsByCategory.as_view(), name='news_by_category_route'),

    # path('news/<int:news_id>/', get_one_news, name='one_news_route'),
    path('news/<int:news_id>/', OneNews.as_view(), name='one_news_route'),

    # path(create-news/', add_news, name='create_news_route'),
    path('create-news/', CreateNews.as_view(), name='create_news_route'),

    path('register/', SignupView.as_view(), name='signup_route'),
    path('login/', UserLoginView.as_view(), name='login_route'),
    path('logout/', user_logout, name='logout_route'),

    path('auth-token/', AuthTokenView.as_view(), name='token_route'),
    path('jwt-auth-token/', JWTTokenView.as_view(), name='jwt_token_route'),

    path('delete-news/<int:pk>/', DeleteNews.as_view(), name='delete_news_route'),
    path('edit-news/<int:pk>/', EditNewsView.as_view(), name='edit_news_route'),

    path('like/<int:news_id>/', like_view, name='like_route'),

    path('edit-user-profile/<str:user_name>/', EditUserProfileView.as_view(), name='edit_profile_route'),
    path('change-user-password/<str:user_name>/', ChangeUserPasswordView.as_view(), name='change_password_route'),

    path('add-comment/<int:news_id>/<str:username>', comment_view, name='add_comment'),
    path('remove-comment/<int:news_id>/<int:comment_id>/', remove_comment_view, name='remove_comment'),

    path('create-category/', CreateCategoryView.as_view(), name='create_category_route'),
]

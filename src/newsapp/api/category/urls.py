from django.urls import path

from newsapp.api.category.api import CategoriesGetApi, CategoryCreateApi

urlpatterns = [
    path('', CategoriesGetApi.as_view(), name='get_categories_route'),
    path('create', CategoryCreateApi.as_view(), name='create_category_route'),
]
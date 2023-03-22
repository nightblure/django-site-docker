from django.urls import path

from newsapp.api.category.api import CategoriesGetApi, CategoryCreateApi

urlpatterns = [
    path('', CategoriesGetApi.as_view()),
    path('create/', CategoryCreateApi.as_view()),
]
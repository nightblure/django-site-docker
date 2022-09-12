from django.urls import path

from API.views import NewsAPIView

urlpatterns = [
    path('api/v1/newslist/', NewsAPIView.as_view()),
]
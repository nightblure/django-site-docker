from rest_framework import generics

from newsapp.models import News
from API.serializers import NewsSerializer


class NewsAPIView(generics.ListAPIView):
    queryset = News.objects.all()
    serializer_class = NewsSerializer
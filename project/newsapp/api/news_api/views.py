from rest_framework.generics import ListAPIView

from newsapp.api.pagination import StandardPagination
from newsapp.api.news_api.serializers import NewsListSerializer
from newsapp.models import News


class NewsListView(ListAPIView):
    queryset = News.objects.all()
    serializer_class = NewsListSerializer
    pagination_class = StandardPagination


class UserNewsView(ListAPIView):
    serializer_class = NewsListSerializer
    pagination_class = StandardPagination

    def get_queryset(self):
        queryset = News.objects.filter(author=self.request.user)
        return queryset

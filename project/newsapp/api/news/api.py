from django.db.models import Q
from django.utils.text import slugify
from rest_framework import generics
from rest_framework.generics import ListAPIView, get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView

from newsapp.api.news.serializers import InputSerializer, OutputSerializer
from newsapp.api.news.permissions import IsNewsAuthorOrAdminAndAuthenticated
from newsapp.api.pagination import StandardPagination
from newsapp.api.utils import get_paginated_response
from newsapp.models import News

"""
by default we have IsAuthenticated permission for all requests!
(check project.conf.api.py)
"""


class NewsGetApi(APIView):
    def get(self, request):
        queryset = News.objects.filter(is_published=True)
        return get_paginated_response(
            pagination_class=StandardPagination,
            serializer_class=OutputSerializer,
            queryset=queryset,
            request=request,
            view=self
        )


# similar api like NewsGetApi, but in DRF style
class UserNewsGetApi(ListAPIView):
    serializer_class = OutputSerializer
    pagination_class = StandardPagination

    def get_queryset(self):
        queryset = News.objects.filter(
            Q(author=self.request.user) & Q(is_published=True)
        )
        return queryset


class OneNewsGetApi(APIView):
    def get(self, request, slug_title: str):
        news_obj = get_object_or_404(News, slug=slug_title, is_published=True)
        serializer = OutputSerializer(news_obj)
        return Response(serializer.data)


"""
example:
    https://slugify.online/
    PATCH
    http://127.0.0.1:8000/api/v1/news/klevgrand-updates-grand-finale-audio-finalizer-to-v20/update/
    {
        "title": "klevgrand-updates-grand-finale-audio-finalizer-to-v20",
        "content": "test",
        "category": "synths"
    }   
"""
class NewsUpdateApi(APIView):
    permission_classes = [IsNewsAuthorOrAdminAndAuthenticated]

    def patch(self, request, slug_title: str):
        news_obj = get_object_or_404(News, slug=slug_title, is_published=True)
        # trigger permission check manually because its not generic view
        self.check_object_permissions(request, news_obj)
        serializer = InputSerializer(data=request.data, instance=news_obj)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        output_data = OutputSerializer(news_obj)
        return Response(output_data.data)


class NewsDeleteApi(APIView):
    permission_classes = [IsNewsAuthorOrAdminAndAuthenticated]

    def delete(self, request, slug_title: str):
        news_obj = get_object_or_404(News, slug=slug_title, is_published=True)
        # trigger permission check manually because its not generic view
        self.check_object_permissions(request, news_obj)
        news_obj.delete()
        return Response({'message': 'success'})


class NewsCreateApi(APIView):
    def post(self, request):
        data = request.data
        serializer = InputSerializer(data=data)
        serializer.is_valid(raise_exception=True)

        if News.objects.filter(slug=slugify(data['title'])).exists():
            return Response({'message': f"News with title '{data['title']}' already posted"})

        news_obj, _ = serializer.save(author=request.user)
        output_data = OutputSerializer(news_obj)
        return Response(output_data.data)

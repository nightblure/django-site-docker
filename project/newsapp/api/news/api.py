from datetime import datetime

from django.db.models import Q
from rest_framework import serializers, status
from rest_framework.generics import ListAPIView, get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView

from newsapp.api.pagination import StandardPagination
from newsapp.api.utils import get_paginated_response
from newsapp.models import News, Category

"""
by default we have IsAuthenticated permission for all requests!
(check project.conf.api.py)
"""


# https://github.com/HackSoftware/Django-Styleguide#apis--serializers
class OutputSerializer(serializers.Serializer):
    title = serializers.CharField()
    content = serializers.CharField()
    category = serializers.CharField()
    author = serializers.CharField()
    created_at = serializers.DateTimeField()
    last_updated = serializers.DateTimeField(source='updated_at')
    image_url = serializers.ImageField(source='image', use_url=True)
    views_count = serializers.IntegerField()


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
    class InputSerializer(serializers.Serializer):
        title = serializers.CharField()
        content = serializers.CharField()
        category = serializers.SlugRelatedField(slug_field='slug', queryset=Category.objects)

        def update(self, instance, validated_data):
            instance.title = validated_data['title']
            instance.content = validated_data['content']
            instance.category = validated_data['category']
            instance.updated_at = datetime.now()
            instance.save()
            return instance

    def patch(self, request, slug_title: str):
        news_obj = get_object_or_404(News, slug=slug_title, is_published=True)
        serializer = self.InputSerializer(data=request.data, instance=news_obj)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        output_data = OutputSerializer(news_obj)
        return Response(output_data.data)

#
# class NewsAPIDelete(generics.RetrieveDestroyAPIView):
#     queryset = News.objects.filter(is_published=True)
#     serializer_class = NewsSerializer
#     permission_classes = (IsAdmin,)

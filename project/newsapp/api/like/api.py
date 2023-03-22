from rest_framework import serializers
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView

from newsapp.models import News, Like


class InputSerializer(serializers.Serializer):
    news = serializers.SlugRelatedField(slug_field='slug', queryset=News.objects)


class LikeNewsApi(APIView):
    def post(self, request, news_slug_title: str):
        news_obj = get_object_or_404(News, slug=news_slug_title)
        like_obj = Like.objects.filter(user=request.user, news=news_obj)
        is_liked: bool = like_obj.exists()

        if is_liked:
            return Response({'message': 'already liked'})

        Like.objects.create(user=request.user, news=news_obj)
        return Response({'message': 'success like'})


class UnlikeNewsApi(APIView):
    def post(self, request, news_slug_title: str):
        news_obj = get_object_or_404(News, slug=news_slug_title)
        like_obj = get_object_or_404(Like, user=request.user, news=news_obj)
        like_obj.delete()
        return Response({'message': 'success unlike'})

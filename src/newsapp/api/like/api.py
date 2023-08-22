from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView

from likesapp.models import Like
from newsapp.api.like.serializers import LikeResponse, LikeSerializer
from newsapp.models import News


class LikeNewsApi(APIView):
    def post(self, request, news_slug_title: str):
        news_obj = get_object_or_404(News, slug=news_slug_title)
        like_obj = Like.objects.filter(user=request.user, news=news_obj)
        is_liked: bool = like_obj.exists()

        if is_liked:
            return Response({"message": "already liked"})

        Like.objects.create(user=request.user, news=news_obj)
        r = LikeResponse({"message": "success like"})
        return Response(r.data)


class UnlikeNewsApi(APIView):
    def post(self, request, news_slug_title: str):
        news_obj = get_object_or_404(News, slug=news_slug_title)
        like_obj = get_object_or_404(Like, user=request.user, news=news_obj)
        like_obj.delete()
        r = LikeResponse({"message": "success unlike"})
        return Response(r.data)


class LikesApi(APIView):
    def get(self, request):
        likes = Like.objects.all()
        r = LikeSerializer(likes, many=True)
        return Response(r.data)

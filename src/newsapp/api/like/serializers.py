from rest_framework import serializers

from newsapp.models import News
from likesapp.models import Like


class InputSerializer(serializers.Serializer):
    news = serializers.SlugRelatedField(slug_field='slug', queryset=News.objects)


class LikeResponse(serializers.Serializer):
    message = serializers.CharField()


class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Like
        fields = '__all__'
        depth = 1

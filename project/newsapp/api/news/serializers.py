from datetime import datetime

from rest_framework import serializers

from newsapp.models import Category, News


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

    def create(self, validated_data):
        return News.objects.get_or_create(**validated_data)

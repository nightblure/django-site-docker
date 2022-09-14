from datetime import datetime

from rest_framework import serializers
from rest_framework.renderers import JSONRenderer

from newsapp.models import News, Category

# сериализатор для модели News, описанный вручную
# (реализация внутренней логики сериализатора, унаследованного от ModelSerializer)
# class NewsSerializer(serializers.Serializer):
#
#     id = serializers.IntegerField()
#     title = serializers.CharField()
#     content = serializers.CharField()
#     category_id = serializers.IntegerField()
#
#     def create(self, validated_data):
#         return News.objects.create(**validated_data)
#
#     def update(self, instance, validated_data):
#         instance.title = validated_data.get('title')
#         instance.content = validated_data.get('content')
#         instance.category_id = validated_data.get('category_id')
#         instance.save()
#         return instance


class NewsSerializer(serializers.ModelSerializer):

    # скрытое автогенерируемое поле
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = News
        # fields = '__all__' # ('title', 'content', 'category_id') # '__all__'
        exclude = ('is_published', )

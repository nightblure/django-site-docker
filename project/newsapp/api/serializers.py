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
    # user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    """
    SerializerMethodField определяет поле только для чтения,
    значение которого определяется с помощью указанного метода 
    """
    # image_path = serializers.SerializerMethodField(method_name='get_photo_url')

    author = serializers.CharField(source='user.username')
    category = serializers.CharField(read_only=True, source='category.title')
    # переименованные поля created_at и updated_at
    create_date = serializers.DateTimeField(format='%d-%m-%Y %H:%M:%S', source='created_at')
    last_update = serializers.DateTimeField(format='%d-%m-%Y %H:%M:%S', source='updated_at')

    def get_photo_url(self, obj):
        # request = self.context.get('request')
        return obj.image.url if obj.image else ''

    class Meta:
        model = News
        # fields = '__all__' # ('title', 'content', 'category_id') # '__all__'
        exclude = ('id', 'is_published', 'user', 'created_at', 'updated_at')


class CategorySerializer(serializers.ModelSerializer):
    news = NewsSerializer(read_only=True, many=True)

    class Meta:
        model = Category
        fields = ['title', 'news']
        # exclude = ('id', 'slug')

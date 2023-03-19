from rest_framework import serializers

from newsapp.models import News


class NewsListSerializer(serializers.ModelSerializer):
    category = serializers.CharField(source='category.title')
    last_updated = serializers.DateTimeField(source='updated_at')
    image_url = serializers.CharField(source='image')

    class Meta:
        model = News
        exclude = ('id', 'is_published')

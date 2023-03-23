from django.utils.text import slugify
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.views import APIView

from newsapp.api.news.permissions import IsAdmin
from newsapp.models import News, Category


class OutputSerializer(serializers.Serializer):
    title = serializers.CharField(required=True)


class InputSerializer(OutputSerializer):
    def create(self, validated_data):
        return Category.objects.get_or_create(**validated_data)


class CategoriesGetApi(APIView):
    def get(self, request):
        queryset = Category.objects.all()
        serializer = OutputSerializer(queryset, many=True)
        return Response(serializer.data)


class CategoryCreateApi(APIView):
    permission_classes = [IsAdmin]

    def post(self, request):
        self.check_permissions(request)
        data = request.data
        serializer = InputSerializer(data=data)
        serializer.is_valid(raise_exception=True)

        if Category.objects.filter(title=data['title']).exists():
            return Response(
                status=400, data={'message': f"Category with title '{data['title']}' already exists"}
            )

        category_obj, _ = serializer.save()
        output_data = OutputSerializer(category_obj)
        return Response(status=201, data=output_data.data)

from django.forms import model_to_dict
from rest_framework import generics, viewsets, mixins
from rest_framework.authentication import TokenAuthentication
from rest_framework.decorators import action
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework.permissions import IsAuthenticatedOrReadOnly

from newsapp.api.pagination import StandardPagination
from newsapp.api.permissions import IsAdmin, IsOwnerOrAdminOrAuthenticated
from newsapp.models import News, Category
from newsapp.api.serializers import NewsSerializer, CategorySerializer

"""
http://127.0.0.1:8000/api/v1/newslist/

APIView - базовый класс для всех представлений DRF
ниже представлена типа ручная реализация того, как под капотом работает класс ListAPIView
post-запрос для проверки:
{
    "title": "Новость api test",
    "content": "test",
    "category": 5
}
"""
class NewsAPIView(APIView):
    def get(self, request):
        objects = News.objects.all().values()
        return Response({'news': NewsSerializer(objects, many=True).data})

    def post(self, request):

        serializer = NewsSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'new_item': serializer.data})

    def put(self, request, *args, **kwargs):

        pk = kwargs.get('pk')
        if not pk:
            return Response({'error': 'PUT not allowed'})

        try:
            instance = News.objects.get(pk=pk)
        except Exception:
            return Response({'error': f'instance with pk={pk} not exists'})

        serializer = NewsSerializer(data=request.data, instance=instance)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'post': serializer.data})

    def delete(self, request, *args, **kwargs):
        pk = kwargs.get('pk')
        News.objects.filter(pk=pk).delete()
        return Response({'delete': f'object with id {pk} has been deleted'})


# ЧТЕНИЕ - ListAPIView
# ЧТЕНИЕ И СОЗДАНИЕ - ListCreateAPIView
# ВСЕ CRUD-ОПЕРАЦИИ для ОДНОЙ записи - RetrieveUpdateDestroyAPIView
#


class CategoryAPIList(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


"""
замена классов NewsAPI...
все перечисленные наследники есть в классе viewsets.ModelViewSet
меняя набор миксинов можно легко менять поведение API с точки зрения поддержки CRUD-операций
"""


class NewsViewSet(mixins.CreateModelMixin,
                  # read-операции
                  mixins.RetrieveModelMixin,
                  mixins.UpdateModelMixin,
                  mixins.DestroyModelMixin,
                  # реализует get-метод для множества записей
                  mixins.ListModelMixin,
                  GenericViewSet):  # ReadOnlyModelViewSet
    # queryset = News.objects.filter(is_published=True)
    serializer_class = NewsSerializer

    # КАК ПРАВИЛЬНО РЕАЛИЗОВАТЬ ОГРАНИЧЕНИЯ ДОСТУПА ДЛЯ ВЬЮСЕТА??)
    # permission_classes = (IsOwnerOrReadOnly, )

    def get_queryset(self):
        return News.objects.filter(is_published=True)

    """ 
    определение метода с декоратором action добавляет
    к маршрутам роутера новый маршрут с именем метода
    detail=False означает, что возвращаться должен список
    маршрут: http://127.0.0.1:8000/api/v1/news/categories/
    """

    @action(methods=['get'], detail=False)
    def categories(self, request):
        categories = Category.objects.all()
        return Response({'categories': [c.title for c in categories]})

    """
    получение определенной категории (благодаря параметру detail=True)
    по маршруту вида http://127.0.0.1:8000/api/v1/news/<key>/category/, где key - pk категории
    """

    @action(methods=['get'], detail=True)
    def category(self, request, pk):
        category = Category.objects.get(pk=pk)
        return Response({'category': category.title})

import pytest
from django.forms import model_to_dict
from django.urls import reverse
from mixer.backend.django import mixer
from rest_framework.exceptions import ValidationError
from rest_framework.test import force_authenticate

import newsapp.api.category.api as category_api
from newsapp.models import Category, User

pytestmark = [pytest.mark.django_db]


@pytest.mark.parametrize(
    ('client', 'expected_code'),
    [
        # get fixtures as parameters!
        ('unauthenticated_client', 401),
        ('no_admin_client', 200)
    ]
)
def test_access(client, expected_code, request):
    client = request.getfixturevalue(client)
    response = client.get(reverse("get_categories_route"))
    assert response.status_code == expected_code


def test_get_categories(request_factory, no_admin_user):
    view = category_api.CategoriesGetApi.as_view()
    request = request_factory.get(reverse('get_categories_route'))
    force_authenticate(request, no_admin_user)
    response = view(request)
    assert response.status_code == 200
    data = response.data
    assert len(data) > 0


def test_category_input_serializer_correct_data():
    data = [
        model_to_dict(obj)
        for obj in mixer.cycle(15).blend(Category)
    ]
    serializer = category_api.InputSerializer(
        data=data, many=True
    )
    serializer.is_valid(raise_exception=True)
    assert len(serializer.validated_data) == 15


def test_category_input_serializer_incorrect_data():
    categories = [
        {'titlee': 'cat1', 'content': 'random content'},
        {'titlee': 'cat2', 'content': 'random content'}
    ]
    serializer = category_api.InputSerializer(data=categories, many=True)
    with pytest.raises(ValidationError):
        serializer.is_valid(raise_exception=True)


def test_category_input_serializer_create():
    data = [
        model_to_dict(obj)
        for obj in mixer.cycle(5).blend(Category)
    ]
    serializer = category_api.InputSerializer(data=data, many=True)
    serializer.is_valid(raise_exception=True)
    created_data = serializer.create(serializer.validated_data)
    assert len(created_data) == 5


def test_category_create_api_forbidden(request_factory, no_admin_user):
    view = category_api.CategoryCreateApi.as_view()
    request = request_factory.post(reverse('create_category_route'))
    force_authenticate(request, no_admin_user)
    response = view(request)
    assert response.status_code == 403


def test_category_create_api_success(request_factory):
    view = category_api.CategoryCreateApi.as_view()

    request = request_factory.post(
        reverse('create_category_route'),
        {'title': 'random category'}
    )
    force_authenticate(request, User.objects.get(username='admin'))
    response = view(request)
    assert response.status_code == 201
    assert len(response.data) == 1
    assert response.data['title'] == 'random category'


def test_category_create_api_exists(request_factory, exists_category):
    view = category_api.CategoryCreateApi.as_view()
    request = request_factory.post(
        reverse('create_category_route'),
        model_to_dict(exists_category)
    )
    force_authenticate(request, User.objects.get(username='admin'))
    response = view(request)
    assert response.status_code == 400

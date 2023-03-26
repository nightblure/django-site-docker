import pytest
from django.forms import model_to_dict
from django.urls import reverse
from mixer.backend.django import mixer
from rest_framework.exceptions import ValidationError
from rest_framework.test import force_authenticate

from newsapp.api.category.api import (
    CategoriesGetApi, InputSerializer,
    CategoryCreateApi
)
from newsapp.models import Category
from newsapp.tests.utils import send_authenticated_request, get_url

pytestmark = [pytest.mark.django_db]


@pytest.mark.parametrize(
    ('client', 'expected_code'),
    [
        # get fixtures as parameters!
        ('api_client', 401),
        ('no_admin_auth_api_client', 200)
    ]
)
def test_access(client, expected_code, request):
    client_ = request.getfixturevalue(client)
    response = client_.get(reverse("get_categories_route"))
    assert response.status_code == expected_code


def test_get_categories(no_admin_user):
    response = send_authenticated_request(
        get_url('get_categories_route'), no_admin_user, CategoriesGetApi
    )

    assert response.status_code == 200
    assert len(response.data) >= 0


def test_category_input_serializer_correct_data():
    data = [
        model_to_dict(obj)
        for obj in mixer.cycle(15).blend(Category)
    ]
    serializer = InputSerializer( data=data, many=True)
    serializer.is_valid(raise_exception=True)

    assert len(serializer.validated_data) == 15


def test_category_input_serializer_incorrect_data():
    categories = [
        {'titlee': 'cat1', 'content': 'random content'},
        {'titlee': 'cat2', 'content': 'random content'}
    ]
    serializer = InputSerializer(data=categories, many=True)

    with pytest.raises(ValidationError):
        serializer.is_valid(raise_exception=True)


def test_category_input_serializer_create():
    data = [
        model_to_dict(obj)
        for obj in mixer.cycle(5).blend(Category)
    ]
    serializer = InputSerializer(data=data, many=True)
    serializer.is_valid(raise_exception=True)
    created_data = serializer.create(serializer.validated_data)
    assert len(created_data) == 5


def test_category_create_api_forbidden(no_admin_user):
    response = send_authenticated_request(
        get_url('create_category_route'), no_admin_user, CategoryCreateApi, (), 'post'
    )

    assert response.status_code == 403


def test_category_create_success(admin_user):
    body = {'title': 'random category'}

    response = send_authenticated_request(
        get_url('create_category_route'), admin_user,
        CategoryCreateApi, (), 'post', body
    )

    assert response.status_code == 201
    assert len(response.data) == 1
    assert response.data['title'] == 'random category'


def test_category_create_api_exists(exists_category, admin_user):
    body = model_to_dict(exists_category)

    response = send_authenticated_request(
        get_url('create_category_route'), admin_user,
        CategoryCreateApi, (), 'post', body
    )

    assert response.status_code == 400

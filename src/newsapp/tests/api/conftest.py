import pytest
from django.conf import settings
from django.forms import model_to_dict
from rest_framework.test import APIRequestFactory, APIClient, force_authenticate
from django.urls import reverse

from newsapp.models import User, Category

"""
https://www.django-rest-framework.org/api-guide/testing/
https://docs.pytest.org/en/latest/index.html

https://github.com/ptrstn/django-testing-examples
https://github.com/HackSoftware/Django-Styleguide
https://github.com/tough-dev-school/education-backend
https://github.com/nsidnev/fastapi-realworld-example-app
https://github.com/mongodb-developer/pymongo-fastapi-crud/blob/main/test_books_crud.py
https://github.com/tfranzel/drf-spectacular/tree/master/tests
https://github.com/luchanos/luchanos_oxford_university
https://habr.com/ru/post/448792/
https://github.com/alvassin/backendschool2019/tree/master/tests

"""

"""
get access to current db
we can override settings, for example:

settings.DATABASES['default'] = {
    'ENGINE': 'django.db.backends.mysql',
    'HOST': 'db.example.com',
    'NAME': 'external_db',
}
"""

pytestmark = [pytest.mark.django_db]


@pytest.fixture(scope='session')
def django_db_setup():
    settings.DATABASES['default'] = settings.DATABASES['default']


@pytest.fixture(scope='session')
def unauthenticated_client():
    client = APIClient()
    yield client


@pytest.fixture(scope='session')
def user_admin():
    yield User.objects.get(username='admin')


@pytest.fixture(scope='session')
def no_admin_user():
    yield User.objects.get(username='nightxx')


@pytest.fixture(scope='session')
def no_admin_client(no_admin_user):
    client = APIClient()
    client.force_authenticate(user=no_admin_user)
    yield client


@pytest.fixture(scope='session')
def admin_user_client(user_admin):
    client = APIClient()
    client.force_authenticate(user=user_admin)
    yield client


@pytest.fixture(scope='session')
def request_factory():
    yield APIRequestFactory()


@pytest.fixture(scope='session')
def categories_list():
    yield Category.objects.values()


@pytest.fixture
def exists_category():
    cat = Category.objects.create(title='Test category')
    yield cat
    cat.delete()

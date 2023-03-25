import pytest
from django.conf import settings
from django.forms import model_to_dict
from mixer.backend.django import mixer
from rest_framework.test import APIRequestFactory, APIClient, force_authenticate
from django.urls import reverse

from newsapp.models import User, Category, News

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


@pytest.fixture
def unauthenticated_client():
    client = APIClient()
    yield client


@pytest.fixture
def admin_user(db):
    user = User.objects.create(username='test_admin', is_staff=True)
    yield user
    user.delete()


@pytest.fixture
def no_admin_user(db):
    user = User.objects.create(username='test_user')
    yield user
    user.delete()


@pytest.fixture
def no_admin_client(no_admin_user):
    client = APIClient()
    client.force_authenticate(user=no_admin_user)
    yield client


@pytest.fixture(scope='session')
def admin_user_client(admin_user):
    client = APIClient()
    client.force_authenticate(user=admin_user)
    yield client


@pytest.fixture(scope='session')
def request_factory():
    yield APIRequestFactory()


@pytest.fixture(scope='session')
def categories_list(db):
    yield mixer.cycle(15).blend(Category)


@pytest.fixture
def exists_category(db):
    yield mixer.blend(Category, title='Test category')


@pytest.fixture
def random_news(db):
    yield mixer.blend(News, slug=mixer.RANDOM)

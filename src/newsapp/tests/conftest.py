import pytest
from django.conf import settings
from django.db.models.signals import post_save, pre_save
from django.test import RequestFactory
from mixer.backend.django import mixer
from rest_framework.test import APIRequestFactory, APIClient

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
def admin_user(db):
    user = User.objects.create(username='test_admin', is_staff=True)
    yield user

    # fix from protect mode for user in news model :c
    for news in News.objects.all():
        if news.author == user:
            news.delete()

    user.delete()


@pytest.fixture
def no_admin_user(db):
    user = User.objects.create(username='test_user')
    yield user

    # fix from protect mode for user in news model :c
    for news in News.objects.all():
        if news.author == user:
            news.delete()

    user.delete()


@pytest.fixture
def random_no_admin_user(db):
    user = mixer.blend(User, is_staff=False)
    yield user

    # fix from protect mode for user in news model :c
    for news in News.objects.all():
        if news.author == user:
            news.delete()

    user.delete()


@pytest.fixture
def api_client():
    client = APIClient()
    yield client


@pytest.fixture
def no_admin_auth_api_client(no_admin_user):
    client = APIClient()
    client.force_authenticate(user=no_admin_user)
    yield client


# @pytest.fixture(scope='session')
# def admin_user_client(admin_user):
#     client = APIClient()
#     client.force_authenticate(user=admin_user)
#     yield client


@pytest.fixture(scope='session')
def request_factory():
    yield APIRequestFactory()


@pytest.fixture()
def categories_list(db):
    yield mixer.cycle(15).blend(Category)


@pytest.fixture
def exists_category(db):
    yield mixer.blend(Category, title='Test category')


@pytest.fixture
def random_news(db):
    yield mixer.blend(News, slug=mixer.RANDOM)


@pytest.fixture
def off_signals():
    post_save.receivers = []
    pre_save.receivers = []


@pytest.fixture
def django_request_factory():
    yield RequestFactory()

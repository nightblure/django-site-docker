import pytest
from django.conf import settings
from rest_framework.test import APIRequestFactory, APIClient

from newsapp.models import User

"""
run tests (run from project folder): pytest -rs

coverage report (run from project folder): 
    * coverage html
    * coverage report -m (report in cli)
    * pytest --cov=.


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
@pytest.fixture(scope='session')
def django_db_setup():
    settings.DATABASES['default'] = settings.DATABASES['default']


@pytest.fixture(scope='session')
def unauthenticated_client():
    client = APIClient()
    yield client


@pytest.fixture(scope='session')
@pytest.mark.django_db
def get_admin_user():
    yield User.objects.get(username='admin')


@pytest.fixture(scope='session')
@pytest.mark.django_db
def get_not_admin_user():
    yield User.objects.get(username='nightxx')


@pytest.fixture(scope='session')
def no_admin_client(get_not_admin_user):
    client = APIClient()
    client.force_authenticate(user=get_not_admin_user)
    yield client


@pytest.fixture(scope='session')
def admin_client(get_admin_user):
    client = APIClient()
    client.force_authenticate(user=get_admin_user)
    yield client

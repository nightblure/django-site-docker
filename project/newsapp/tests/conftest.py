import pytest

"""
ЗАПУСК ТЕСТОВ (из папки с конфигом pytest.ini): pytest -rs
pytest -s: печать в консоль информации из print

печать отчета coverage: coverage html ИЛИ coverage report -m
запуск тестов с coverage: coverage run -m pytest <args>

https://github.com/ptrstn/django-testing-examples

"""

# https://www.django-rest-framework.org/api-guide/testing/
# https://github.com/ptrstn/django-testing-examples/tree/master/myapp

# @pytest.fixture(autouse=True)
# def test_new_user(django_user_model):
#     test_user = django_user_model.objects.create(username="test_user", password="pass")
#     yield test_user


import pytest

"""
ЗАПУСК ТЕСТОВ (из папки с конфигом pytest.ini): pytest -rs
pytest -s: печать в консоль информации из print

печать отчета coverage: coverage html ИЛИ coverage report -m
запуск тестов с coverage: coverage run -m pytest <args>

https://github.com/ptrstn/django-testing-examples

"""

@pytest.fixture(autouse=True)
def create_test_user(django_user_model):
    test_user = django_user_model.objects.create(username='test_user', password='pass')
    yield test_user
    test_user.delete()


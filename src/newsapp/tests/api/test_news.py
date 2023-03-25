import pytest
from django.forms import model_to_dict
from django.urls import reverse
from mixer.backend.django import mixer
from rest_framework.test import force_authenticate

from newsapp.api.news.serializers import InputSerializer, OutputSerializer
from newsapp.api.pagination import StandardPagination
from newsapp.api.news.api import (
    NewsGetApi, UserNewsGetApi,
    OneNewsGetApi, NewsUpdateApi,
    NewsDeleteApi, NewsCreateApi,
    NewsGetByCategoryApi
)
from newsapp.models import News, Category

pytestmark = [pytest.mark.django_db]


def test_news_get_api_success(request_factory, no_admin_user, off_signals):
    _ = mixer.cycle(StandardPagination.max_page_size).blend(News, is_published=True)
    view = NewsGetApi.as_view()
    request = request_factory.get(f'{reverse("news_api_route")}?page_size=20')
    force_authenticate(request, no_admin_user)
    response = view(request)
    assert response.status_code == 200
    assert response.data['previous'] is None
    assert len(response.data['results']) == StandardPagination.max_page_size


def test_user_news_get_no_auth(request_factory):
    view = UserNewsGetApi.as_view()
    request = request_factory.get(reverse('user_news_api_route'))
    assert view(request).status_code == 401


def test_user_news_get_success(request_factory, no_admin_user, off_signals):
    _ = mixer.cycle(20).blend(News, is_published=True, author=no_admin_user)
    view = UserNewsGetApi.as_view()
    request = request_factory.get(reverse('user_news_api_route'))
    force_authenticate(request, no_admin_user)
    response = view(request)
    assert response.status_code == 200
    assert len(response.data['results']) == StandardPagination.page_size


def test_news_create_api_forbidden(request_factory, no_admin_user):
    view = NewsCreateApi.as_view()
    news = mixer.blend(News, author=no_admin_user)
    serializer = InputSerializer(news)
    request = request_factory.post(reverse('news_create_api_route'), serializer.data)
    force_authenticate(request, no_admin_user)
    response = view(request)
    assert response.status_code == 403


def test_news_create_api_success(request_factory, admin_user):
    view = NewsCreateApi.as_view()
    news = mixer.blend(News, author=admin_user)
    serializer = InputSerializer(news)
    request = request_factory.post(reverse('news_create_api_route'), serializer.data)
    force_authenticate(request, admin_user)
    # delete news from test db for real create testing
    news.delete()
    response = view(request)
    assert response.status_code == 200
    assert response.data == OutputSerializer(news).data


def test_one_news_get_api_not_exists_news(request_factory, no_admin_user):
    view = OneNewsGetApi.as_view()
    news = mixer.blend(News, author=no_admin_user)

    request = request_factory.get(
        reverse(
            'one_news_api_route',
            kwargs={'slug_title': news.slug}
        )
    )

    force_authenticate(request, no_admin_user)
    news.delete()
    response = view(request, news.slug)
    assert response.status_code == 404


def test_one_news_get_api_success(request_factory, no_admin_user):
    view = OneNewsGetApi.as_view()
    news = mixer.blend(News, author=no_admin_user, is_published=True)

    request = request_factory.get(
        reverse(
            'one_news_api_route',
            kwargs={'slug_title': news.slug}
        )
    )

    force_authenticate(request, no_admin_user)
    response = view(request, news.slug)
    assert response.status_code == 200
    assert response.data == OutputSerializer(news).data


def test_news_by_category_api_not_exists_category(request_factory, no_admin_user):
    view = NewsGetByCategoryApi.as_view()
    category = mixer.blend(Category)
    request = request_factory.get(
        reverse('news_by_category_api_route', kwargs={'category_slug': category.slug})
    )

    force_authenticate(request, no_admin_user)
    response = view(request, mixer.RANDOM)
    assert response.status_code == 404


def test_news_by_category_api_success(request_factory, no_admin_user):
    view = NewsGetByCategoryApi.as_view()
    category = mixer.blend(Category)
    news = mixer.cycle(10).blend(News, category=category, is_published=True)
    request = request_factory.get(
        reverse('news_by_category_api_route', kwargs={'category_slug': category.slug})
    )

    force_authenticate(request, no_admin_user)
    response = view(request, category.slug)
    assert response.status_code == 200
    assert len(response.data) == len(news)


def test_delete_news_api_forbidden(request_factory, no_admin_user):
    view = NewsDeleteApi.as_view()
    news = mixer.blend(News, is_published=True)
    request = request_factory.delete(
        reverse('delete_news_api_route', kwargs={'slug_title': news.slug})
    )

    force_authenticate(request, no_admin_user)
    response = view(request, news.slug)
    assert response.status_code == 403


@pytest.mark.parametrize(
    ('is_published', 'expected_code'),
    [
        (False, 404),
        (True, 200)
    ]
)
def test_delete_news_api(is_published, expected_code, request_factory, admin_user):
    view = NewsDeleteApi.as_view()
    news = mixer.blend(News, is_published=is_published)
    request = request_factory.delete(
        reverse('delete_news_api_route', kwargs={'slug_title': news.slug})
    )

    force_authenticate(request, admin_user)
    response = view(request, news.slug)
    assert response.status_code == expected_code


@pytest.mark.parametrize(
    ('author', 'author_or_other_user', 'expected_code'),
    [
        ('no_admin_user', 'random_no_admin_user', 403),
        ('no_admin_user', 'no_admin_user', 403)
    ]
)
def test_update_news_api_forbidden(author, author_or_other_user, expected_code, request, request_factory):
    author_ = request.getfixturevalue(author)
    author_or_other_user_ = request.getfixturevalue(author_or_other_user)

    view = NewsUpdateApi.as_view()
    news = mixer.blend(News, is_published=True, author=author_)
    request = request_factory.patch(
        reverse('update_news_api_route', kwargs={'slug_title': news.slug})
    )

    force_authenticate(request, author_or_other_user_)
    response = view(request, news.slug)
    assert response.status_code == expected_code


def test_update_news_api_success(request_factory, admin_user):
    view = NewsUpdateApi.as_view()
    news = mixer.blend(News, is_published=True, author=admin_user)
    category = mixer.blend(Category)
    random_news = mixer.blend(
        News,
        title=mixer.RANDOM,
        content=mixer.RANDOM,
        category=category,
        author=admin_user
    )

    serializer = InputSerializer(random_news)
    request = request_factory.patch(
        reverse('update_news_api_route', kwargs={'slug_title': news.slug}),
        serializer.data
    )
    random_news.delete()

    force_authenticate(request, admin_user)
    response = view(request, news.slug)
    assert response.status_code == 200
    assert response.data == OutputSerializer(random_news).data

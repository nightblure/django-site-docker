import pytest
from mixer.backend.django import mixer

from categoriesapp.models import Category
from newsapp.api.news.api import (
    NewsCreateApi,
    NewsDeleteApi,
    NewsGetApi,
    NewsGetByCategoryApi,
    NewsUpdateApi,
    OneNewsGetApi,
    UserNewsGetApi,
)
from newsapp.api.news.serializers import InputSerializer, OutputSerializer
from newsapp.api.pagination import StandardPagination
from newsapp.models import News
from newsapp.tests.utils import (
    get_url,
    send_authenticated_request,
    send_no_auth_request,
)

pytestmark = [pytest.mark.django_db]

"""
AAA-pattern: Arrange, Act, Assert
"""


def test_news_get_api_success(no_admin_user, off_signals):
    _ = mixer.cycle(StandardPagination.max_page_size).blend(News, is_published=True)
    url = f'{get_url("news_api_route")}?page_size=20'

    response = send_authenticated_request(url, no_admin_user, NewsGetApi)

    assert response.status_code == 200
    assert response.data["previous"] is None
    assert len(response.data["results"]) == StandardPagination.max_page_size


def test_user_news_no_auth():
    response = send_no_auth_request(get_url("user_news_api_route"), UserNewsGetApi)
    assert response.status_code == 401


def test_user_news_success(no_admin_user, off_signals):
    _ = mixer.cycle(20).blend(News, is_published=True, author=no_admin_user)

    response = send_authenticated_request(
        get_url("user_news_api_route"), no_admin_user, UserNewsGetApi
    )

    assert response.status_code == 200
    assert len(response.data["results"]) == StandardPagination.page_size


def test_news_create_api_forbidden(no_admin_user):
    news = mixer.blend(News, author=no_admin_user)
    serializer = InputSerializer(news)
    body = serializer.data

    response = send_authenticated_request(
        get_url("news_create_api_route"), no_admin_user, NewsCreateApi, (), "post", body
    )

    assert response.status_code == 403


def test_news_create_api_success(admin_user):
    news = mixer.blend(News, author=admin_user)
    serializer = InputSerializer(news)
    body = serializer.data
    # delete news from test db for real create testing
    news.delete()

    response = send_authenticated_request(
        get_url("news_create_api_route"), admin_user, NewsCreateApi, (), "post", body
    )

    assert response.status_code == 200
    assert response.data == OutputSerializer(news).data


def test_create_already_posted_news(admin_user):
    news = mixer.blend(News, author=admin_user)
    serializer = InputSerializer(news)
    body = serializer.data

    response = send_authenticated_request(
        get_url("news_create_api_route"), admin_user, NewsCreateApi, (), "post", body
    )

    assert response.status_code == 200
    assert response.data["message"] == "already posted"


def test_get_not_exists_news(no_admin_user):
    news = mixer.blend(News, author=no_admin_user)
    url = get_url("one_news_api_route", {"slug_title": news.slug})
    news.delete()

    response = send_authenticated_request(
        url, no_admin_user, OneNewsGetApi, (news.slug,)
    )

    assert response.status_code == 404


def test_one_news_success(no_admin_user):
    news = mixer.blend(News, author=no_admin_user, is_published=True)
    url = get_url("one_news_api_route", {"slug_title": news.slug})

    response = send_authenticated_request(
        url, no_admin_user, OneNewsGetApi, (news.slug,)
    )

    assert response.status_code == 200
    assert response.data == OutputSerializer(news).data


def test_news_by_category_not_exists_category(no_admin_user):
    category = mixer.blend(Category)
    url = get_url("news_by_category_api_route", {"category_slug": category.slug})

    response = send_authenticated_request(
        url, no_admin_user, NewsGetByCategoryApi, (mixer.RANDOM,)
    )

    assert response.status_code == 404


def test_news_by_category_success(no_admin_user):
    category = mixer.blend(Category)
    news = mixer.cycle(10).blend(News, category=category, is_published=True)
    url = get_url("news_by_category_api_route", {"category_slug": category.slug})

    response = send_authenticated_request(
        url, no_admin_user, NewsGetByCategoryApi, (category.slug,)
    )

    assert response.status_code == 200
    assert len(response.data) == len(news)


def test_delete_news_forbidden(no_admin_user):
    news = mixer.blend(News, is_published=True)
    url = get_url("delete_news_api_route", {"slug_title": news.slug})

    response = send_authenticated_request(
        url, no_admin_user, NewsDeleteApi, (news.slug,), "delete"
    )

    assert response.status_code == 403


@pytest.mark.parametrize(("is_published", "expected_code"), [(False, 404), (True, 200)])
def test_delete_news(is_published, expected_code, admin_user):
    news = mixer.blend(News, is_published=is_published)
    url = get_url("delete_news_api_route", {"slug_title": news.slug})

    response = send_authenticated_request(
        url, admin_user, NewsDeleteApi, (news.slug,), "delete"
    )

    assert response.status_code == expected_code


@pytest.mark.parametrize(
    ("author", "author_or_other_user", "expected_code"),
    [
        ("no_admin_user", "random_no_admin_user", 403),
        ("no_admin_user", "no_admin_user", 403),
    ],
)
def test_update_news_forbidden(author, author_or_other_user, expected_code, request):
    author_ = request.getfixturevalue(author)
    author_or_other_user_ = request.getfixturevalue(author_or_other_user)
    news = mixer.blend(News, is_published=True, author=author_)
    url = get_url("update_news_api_route", {"slug_title": news.slug})

    response = send_authenticated_request(
        url, author_or_other_user_, NewsUpdateApi, (news.slug,), "patch"
    )

    assert response.status_code == expected_code


def test_update_news_api_success(admin_user):
    news = mixer.blend(News, is_published=True, author=admin_user)
    category = mixer.blend(Category)
    random_news = mixer.blend(
        News,
        title=mixer.RANDOM,
        content=mixer.RANDOM,
        category=category,
        author=admin_user,
    )
    url = get_url("update_news_api_route", {"slug_title": news.slug})
    serializer = InputSerializer(random_news)
    random_news.delete()

    response = send_authenticated_request(
        url, admin_user, NewsUpdateApi, (news.slug,), "patch", serializer.data
    )

    assert response.status_code == 200
    assert response.data == OutputSerializer(random_news).data

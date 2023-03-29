import pytest
from mixer.backend.django import mixer
from django.contrib.auth.models import AnonymousUser

from newsapp.models import News
from newsapp.api.news.api import NewsDeleteApi
from newsapp.api.news.permissions import IsNewsAuthorOrAdminAndAuthenticated, IsAdmin
from newsapp.tests.utils import get_url


@pytest.mark.parametrize(
    ('author', 'user', 'expected_result'),
    [
        ('no_admin_user', 'admin_user', True),
        ('no_admin_user', 'no_admin_user', True),
        ('no_admin_user', 'random_no_admin_user', False),
        ('admin_user', 'no_admin_user', False)
    ]
)
def test_is_news_author_or_admin_and_authenticated(author, user, expected_result, request, django_request_factory):
    user_ = request.getfixturevalue(user)
    author_ = request.getfixturevalue(author)
    view = NewsDeleteApi.as_view()
    perm = IsNewsAuthorOrAdminAndAuthenticated()
    obj = mixer.blend(News, author=author_)
    url = get_url('delete_news_api_route', {'slug_title': obj.slug})

    request = django_request_factory.delete(url)
    request.user = user_

    assert perm.has_object_permission(request, view, obj) is expected_result


def test_is_news_author_or_admin_and_authenticated_no_auth(django_request_factory, no_admin_user):
    perm = IsNewsAuthorOrAdminAndAuthenticated()
    view = NewsDeleteApi.as_view()
    obj = mixer.blend(News, author=no_admin_user)
    url = get_url('delete_news_api_route', {'slug_title': obj.slug})

    request = django_request_factory.delete(url)
    request.user = AnonymousUser

    assert perm.has_object_permission(request, view, obj) is False


@pytest.mark.parametrize(
    ('user', 'expected_result'),
    [
        ('no_admin_user', False),
        ('admin_user', True)
    ]
)
def test_is_admin(user, expected_result, request, django_request_factory):
    user_ = request.getfixturevalue(user)
    view = NewsDeleteApi.as_view()
    perm = IsAdmin()
    obj = mixer.blend(News, author=user_)
    url = get_url('delete_news_api_route', {'slug_title': obj.slug})

    request = django_request_factory.delete(url)
    request.user = user_

    assert perm.has_permission(request, view) is expected_result

import pytest
from mixer.backend.django import mixer
from rest_framework.test import force_authenticate, APIClient

from newsapp.models import News
from newsapp.api.news.api import NewsDeleteApi
from newsapp.api.news.permissions import IsNewsAuthorOrAdminAndAuthenticated
from newsapp.tests.utils import get_url


@pytest.mark.xfail(reason='dont understand what request want has_object_permission')
def test_news_author_or_admin_and_authenticated(admin_user, api_client):
    view = NewsDeleteApi.as_view()
    perm = IsNewsAuthorOrAdminAndAuthenticated()
    obj = mixer.blend(News, author=admin_user)
    url = get_url('delete_news_api_route', {'slug_title': obj.slug})

    request = APIClient().delete(url)
    force_authenticate(request, admin_user)

    assert perm.has_object_permission(
        request, view, obj
    )

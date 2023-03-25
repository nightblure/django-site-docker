import pytest
from django.urls import reverse
from mixer.backend.django import mixer
from rest_framework.test import force_authenticate

from newsapp.api.news.api import NewsGetApi
from newsapp.models import News
from newsapp.api.news.serializers import OutputSerializer
from newsapp.api.pagination import StandardPagination
from newsapp.api.utils import get_paginated_response


@pytest.mark.xfail(reason='dont understand what request want get_paginated_response')
def test_paginated_response(request_factory, no_admin_user):
    view = NewsGetApi.as_view()
    news = mixer.cycle(20).blend(News)

    def get_response(url):
        request = request_factory.get(url)
        force_authenticate(request, no_admin_user)
        return get_paginated_response(
            pagination_class=StandardPagination,
            serializer_class=OutputSerializer,
            queryset=news,
            request=request,
            view=view
        )

    base_url = reverse('news_get_api_route')
    response = get_response(base_url)
    assert response.data['previous'] is None
    assert len(response.data) == StandardPagination.page_size
    last_page = 20 // StandardPagination.page_size

    for i in range(2, last_page + 1):
        response = get_response(f'{base_url}?page={i}')
        assert response.data['previous']
        assert len(response.data) == StandardPagination.page_size


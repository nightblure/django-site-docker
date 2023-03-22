import pytest
from django.test import RequestFactory
from django.urls import reverse
from rest_framework.test import APIClient
from newsapp.models import User

from newsapp.api.category.api import CategoriesGetApi
from newsapp.views.auth import views


@pytest.mark.django_db
class TestCategoriesGetApi:

    @pytest.mark.parametrize(
        'client, expected_code', [
            # get fixtures as parameters!
            ('unauthenticated_client', 401),
            ('no_admin_client', 200)
        ]
    )
    def test_access(self, client, expected_code, request):
        client = request.getfixturevalue(client)
        response = client.get(reverse("get_categories_route"))
        assert response.status_code == expected_code

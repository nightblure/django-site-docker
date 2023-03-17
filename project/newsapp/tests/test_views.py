import pytest
from django.test import RequestFactory
from django.urls import reverse

import newsapp.views.auth.views as views

# @pytest.mark.django_db
# def test_test_user(django_user_model, create_test_user):
#     user = create_test_user
#     assert user.username == 'test_user'


class TestSignupView:
    def test_anonymous(self):
        req = RequestFactory().get(reverse("signup_route"))
        resp = views.SignupView.as_view()(req)
        assert resp.status_code == 200


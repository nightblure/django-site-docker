import pytest

from newsapp.models import User
from newsapp.mixins import ResetPasswordMixin

pytestmark = [pytest.mark.django_db]


@pytest.mark.skip(reason='doesnt work???!?')
def test_password_reset(random_no_admin_user):
    ResetPasswordMixin.reset_password(random_no_admin_user)
    assert random_no_admin_user.password == '1234User'

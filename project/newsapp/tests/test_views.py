import pytest


# @pytest.mark.django_db
def test_user_(django_user_model, create_test_user):
    user = create_test_user
    assert user.username == 'test_user'



import pytest
from django.forms import model_to_dict
from mixer.backend.django import mixer

from newsapp.models import News
from newsapp.forms import NewsForm

pytestmark = [pytest.mark.django_db]


def test_news_form_clean_title_success():
    data = model_to_dict(mixer.blend(News, title='title'))
    form = NewsForm(data=data)
    form.full_clean()

    assert form.is_valid()
    assert form.clean_title() == 'title'


def test_news_form_clean_title_validation_error():
    form = NewsForm(data={'title': '3title'})
    assert not form.is_valid()

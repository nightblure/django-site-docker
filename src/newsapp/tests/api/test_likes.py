from django.urls import reverse
from mixer.backend.django import mixer
from rest_framework.test import force_authenticate

from newsapp.api.like.api import LikeNewsApi, UnlikeNewsApi
from newsapp.models import News, Like


def test_like_exists_news(request_factory, no_admin_user, off_signals):
    news = mixer.blend(News)
    view = LikeNewsApi.as_view()
    request = request_factory.post(
        reverse('like_api_route', kwargs={'news_slug_title': news.slug}),
    )
    force_authenticate(request, no_admin_user)
    response = view(request, news.slug)
    assert response.status_code == 200
    assert response.data['message'] == 'success like'


def test_like_not_exists_news(request_factory, no_admin_user):
    random_slug = mixer.RANDOM
    view = LikeNewsApi.as_view()
    request = request_factory.post(
        reverse('like_api_route', kwargs={'news_slug_title': random_slug}),
    )
    force_authenticate(request, no_admin_user)
    response = view(request, random_slug)
    assert response.status_code == 404


def test_like_already_liked_news(request_factory, random_news, no_admin_user):
    view = LikeNewsApi.as_view()

    def like_news():
        request = request_factory.post(
            reverse('like_api_route', kwargs={'news_slug_title': random_news.slug}),
        )
        force_authenticate(request, no_admin_user)
        return view(request, random_news.slug)

    response = like_news()
    assert response.status_code == 200
    assert response.data['message'] == 'success like'

    response = like_news()
    assert response.status_code == 200
    assert response.data['message'] == 'already liked'


""" unlike tests """


def test_unlike_not_exists_news(request_factory, no_admin_user):
    random_slug = mixer.RANDOM
    view = UnlikeNewsApi.as_view()
    request = request_factory.post(
        reverse('like_api_route', kwargs={'news_slug_title': random_slug}),
    )
    force_authenticate(request, no_admin_user)
    response = view(request, random_slug)
    assert response.status_code == 404


def test_unlike_exists_news(request_factory, random_news, no_admin_user):
    view = UnlikeNewsApi.as_view()
    _ = mixer.blend(Like, user=no_admin_user, news=random_news)
    request = request_factory.post(
        reverse('like_api_route', kwargs={'news_slug_title': random_news.slug}),
    )
    force_authenticate(request, no_admin_user)
    response = view(request, random_news.slug)
    assert response.status_code == 200
    assert response.data['message'] == 'success unlike'

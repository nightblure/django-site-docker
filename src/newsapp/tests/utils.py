from django.urls import reverse
from rest_framework.test import force_authenticate, APIRequestFactory


def get_url(url, kwargs=None):
    return reverse(url, kwargs=kwargs)


def send_no_auth_request(url, view, view_args: tuple = None, method='get', body=None):
    request_factory = APIRequestFactory()
    view = view.as_view()
    request = request_factory.get(url)

    if method == 'post':
        request = request_factory.post(url, body)

    response = view(request, *view_args) if view_args else view(request)
    return response


def send_authenticated_request(url, user, view, view_args: tuple = None, method='get', body=None):
    request_factory = APIRequestFactory()
    view = view.as_view()
    request = request_factory.get(url)

    if method == 'post':
        request = request_factory.post(url, body)

    if method == 'delete':
        request = request_factory.delete(url)

    if method == 'patch':
        request = request_factory.patch(url, body)

    force_authenticate(request, user)
    response = view(request, *view_args) if view_args else view(request)
    return response

from collections import defaultdict

import requests

from newsapp.models import Like


def get_user_liked_posts(user_id):
    likes_objects = Like.objects.all()
    return [obj.news.pk for obj in likes_objects.filter(user__pk=user_id)]


def get_news_likes_count_dict():
    news_likes = defaultdict(int)
    likes_objects = Like.objects.all()

    for obj in likes_objects:
        news_likes[obj.news.pk] += 1

    return news_likes


def get_auth_token_message(login, password, type='token'):

    data = {
        "username": f"{login}",
        "password": f"{password}"
    }

    if type == 'token':
        url = 'http://127.0.0.1:8000/auth/token/login'
    else:
        url = 'http://127.0.0.1:8000/api/v1/jwt_auth/'

    response = requests.post(url, data=data)
    response = response.json()
    # if type == 'jwt' and 'detail' in response:
    #     response = json.loads('{"non_field_errors": ["Невозможно войти с предоставленными учетными данными."]}')

    # return response['non_field_errors'][0] if 'non_field_errors' in response else f"token: {response['auth_token']}"
    return response

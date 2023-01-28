import json

from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import redirect

from newsapp.models import News, Like


@login_required(login_url='login_route')
def like_view(request, **kwargs):
    # data = dict(request.POST)
    # print(data)
    news_id = kwargs['news_id'] # data['news_id'] # kwargs['news_id']
    news_obj = News.objects.get(pk=news_id)
    is_liked: bool = Like.objects.filter(user=request.user, news__pk=news_id).exists()

    if is_liked:
        like_obj = Like.objects.get(user=request.user, news__pk=news_id)
        like_obj.delete()
    else:
        Like.objects.create(user=request.user, news=news_obj)

    # редирект на текущую страницу
    return redirect('home_route')
    # return JsonResponse({"name": 'test'}, status=200)
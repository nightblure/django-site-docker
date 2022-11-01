from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect

from newsapp.models import News, Like


@login_required(login_url='login_route')
def like_view(request, **kwargs):
    news_id = kwargs['news_id']
    news_obj = News.objects.get(pk=news_id)
    like_obj = Like.objects.filter(user=request.user, news__pk=news_id)

    if like_obj:
        like_obj.delete()
    else:
        Like.objects.create(user=request.user, news=news_obj)

    # редирект на текущую страницу
    return redirect('home_route')

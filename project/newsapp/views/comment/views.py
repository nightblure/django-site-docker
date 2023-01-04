from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect

from newsapp.models import News, User, Comment


@login_required
def comment_view(request, news_id, username):
    user_obj = User.objects.get(pk=request.user.pk)
    news_obj = News.objects.get(pk=news_id)

    comment_text = request.POST['comment_text']

    if str(comment_text).isspace():
        messages.error(request, 'Комментарий не может быть пустым')
    else:
        Comment.objects.create(
            user=user_obj,
            news=news_obj,
            text=comment_text
        )

    return redirect('one_news_route', news_id=news_id)


@login_required
def remove_comment_view(request, news_id, comment_id):
    Comment.objects.get(pk=comment_id).delete()
    return redirect('one_news_route', news_id=news_id)

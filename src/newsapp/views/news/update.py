from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import UpdateView

from newsapp.forms import NewsForm
from newsapp.models import News


class UpdateNewsView(LoginRequiredMixin, SuccessMessageMixin, UpdateView):
    model = News
    template_name = 'news/edit_news.html'
    form_class = NewsForm
    success_message = 'Новость успешно отредактирована'
    context_object_name = 'news_obj'

from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.views.generic import CreateView

from newsapp.forms import NewsForm


class CreateNews(SuccessMessageMixin, LoginRequiredMixin, CreateView):
    form_class = NewsForm
    template_name = 'news/create_news.html'
    success_message = 'Новость успешно опубликована'

    # записываем в атрибут юзер текущего пользователя при создании новости
    def form_valid(self, form):
        # записываем пользователя, создавшего новость
        form.instance.user = self.request.user
        return super().form_valid(form)

from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from django.views.generic import DeleteView

from newsapp.models import News


class DeleteNews(LoginRequiredMixin, SuccessMessageMixin, DeleteView):
    model = News
    success_url = reverse_lazy('home_route')
    success_message = 'Новость успешно удалена'

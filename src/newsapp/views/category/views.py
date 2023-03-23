from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.urls import reverse_lazy
from django.views.generic import CreateView

from newsapp.forms import CategoryForm


class CreateCategoryView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    form_class = CategoryForm
    template_name = 'categories/create_category.html'
    success_message = 'Категория успешно создана'
    success_url = reverse_lazy('home_route')
    raise_exception = True

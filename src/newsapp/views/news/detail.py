from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.db.models import F
from django.urls import reverse_lazy
from django.views.generic import CreateView, DetailView

from newsapp.forms import CategoryForm
from newsapp.models import News, Comment


class OneNews(DetailView):
    model = News
    slug_url_kwarg = 'news_slug'
    template_name = 'news/news_page.html'
    context_object_name = 'news_item'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        news_slug = self.kwargs['news_slug']
        comments = Comment.objects.filter(news__slug=news_slug).order_by('-created')
        context['comments'] = comments
        return context

    def get_queryset(self):
        news_slug = self.kwargs['news_slug']
        news_obj = News.objects.filter(slug=news_slug)

        """
        news_item = get_object_or_404(News, pk=news_id)
        # корректный вариант с точки зрения concurrency. += 1 было бы некорректно
        news_item.views_count = F('views_count') + 1
        news_item.save()
        """
        # выполняем запрос update для увеличения счетчика просмотров, если пользователь читает новость
        news_obj.update(views_count=F('views_count') + 1)
        return news_obj

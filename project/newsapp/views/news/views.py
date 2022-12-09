from django.views.generic import ListView

from newsapp.models import News, Category
from newsapp.utils import get_news_likes_count_dict, get_user_liked_posts


class NewsByCategory(ListView):
    model = News
    template_name = 'news/news_by_category.html'
    context_object_name = 'news'
    allow_empty = True
    paginate_by = 3

    def get_category_id(self):
        category_slug = self.kwargs['category_slug']
        return Category.objects.get(slug=category_slug).pk

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super().get_context_data(**kwargs)
        category_id = self.get_category_id()
        category_title = Category.objects.get(pk=category_id).title
        context['title'] = f'Новости в категории {category_title}'

        # собираем словарь вида {news_pk: likes_count}
        news_likes = get_news_likes_count_dict()
        context['news_likes'] = news_likes

        # собираем список новостей, лайкнутых текущим пользователем
        user_liked_posts = get_user_liked_posts(self.request.user.pk)
        context['user_liked_posts'] = user_liked_posts
        context['category'] = category_title
        return context

    def get_queryset(self):
        category_id = self.get_category_id()

        """
         select_related позволяет вытащить данные из связанной модели сразу (в данном случае из модели Категория)
         условно здесь кейс следующий: странице нужно использовать данные о категории N раз
         с помощью select_related мы заберем данные 1 раз и далее сможем читать их
         столько, сколько нужно, без лишних затрат на выполнение запросов.
         иначе мы бы просто выполняли запросы N раз и ухудшали перфоманс.

         это работает только для моделей со связью 1-1, 1-N
         для связи N-N используется в тех же целях prefetch_related
        """

        return News.objects.filter(
            category=category_id,
            is_published=True,
        ).select_related('category').order_by('-created_at')
from django.contrib.auth.hashers import make_password
from django.views.decorators.cache import cache_page

from newsapp.models import User
from project.conf.redis_config import CACHE_TTL


class ResetPasswordMixin:
    @staticmethod
    def reset_password(user):
        user = User.objects.filter(pk=user.pk).first()
        user.password = make_password('1234User')
        user.save()


""" 
тестирование кэша:
установить https://www.npmjs.com/package/loadtest (доступно с установленным node.js)
запустить в cmd нагрузочное тестирование: loadtest -n 100 -k  http://localhost:8000/cookbook/

в debug-toolbar будет видно, что не улетает ни одного запроса, если кэш работает

"""
class CacheMixin(object):
    cache_timeout = CACHE_TTL

    def get_cache_timeout(self):
        return self.cache_timeout

    def dispatch(self, *args, **kwargs):
        return cache_page(self.get_cache_timeout())(super(CacheMixin, self).dispatch)(*args, **kwargs)

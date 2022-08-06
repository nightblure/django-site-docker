from datetime import datetime, timedelta
from typing import Callable

from django.http.response import HttpResponseNotFound
from django.utils import timezone

from django.contrib.auth import logout
from django.http import HttpRequest, HttpResponse


# миддлвейр для авто-разлогирования по истечении заданного времени в минутах
def logout_on_timeout(get_response: Callable[[HttpRequest], HttpResponse]) -> Callable:
    LOGOUT_TIMEOUT = 30 * 60

    def middleware(request: HttpRequest) -> HttpResponse:
        user = request.user

        if not user.is_anonymous and user.last_login < timezone.now() - timedelta(seconds=LOGOUT_TIMEOUT):
            logout(request)
            print('logout_on_timeout middleware is working')
        return get_response(request)

    return middleware

"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

from newsapp.views.errors_views import page_not_found_view

# вьюха-обработчик ошибки 404
handler404 = page_not_found_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('ckeditor/', include('ckeditor_uploader.urls')),

    # воспользуемся include, чтобы определить вложенные маршруты приложения newsapp
    # для этого нужно создать в приложении новый файл urls.py с маршрутами конкретного приложения
    path('', include('newsapp.urls')),

    # подключаем маршруты DRF API
    path('', include('newsapp.api.urls'))
]

if settings.DEBUG:

    # если дебаг-тулбар не работает, нужно пофиксить значение в реестре: https://www.youtube.com/watch?v=1LrWRY_buxE&ab_channel=Nu_Leh
    # ИЛИ добавить
    # import mimetypes
    # mimetypes.add_type("application/javascript", ".js", True)
    urlpatterns = [
        path('__debug__/', include('debug_toolbar.urls')),
    ] + urlpatterns

    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

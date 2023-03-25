from django.conf import settings

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    'ckeditor',
    'ckeditor_uploader',

    # регистрация приложения newsapp
    'newsapp.apps.RegisterNewsapp',

    'rest_framework',
    'rest_framework.authtoken',
    'djoser',
    'widget_tweaks',
]

if settings.DEBUG:
    INSTALLED_APPS.extend(
        [
            'debug_toolbar',
        ]
    )

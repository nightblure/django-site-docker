INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'debug_toolbar',
    'ckeditor',
    'ckeditor_uploader',

    # регистрация приложения newsapp
    'newsapp.apps.RegisterNewsapp',


    'rest_framework',
    'rest_framework.authtoken',
    'djoser',
    'widget_tweaks',
]
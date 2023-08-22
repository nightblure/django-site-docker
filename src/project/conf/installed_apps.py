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

    'commentsapp.apps.RegisterCommentsapp',
    'newsapp.apps.RegisterNewsapp',
    'categoriesapp.apps.RegisterCategoriesapp',
    'likesapp.apps.RegisterLikesapp',

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

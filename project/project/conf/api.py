REST_FRAMEWORK = {
    'DEFAULT_RENDERER_CLASSES': [
        'rest_framework.renderers.JSONRenderer',
        # включает генерацию UI DRF в браузере
        'rest_framework.renderers.BrowsableAPIRenderer',
    ],

    # дефолтные пермишны
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated',
    ],

    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework_simplejwt.authentication.JWTAuthentication',
        'rest_framework.authentication.TokenAuthentication',
        'rest_framework.authentication.BasicAuthentication',
        'rest_framework.authentication.SessionAuthentication',
    ],

    # дефолтная пагинация. работает глобально для любых запросов к api
    # 'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    # 'PAGE_SIZE': 5,

    # кастомный класс для пагинации. можно применять к отдельным вьюхам
    'DEFAULT_PAGINATION_CLASS': 'newsapp.api.pagination.StandardPagination',

    'DATETIME_FORMAT': "%d.%m.%Y"
}
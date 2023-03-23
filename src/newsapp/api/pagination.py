from rest_framework.pagination import PageNumberPagination


class StandardPagination(PageNumberPagination):

    # значение по умолчанию для запросов, в которых не указан параметр max_page_size
    page_size = 5

    """
    опциональный GET-параметр, используя который пользователь 
    может получать любое количество записей, не превышающее max_page_size
    """
    page_size_query_param = 'page_size'
    max_page_size = 15

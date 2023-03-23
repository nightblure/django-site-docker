"""
implement pagination for any API class!
for example APIView doesn't work with "pagination_class" attribute
"""
def get_paginated_response(pagination_class, serializer_class, queryset, request, view):
    paginator = pagination_class()
    page = paginator.paginate_queryset(queryset, request, view=view)

    if page is not None:
        serializer = serializer_class(page, many=True)
        return paginator.get_paginated_response(serializer.data)

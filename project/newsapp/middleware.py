import time


class SimpleMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        request.start_time = time.monotonic()

        response = self.get_response(request)

        total = time.monotonic() - request.start_time
        response["X-total-time"] = total
        print(f'total request time: {response["X-total-time"]}')
        return response

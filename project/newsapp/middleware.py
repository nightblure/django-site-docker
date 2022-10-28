import time


class RequestSpeedMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        request.start_time = time.monotonic()

        response = self.get_response(request)

        total = round(time.monotonic() - request.start_time, 2)
        response["X-total-time"] = total
        print(f'total request time: {total} seconds')
        return response

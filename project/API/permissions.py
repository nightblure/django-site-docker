from rest_framework import permissions


# разрешаем полный доступ только админам
# если метод безопасный, то всем пользователям даем доступ только на чтение
class IsAdmin(permissions.BasePermission):
    def has_permission(self, request, view):
        if not request.user.is_authenticated:
            return False
        return bool(request.user and request.user.is_staff)


class IsOwnerOrAdminOrAuthenticated(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):

        if not request.user.is_authenticated:
            return False

        # if request.method in permissions.SAFE_METHODS:
        #     return True

        return obj.user == request.user or request.user.is_staff

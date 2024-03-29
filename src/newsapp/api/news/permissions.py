from rest_framework import permissions


class IsNewsAuthorOrAdminAndAuthenticated(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.user.is_anonymous:
            return False

        # if request.method in permissions.SAFE_METHODS:
        #     return True

        return obj.author == request.user or request.user.is_staff


class IsAdmin(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user.is_staff

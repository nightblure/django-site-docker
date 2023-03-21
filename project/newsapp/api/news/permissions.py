from rest_framework import permissions


class IsNewsAuthorOrAdminAndAuthenticated(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):

        if not request.user.is_authenticated:
            return False

        # if request.method in permissions.SAFE_METHODS:
        #     return True

        return obj.author == request.user or request.user.is_staff
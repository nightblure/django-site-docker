import os

from project.settings import DEBUG, BASE_DIR

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, "static")

if not DEBUG:
    STATICFILES_DIRS = [os.path.join(BASE_DIR, "static")]
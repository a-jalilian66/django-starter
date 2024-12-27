from .base import *

DEBUG = False

ALLOWED_HOSTS = ['your-domain.com']

CORS_ALLOWED_ORIGINS = [
    "https://your-domain.com",
]

# Security settings
SECURE_SSL_REDIRECT = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True

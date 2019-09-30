from django.urls import path, include
from . import views

urlpatterns = [
    path('auth/signin', views.api_login, name='api_login'),
    path('auth/register', views.api_signup, name='api_signup')
]
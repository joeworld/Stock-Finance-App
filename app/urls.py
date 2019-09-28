from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.view_home, name='view_home'),
    path('auth/signin', views.view_login, name='view_login'),
    path('auth/register', views.view_signup, name='view_signup')
]
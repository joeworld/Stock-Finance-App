from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.view_home, name='view_home'),
    path('auth/signin', views.view_login, name='view_login'),
    path('auth/register', views.view_signup, name='view_signup'),
    path('auth/logout', views.view_logout,name='view_logout'),
    path('auth/test', views.test_page, name='test_page')
]
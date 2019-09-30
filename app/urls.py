from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.view_home, name='view_home'),
    path('auth/signin', views.view_login, name='view_login'),
    path('auth/register', views.view_signup, name='view_signup'),
    path('auth/logout', views.view_logout,name='view_logout'),
    path('stock/search-stock', views.view_search_stock,name='view_search_stock'),
    path('stock/<str:symbol>', views.view_stock, name='view_stock'),
    path('my-stock', views.view_my_stock, name='view_my_stock'),
    path('my-wallet', views.view_my_wallet, name='view_my_wallet'),
    path('my-transactions', views.view_my_transactions, name='view_my_transactions'),
    path('stock/sell/<str:symbol>', views.view_sell_stocks, name='view_sell_stocks'),
    path('testpage', views.view_tests, name='view_tests')
]
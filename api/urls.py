from django.urls import path, include
from . import views

urlpatterns = [
	path('', views.view_home, name='view_home'),
    path('auth/signin', views.api_login, name='api_login'),
    path('auth/register', views.api_signup, name='api_signup'),
    path('auth/logout', views.api_logout, name='api_logout'),
    path('user-transactions', views.view_user_transactions, name='view_user_transactions'),
    path('update-wallet', views.view_update_wallet, name='view_update_wallet'),
    path('user-wallet', views.view_user_api_wallet, name='view_user_api_wallet'),
    path('stock/search', views.view_api_search_stock, name='view_api_search_stock'),
    path('stock/price', views.view_search_stock_price, name='view_search_stock_price'),
    path('stock/buy', views.view_buy_stock, name='view_buy_stock'),
    path('stock/sell', views.view_share_stock, name='view_share_stock'),
    path('user-stocks', views.view_user_stocks, name='view_user_stocks'),
    path('user-data', views.api_user_data, name='api_user_data')
]
from django.shortcuts import render, redirect
from django.http import HttpResponse
from ..models import userTransaction
from django.contrib.auth.decorators import login_required
from ..repository import iexRepository, stockRepository, userRepository
from django.conf import settings
from django.contrib import messages

# Create your views here.
@login_required(login_url='/auth/signin')
def view_stock(req, symbol):
	data = iexRepository(settings.IEX_TOKEN_SK, symbol)
	data = data.getStockQuote()
	check_stock = stockRepository()
	check_stock = check_stock.checkIfStockIsSoldToOthers(symbol)
	if check_stock is not False:
		sold = True
	else:
		sold = False

	if req.method == 'POST':
		user_stock = stockRepository(req.POST)
		if user_stock.buyStock(req.user.id):
			return redirect('/stock/'+symbol)
		else:
			messages.info(req, 'You can not buy this stock, ensure you have enough in your wallet')
			return redirect('/my-wallet')
	else:
		if sold == False:
			return render(req, 'pages/single_stock.html', {'data':data,'sold':sold})
		else:
			return render(req, 'pages/single_stock.html', {'data':data,'sold':sold,'stock_data':check_stock})

@login_required(login_url='/auth/signin')
def view_search_stock(req, search=None):
	return render(req, 'pages/search_stock.html')

@login_required(login_url='/auth/signin')
def view_my_stock(req):
	repo = stockRepository()
	repo = repo.getUserStock(req.user.id)
	return render(req, 'pages/my_stock.html',{'stocks':repo})

@login_required(login_url='/auth/signin')
def view_sell_stocks(req, symbol):
	if req.method == 'POST':
		user = userRepository().getById(req.POST['receiver_id'])
		stock = stockRepository(req.POST)
		stock = stock.sellStock(req.user.id, req.POST['receiver_id'])
		messages.info(req, 'This stock now belongs to '+user.username)
		return render(req, 'pages/sell_stock.html')

	u_stock = stockRepository().checkIfStockIsSold(symbol, req.user.id)
	all_users   = userRepository().getAll()
	if u_stock is not False:
		return render(req, 'pages/sell_stock.html',{'stock':u_stock,'users':all_users})
	else:
		messages.info(req, 'This stock does not belong to you, constant query might lead to us blocking your IP!')
		return render(req, 'pages/sell_stock.html')
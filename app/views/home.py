from django.shortcuts import render, redirect
from django.http import HttpResponse
from ..models import userTransaction
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from ..repository import iexRepository, userRepository, stockRepository
from django.conf import settings

# Create your views here.
@login_required(login_url='/auth/signin')
def view_home(req):
	data = iexRepository(settings.IEX_TOKEN_SK)
	data = data.getMultipleStocks(['ACAM','SE','SSD','BK','BT','IEX'])
	return render(req, 'pages/home.html', {'data':data})

@login_required(login_url='/auth/signin')
def view_my_wallet(req):
	repo = userRepository()
	user_wallet = repo.getUserWallet(req.user.id)
	if req.method == 'POST':
		repo = userRepository(req.POST, True)
		repo.createWallet(req.user.id)
		repo.createTransaction(req.user.id)
		messages.info(req, 'Wallet Updated')
		return redirect('/my-wallet')
	else:
		if not user_wallet:
			user_wallet = 0
			return render(req, 'pages/wallet.html',{'user_wallet':user_wallet})
		else:
			return render(req, 'pages/wallet.html',{'user_wallet':user_wallet.wallet})

@login_required(login_url='/auth/signin')
def view_my_transactions(req):
	repo = userRepository()
	user_transactions = repo.getUserTransaction(req.user.id)
	return render(req, 'pages/user_transactions.html',{'user_transactions':user_transactions})

@login_required(login_url='/auth/signin')
def view_tests(req):
	repo = stockRepository()
	repo = repo.sellStock(1,2)
	return HttpResponse(repo)
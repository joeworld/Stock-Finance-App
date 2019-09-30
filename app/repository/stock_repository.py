from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from ..models import userModel, userTransaction, userStock
import datetime
from .user_repository import userRepository
from .iex_repository import iexRepository
from django.conf import settings

class stockRepository:

	def __init__(self, req=None):
		self.__req = req

	def getUserStock(self, user_id): # Returns user stocks
		user_stock = userStock.objects.filter(user_id=user_id).order_by('-id')
		return user_stock

	def checkIfStockIsSold(self, symbol, user_id):
		try:
			check_stock = userStock.objects.get(user_id=user_id,stock_symbol=symbol)
		except userStock.DoesNotExist:
			check_stock = False

		return check_stock

	def checkIfStockIsSoldToOthers(self, symbol):
		try:
			check_stock = userStock.objects.get(stock_symbol=symbol)
		except userStock.DoesNotExist:
			check_stock = False

		return check_stock

	def buyStock(self, user_id): # Buys a stock
		# Check if user has enough money to buy stock
		can_user = self.checkIfUserCanBuyStock(self.__req['stock_symbol'], user_id, True)
		if can_user is not False:
			self.insertStock(user_id)
			# Subtract from wallet
			company = iexRepository(settings.IEX_TOKEN_SK, self.__req['stock_symbol']).getStockQuote()
			summary = "Your wallet was updated after purchasing (" + company['companyName'] + ") "
			userRepository(None, True).subTractFromUserWallet(user_id, can_user, summary)
			return True
		else:
			return False

	def insertStock(self, user_id):
		stock_symbol = self.__req['stock_symbol']
		if self.checkIfStockIsSoldToOthers(stock_symbol) == False and self.checkIfStockIsSold(stock_symbol, user_id) == False:
			user_stock = userStock(user_id=user_id, stock_symbol=stock_symbol)
			return user_stock.save()
		else:
			return False

	def sellStock(self, user_id, receiver_id): # Sell Stocks
		# Authenticate both User
		user = userRepository()
		receiver = userRepository()
		user = user.getById(user_id)
		receiver = receiver.getById(receiver_id)
		if user is not False and receiver is not False:
			stock = self.checkIfStockIsSold(self.__req['stock_symbol'], user_id)
			if stock is not False:
				# Update stock user_id = receiver_id
				stock.user_id = receiver_id
				stock.save()
				# send summary of transactions to user_transactions
				transaction_id = 6
				company = iexRepository(settings.IEX_TOKEN_SK, self.__req['stock_symbol']).getStockQuote()
				summary = "You sold your stock " + company['companyName'] + " to " + receiver.username
				userRepository(None,True).createTransaction(user_id, summary, transaction_id)
				company = iexRepository(settings.IEX_TOKEN_SK, self.__req['stock_symbol']).getStockQuote()
				summary = "You got a stock (" + company['companyName'] + ") from " + user.username
				userRepository(None,True).createTransaction(receiver_id, summary, transaction_id)
				return True
			else:
				return False
		else:
			return False

	def checkIfUserCanBuyStock(self, symbol, user_id, latestPrice = False):
		user_wallet = userRepository().getUserWallet(user_id)
		if user_wallet == None:
			return False
		else:
			getStockQuote = iexRepository(settings.IEX_TOKEN_SK, symbol).getStockQuote()
			if user_wallet.wallet > getStockQuote['latestPrice']:
				if latestPrice == True:
					return getStockQuote['latestPrice']
				else:
					return True
			else:
				return False
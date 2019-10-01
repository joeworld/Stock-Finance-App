from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from iexfinance.stocks import Stock
from iexfinance.utils.exceptions import *
import six

class iexRepository:

	def __init__(self, secret_key, stock_symbol = None):
		self.__secret_key = secret_key
		self.__stock_symbol = stock_symbol

	def getStockPrice(self): #Returns stock price
		if isinstance(self.getStockQuote(), six.string_types) == False:
			return self.getStockQuote()['latestPrice']
		else:
			return False

	def getStockQuote(self): #Returns stock quotes
		try:
			batch = Stock(self.__stock_symbol, token=self.__secret_key)
			re = batch.get_quote()
		except:
			re = False

		return re

	def getStockViaClient(self):
		try:
			stock = Stock(self.__stock_symbol, token=self.__secret_key)
			stock = stock.get_quote()
		except:
			stock = False
		return stock

	def getMultipleStocks(self, stock_symbols):
		try:
			batch = Stock(stock_symbols, token=self.__secret_key)
			batch = batch.get_quote()
		except:
			batch = False
		return batch
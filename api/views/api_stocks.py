from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from app.repository import userRepository, iexRepository, stockRepository
from ..repository import keyRepository
from ..helper import *
from app.forms import signupForm, loginForm
from django.contrib.auth.models import User, auth
import json
import datetime
from django.conf import settings

def view_user_stocks(req):
	if req.method == 'GET':
		user_id = req.GET.get('user_id', None)
		api_key = req.GET.get('api_key', None)
		if all([user_id, api_key]):
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not userRepository().getById(user_id):
				response = returnResponse("Unauthorize, check that 'user_id' is valid", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			else:
				stocks = stockRepository()
				stocks = stocks.getUserStock(user_id, True)
				response = returnResponse("Query Successful", list(stocks), 'true', 200)
				return JsonResponse(response, status=200, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)


def view_search_stock(req):
	if req.method == 'GET':
		user_id = req.GET.get('user_id', None)
		api_key = req.GET.get('api_key', None)
		stock_symbol = req.GET.get('stock_symbol', None)
		check_stock = stockRepository()
		check_stock = check_stock.checkIfStockIsSoldToOthers(stock_symbol)
		if check_stock is not False:
			u = userRepository()
			u = u.getById(user_id)
			sold = {'sold':True,'username':u.username}
		else:
			sold = False

		if all([user_id, api_key, stock_symbol]):
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not userRepository().getById(user_id):
				response = returnResponse("Unauthorize, check that 'user_id' is valid", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			else:
				iex = iexRepository(settings.IEX_TOKEN_SK, stock_symbol)
				iex = iex.getStockViaClient()
				if iex is not False:
					response = returnResponse("Query Successful", iex, 'true', 200, sold)
					return JsonResponse(response, status=200, safe=False)
				else:
					response = returnResponse("IEX returned a query error, check your symbol and try again", {}, 'false', 203)
					return JsonResponse(response, status=203, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)

def view_search_stock_price(req):
	if req.method == 'GET':
		user_id = req.GET.get('user_id', None)
		api_key = req.GET.get('api_key', None)
		stock_symbol = req.GET.get('stock_symbol', None)
		check_stock = stockRepository()
		check_stock = check_stock.checkIfStockIsSoldToOthers(stock_symbol)
		if check_stock is not False:
			u = userRepository()
			u = u.getById(user_id)
			sold = {'sold':True,'username':u.username}
		else:
			sold = False

		if all([user_id, api_key, stock_symbol]):
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not userRepository().getById(user_id):
				response = returnResponse("Unauthorize, check that 'user_id' is valid", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			else:
				iex = iexRepository(settings.IEX_TOKEN_SK, stock_symbol)
				iex = iex.getStockViaClient()
				if iex is not False:
					response = returnResponse("Query Successful", {'latestPrice': iex['latestPrice'], 'iexRealtimePrice': iex['iexRealtimePrice']
						, 'extendedPrice': iex['iexRealtimePrice']}, 'true', 200, sold)
					return JsonResponse(response, status=200, safe=False)
				else:
					response = returnResponse("IEX returned a query error, check your symbol and try again", {}, 'false', 203)
					return JsonResponse(response, status=203, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)

def view_buy_stock(req):
	if req.method == 'GET':
		user_id = req.GET.get('user_id', None)
		stock_symbol = req.GET.get('stock_symbol', None)
		api_key = req.GET.get('api_key', None)
		if all([user_id, api_key, stock_symbol]):
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not userRepository().getById(user_id):
				response = returnResponse("Unauthorize, check that 'user_id' is valid", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			else:
				iex = iexRepository(settings.IEX_TOKEN_SK, stock_symbol)
				iex = iex.getStockViaClient()
				if iex == False:
					response = returnResponse("This stock does not exist on IEX", {}, 'false', 406)
					return JsonResponse(response, status=406, safe=False)

				stock = stockRepository(req.GET)
				if stock.checkIfStockIsSoldToOthers(stock_symbol) is not False:
					response = returnResponse("This stock has been purchased", {}, 'false', 406)
					return JsonResponse(response, status=406, safe=False)
				if stock.buyStock(req.user.id):
					response = returnResponse("Stock Successfully Purchased", {}, 'true', 200)
					return JsonResponse(response, status=200, safe=False)
				else:
					response = returnResponse("You could not purchase this stock, ensure you have enough in wallet", {}, 'false', 406)
					return JsonResponse(response, status=406, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)

def view_share_stock(req):
	if req.method == 'GET':
		user_id = req.GET.get('user_id', None)
		receiver_id = req.GET.get('receiver_id', None)
		stock_symbol = req.GET.get('stock_symbol', None)
		api_key = req.GET.get('api_key', None)
		if all([user_id, receiver_id, stock_symbol, api_key]):
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not userRepository().getById(user_id):
				response = returnResponse("Unauthorize, check that 'user_id' is valid", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			elif not userRepository().getById(receiver_id):
				response = returnResponse("Receiver ID is not a registered user", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			else:
				stock = stockRepository(req.GET)
				if stock.checkIfStockIsSold(stock_symbol, user_id) is not False:
					receiver = userRepository().getById(req.GET['receiver_id'])
					stock.sellStock(user_id, receiver_id)
					response = returnResponse("This stock now belongs to "+receiver.username, {}, 'true', 200)
					return JsonResponse(response, status=200, safe=False)
				else:
					response = returnResponse("This stock does not belong to this user", {}, 'false', 203)
					return JsonResponse(response, status=203, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from app.repository import userRepository
from ..repository import keyRepository
from ..helper import *
from app.forms import signupForm, loginForm
from django.contrib.auth.models import User, auth
import json
import datetime

def view_user_transactions(req):
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
				# Get transactions
				data = userRepository().getUserTransaction(user_id, True)
				response = returnResponse("Successful", list(data), 'true', 200)
				return JsonResponse(response, status=200, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)

def view_update_wallet(req):
	if req.method == 'GET':
		user_id = req.GET.get('user_id', None)
		api_key = req.GET.get('api_key', None)
		wallet  = req.GET.get('new_wallet', None)
		if all([user_id, api_key, wallet]):
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not userRepository().getById(user_id):
				response = returnResponse("Unauthorize, check that 'user_id' is valid", {}, 'false', 401)
				return JsonResponse(response, status=401, safe=False)
			else:
				# Update wallet
				u = userRepository(None, True)
				u.createWallet(user_id, wallet)
				dt = str(datetime.datetime.now())
				summary = str("Wallet was updated at ")
				summary = summary + dt
				transaction_id = 3
				u.createTransaction(user_id, summary, transaction_id)
				response = returnResponse("Successful", {'summary': summary, 'transaction_id': transaction_id}, 'true', 200)
				return JsonResponse(response, status=200, safe=False)
		else:
			response = returnResponse("Some stuffs are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)
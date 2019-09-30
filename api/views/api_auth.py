from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from app.repository import userRepository
from ..repository import keyRepository
from ..helper import *
from app.forms import signupForm, loginForm
from django.contrib.auth.models import User, auth

# Create your views here.
def api_signup(req):
	if req.method == 'GET':
		username = req.GET.get('username', None)
		email = req.GET.get('email', None)
		password = req.GET.get('password', None)
		api_key = req.GET.get('api_key', None)
		if all([username, email, password, api_key]):
			form = signupForm(req.GET)
			# Check API key is correct
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not form.is_valid():
				response = returnResponse("There are some errors", form.errors, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			else:
				user = userRepository(req.GET)
				user.create()
				response = returnResponse("Created Successfully", {'username':user.getByEmail(req.GET['email']).username, 
					'email':user.getByEmail(req.GET['email']).email}, 'true', 200)
				return JsonResponse(response, status=200, safe=False)
		else:
			response = returnResponse("Some things are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)

def api_login(req):

	if req.user.is_authenticated:
		response = returnResponse("Already Logged In", {}, 'false', 403)
		return JsonResponse(response, status=403, safe=False)

	if req.method == 'GET':
		username = req.GET.get('username', None)
		password = req.GET.get('password', None)
		api_key = req.GET.get('api_key', None)
		if all([username, password, api_key]):
			# Check API key is correct
			if keyRepository(api_key).getKeyBySk() == False:
				response = returnResponse("Api key not found", {}, 'false', 203)
				return JsonResponse(response, status=203, safe=False)
			elif not auth.authenticate(username=username,password=password):
				response = returnResponse("Invalid Credentials", {"errors": {"credential": ["Your username or password does not exist"]}}, 'false', 406)
				return JsonResponse(response, status=406, safe=False)
			else:
				user = userRepository()
				response = returnResponse("Authenticate Successfully", {'username':user.getByUsername(req.GET['username']).email, 
					'email':user.getByUsername(req.GET['username']).email, 'user_id':user.getByUsername(req.GET['username']).id}, 'true', 200)
				return JsonResponse(response, status=200, safe=False)
		else:
			response = returnResponse("Some things are missing in your request", {}, 'false', 406)
			return JsonResponse(response, status=406, safe=False)

def api_logout(req):
	if not req.user.is_authenticated:
		response = returnResponse("You are not logged in", {}, 'false', 400)
		return JsonResponse(response, status=400, safe=False)
	else:
		auth.logout(req)
		response = returnResponse("Logged out Successfully", {}, 'true', 200)
		return JsonResponse(response, status=200, safe=False)

def view_home(req):
	response = returnResponse("No Params? come on, we have to use them, Please provide", {}, 'true', 200)
	return JsonResponse(response, status=200, safe=False)
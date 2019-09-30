from django.shortcuts import render, redirect
import json
from django.http import HttpResponse, JsonResponse
from django.core import serializers
from app.repository import userRepository

# Create your views here.
def api_signup(req):
	users = userRepository()
	users = users.getAll()
	users = {'users': users}
	return JsonResponse(json.dumps(users), content_type="application/json")

def api_login(req):
	return HttpResponse("Hello")
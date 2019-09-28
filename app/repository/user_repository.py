from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth

class userRepository:
	
	def __init__(self, req):
		self.__req = req

	def create(self):
		username = self.__req['username']
		email	 = self.__req['email']
		password = self.__req['password']
		user = User.objects.create_user(username=username, password=password, email=email)
		return user.save()

	def get(self, type, value):
		pass

	def getAll(self):
		pass
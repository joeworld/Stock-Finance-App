from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from django.contrib import messages
from ..forms import signupForm, loginForm
from ..repository import userRepository
from django.contrib.auth.decorators import login_required

# Create your views here.
def view_signup(req):
	if req.user.is_authenticated:
		return redirect('/')

	if req.method == 'POST':
		form = signupForm(req.POST)
		if form.is_valid():
			uRepo = userRepository(req.POST)
			uRepo.create()
			messages.info(req, 'Login now with your new Credentials')
			return redirect('../auth/signin')
		else:
			return render(req, 'auth/signup.html', {'form':form})
	else:
		return render(req, 'auth/signup.html')


def view_login(req):
	if req.user.is_authenticated:
		return redirect('/')

	if req.method == 'POST':
		username = req.POST['username']
		password = req.POST['password']
		user = auth.authenticate(username=username,password=password)
		if user is not None:
			auth.login(req, user)
			return redirect('/')
		else:
			messages.info(req, 'Invalid Credentials')
			return render(req, 'auth/login.html')
	else:
		return render(req, 'auth/login.html')


@login_required(login_url='/auth/signin')
def view_logout(req):
	auth.logout(req)
	return redirect('/')


def test_page(req):
	if req.user.is_authenticated:
		return HttpResponse("Logged in")
	else:
		return HttpResponse("Not Logged in")
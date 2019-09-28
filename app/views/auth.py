from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from django.contrib import messages
from ..forms import signupForm
from ..repository import userRepository

# Create your views here.
def view_signup(req):
	form = signupForm(req.POST)
	if req.method == 'POST':
		if form.is_valid():
			uRepo = userRepository(req.POST)
			return redirect('/')
		else:
			return render(req, 'auth/signup.html', {'form':form})
	else:
		return render(req, 'auth/signup.html')


def view_login(req):
    return render(req, 'auth/login.html')
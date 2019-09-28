from django.shortcuts import render
from django.http import HttpResponse
from ..models import userTransaction
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required(login_url='/auth/signin')
def view_home(req):
	data = userTransaction.objects.all()
	return render(req, 'pages/home.html', {'data': data})
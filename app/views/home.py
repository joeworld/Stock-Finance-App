from django.shortcuts import render
from django.http import HttpResponse
from ..models import userTransaction

# Create your views here.
def view_home(req):
	data = userTransaction.objects.all()
	return render(req, 'pages/home.html', {'data': data})
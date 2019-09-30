from django.contrib import admin
from .models import *
from api.models import apiKeys

# Register your models here.
admin.site.register(userTransaction)
admin.site.register(userModel)
admin.site.register(userStock)
admin.site.register(apiKeys)
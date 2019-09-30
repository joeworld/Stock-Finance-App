from django.db import models

class userStock(models.Model):
	user_id = models.BigIntegerField()
	stock_symbol = models.CharField(max_length=100)
	created = models.DateField(auto_now_add=True)
from django.db import models

class userTransaction(models.Model):
	user_id = models.BigIntegerField()
	transaction_id = models.BigIntegerField()
	summary = models.TextField()
	created = models.DateField(auto_now_add=True)
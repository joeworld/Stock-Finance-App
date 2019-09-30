from django.db import models

class userModel(models.Model):
	user_id = models.BigIntegerField()
	transaction_id = models.BigIntegerField()
	summary = models.TextField()
	wallet = models.BigIntegerField(default=0)
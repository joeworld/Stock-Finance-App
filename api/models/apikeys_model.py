from django.db import models

class apiKeys(models.Model):
	public_key = models.TextField()
	secret_key = models.TextField()
from ..models import apiKeys
import datetime

class keyRepository:

	def __init__(self, sk, pk=None):
		self.__sk = sk
		self.__pk = pk

	def getKeyBySk(self):
		try:
			get_key = apiKeys.objects.get(secret_key=self.__sk)
		except apiKeys.DoesNotExist:
			get_key = False

		return get_key

	def getKeyBySkTest(self):
		return apiKeys.objects.get(secret_key=self.__sk)

	def getKeyByPk(self):
		try:
			get_key = apiKeys.objects.get(public_key=self.__pk)
		except apiKeys.DoesNotExist:
			get_key = False

		return get_key

	def getKeyByPkAndSk(self):
		try:
			get_key = apiKeys.objects.get(public_key=self.__pk,secret_key=self.__sk)
		except apiKeys.DoesNotExist:
			get_key = False

		return get_key

	def getAllKeys(self):
		return apiKeys.objects.all().order_by('-id')
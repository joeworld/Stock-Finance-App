from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, auth
from ..models import userModel, userTransaction
import datetime

class userRepository:
	
	def __init__(self, req=None, create_transaction = False):
		self.__req = req
		self.__create_transaction = create_transaction

	def create(self):
		username = self.__req['username']
		email	 = self.__req['email']
		password = self.__req['password']
		user = User.objects.create_user(username=username, password=password, email=email)
		return user.save()

	def getById(self, value, values = False):
		try:
			if values == False:
				user = User.objects.get(id=value)
			else:
				user = User.objects.get(id=value).values('user_id','email','username')
		except User.DoesNotExist:
			user = False
		return user

	def getByEmail(self, value):
		try:
			user = User.objects.get(email=value)
		except User.DoesNotExist:
			user = False
		return user

	def getByUsername(self, value):
		try:
			user = User.objects.get(username=value)
		except User.DoesNotExist:
			user = False
		return user

	def getAll(self):
		return User.objects.all()

	def getAllValues(self):
		return User.objects.values()

	def getUserWallet(self, user_id):
		try:
			wallet = userModel.objects.get(user_id=user_id)
		except userModel.DoesNotExist:
			wallet = None
		return wallet

	def getUserWalletValues(self, user_id):
		try:
			wallet = userModel.objects.get(user_id=user_id)
		except userModel.DoesNotExist:
			wallet = None
		return wallet

	def createWallet(self, user_id, wallet=None, summary=None):
		transaction_id = 2
		dt = str(datetime.datetime.now())
		if wallet == None:
			wallet = self.__req['wallet']

		if summary == None:
			summary = str("Wallet updated at ")
		
		summary = summary + dt
		# update if already exist
		check_wallet = self.getUserWallet(user_id)
		if check_wallet is not None:
			user_wallet = userModel.objects.get(user_id=user_id)
			user_wallet.wallet = wallet
			user_wallet.summary = summary
			user_wallet.transaction_id = transaction_id
			return user_wallet.save()
		else:
			wallet = userModel(user_id=user_id,transaction_id=transaction_id,summary=summary,wallet=wallet)
			return wallet.save()

	def createTransaction(self, user_id, summary=None, transaction_id=None):
		if self.__create_transaction == True:
			if summary == None:
				summary = self.__req.get('summary', False)

			if transaction_id == None:
				transaction_id = self.__req.get('transaction_id', False)
			transact = userTransaction(user_id=user_id,transaction_id=transaction_id,summary=summary)
			return transact.save()
		else:
			return False

	def getUserTransaction(self, user_id, values = False):
		if values == True:
			user_transaction = userTransaction.objects.filter(user_id=user_id).values('transaction_id','summary','created').order_by('-id')
			return user_transaction

		user_transaction = userTransaction.objects.filter(user_id=user_id).order_by('-id')
		return user_transaction

	def subTractFromUserWallet(self, user_id, amountToSubtract, summary = None):
		if self.getUserWallet(user_id) is not None:
			wallet = self.getUserWallet(user_id).wallet
			if wallet > amountToSubtract:
				new_wallet = wallet - amountToSubtract
				# Update Wallet
				self.createWallet(user_id, new_wallet, summary)
				self.createTransaction(user_id, summary, 5)
				return True
			else:
				return False
		else:
			return False
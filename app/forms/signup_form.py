from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User
from django.core.validators import validate_email
from django.core.exceptions import ValidationError

class signupForm(ModelForm):
	class Meta:
		model = User
		fields = ["username", "email", "password"]

	def clean(self):
		super(signupForm, self).clean()
		username = self.cleaned_data.get('username')
		email    = self.cleaned_data.get('email')
		password = self.cleaned_data.get('password')

		if len(username) < 5:
			self._errors['username'] = self.error_class([
				'Minimum of 5 characters required as username'])
		elif User.objects.filter(username=username).exists():
			self._errors['username'] = self.error_class([
				'Username already exists'])

		if User.objects.filter(email=email).exists():
			self._errors['email'] = self.error_class([
				'Email already exists'])

		try:
			validate_email(email)
		except ValidationError as e:
			self._errors['email'] = self.error_class([
				'Email is invalid'])

		if len(password) < 6:
			self._errors['password'] = self.error_class([
				'Minimum of 6 characters required as password'])

		return self.cleaned_data
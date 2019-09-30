from django.forms import ModelForm
from django import forms
from django.contrib.auth.models import User, auth

class loginForm(ModelForm):
	class Meta:
		model = User
		fields = ["username", "password"]

	def clean(self):
		super(loginForm, self).clean()
		username = self.cleaned_data.get('username')
		password = self.cleaned_data.get('password')
		
		if User.objects.get(username=username) is None:
			self._errors['username'] = self.error_class([
				'Username does not exist'])

		return self.cleaned_data
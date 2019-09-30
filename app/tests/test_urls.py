from django.test import TestCase

# Create your tests here.

class UrlsTestCase(TestCase):
	def test_response_login_page(self):
		response = self.client.get('/auth/signin')
		self.assertEqual(response.status_code, 200)

	def test_response_register_page(self):
		response = self.client.get('/auth/register')
		self.assertEqual(response.status_code, 200)
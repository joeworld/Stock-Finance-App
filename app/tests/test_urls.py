from django.test import TestCase, Client

# Guest urls only

class TestUrls(TestCase):

	def setUp(self):
		pass

	def test_login_url(self):
		response = self.client.get('/auth/signin')
		# Check that homepage works fine
		print("Method: test that login user interface works.")
		self.assertEqual(response.status_code, 200)

	def test_register_url(self):
		response = self.client.get('/auth/register')
		# Check that homepage works fine
		print("Method: test that registeration user interface works.")
		self.assertEqual(response.status_code, 200)
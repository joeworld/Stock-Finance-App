from django.test import TestCase
from app.repository import iexRepository, stockRepository, userRepository
import json
import datetime

class TransactionsTestClass(TestCase):
    @classmethod
    def setUpTestData(cls):
        print("setUpTestData: Run once to set up non-modified data for all class methods.")
        pass

    def setUp(self):
        print("setUp: Run once for every test method to setup clean data.")
        pass

    def create_sample_user(self):
        req = {'username':'registeruser',
        'email':'registeruser@gmail.com',
        'password':'registeruser123',
        'api_key':'sk_6765fr554ef33342332467678',
        'test':'test'}
        response = self.client.get('/api/v1/auth/register', req)
        return {'username':'registeruser','password':'registeruser123'}

    def login_sample_user(self):
    	user = self.create_sample_user()
    	req = {
    	'username':'registeruser',
    	'password':'registeruser123',
    	'api_key':'sk_6765fr554ef33342332467678',
    	'test':'test'}
    	response = self.client.get('/api/v1/auth/signin', req)
    	return str(response.content, encoding='utf8')

    def test_get_transactions(self):
        user = json.loads(self.login_sample_user())
        req = {
        'test': 'test',
        'user_id': user['data']['user_id'],
        'api_key':'sk_6765fr554ef33342332467678'
        }
        response = self.client.get('/api/v1/user-transactions', req)
        print(str(response.content, encoding='utf8'))
        self.assertEqual(response.status_code, 200)

    def test_repo_transactions(self):
        user = json.loads(self.login_sample_user())
        response = userRepository().getUserTransaction(user['data']['user_id'], True)
        self.assertEqual(0, len(response))

    def test_create_transactions(self):
        user = json.loads(self.login_sample_user())
        response = userRepository(None,True).createTransaction(user['data']['user_id'], "Test", 3, True)
        self.assertEqual(1, len(response))
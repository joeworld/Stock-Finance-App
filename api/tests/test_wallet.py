from django.test import TestCase
from app.repository import iexRepository, stockRepository, userRepository
import json
import datetime

class WalletTestClass(TestCase):
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

    def update_test_wallet(self, user_id):
        # Update wallet
        u = userRepository(None, True)
        u.createWallet(user_id, 9000)
        dt = str(datetime.datetime.now())
        summary = str("Wallet was updated at ")
        summary = summary + dt
        transaction_id = 3
        u.createTransaction(user_id, summary, 3)

    def test_update_wallet(self):
    	user = json.loads(self.login_sample_user())
    	request = {
    	'user_id':user['data']['user_id'],
    	'api_key':'sk_6765fr554ef33342332467678',
    	'new_wallet':9000,
    	'test':'test'
    	}
    	response = self.client.get('/api/v1/update-wallet', request)
    	self.assertEqual(response.status_code, 200)

    def test_get_wallet(self):
        user = json.loads(self.login_sample_user())
        self.update_test_wallet(user['data']['user_id'])
        response = self.client.get('/api/v1/user-wallet', {'user_id':user['data']['user_id'],'api_key':'sk_6765fr554ef33342332467678','test':'test'})
        self.assertEqual(response.status_code, 200)
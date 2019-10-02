from django.test import TestCase
from app.repository import iexRepository, stockRepository, userRepository
import json
import datetime

class StockTestClass(TestCase):
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

    def create_sample_receiver(self):
        req = {'username':'registeruser2',
        'email':'registeruser2@gmail.com',
        'password':'registeruser123',
        'api_key':'sk_6765fr554ef33342332467678',
        'test':'test'}
        response = self.client.get('/api/v1/auth/register', req)
        return {'username':'registeruser2','password':'registeruser123'}

    def user_create_stock(self, user_id):
        self.update_test_wallet(user_id)
        st = {}
        st['stock_symbol'] = 'yy'
        stock = stockRepository(st).insertStock(user_id)

    def update_test_wallet(self, user_id):
        # Update wallet
        u = userRepository(None, True)
        u.createWallet(user_id, 10000)
        dt = str(datetime.datetime.now())
        summary = str("Wallet was updated at ")
        summary = summary + dt
        transaction_id = 3
        u.createTransaction(user_id, summary, 3)

    def login_sample_receiver(self):
        user = self.create_sample_receiver()
        req = {
        'username':'registeruser2',
        'password':'registeruser123',
        'api_key':'sk_6765fr554ef33342332467678',
        'test':'test'}
        response = self.client.get('/api/v1/auth/signin', req)
        return str(response.content, encoding='utf8')

    def test_can_view_stocks(self):
    	user = json.loads(self.login_sample_user())
    	req = {
        'test': 'test',
    	'user_id': user['data']['user_id'],
    	'api_key':'sk_6765fr554ef33342332467678'
    	}
    	response = self.client.get('/api/v1/user-stocks', req)
    	print(str(response.content, encoding='utf8'))
    	self.assertEqual(response.status_code, 200)

    def test_can_search_stocks(self):
    	user = json.loads(self.login_sample_user())
    	req = {
    	'user_id': user['data']['user_id'],
    	'api_key':'sk_6765fr554ef33342332467678',
        'stock_symbol':'acam',
    	'test':'test'}
    	response = self.client.get('/api/v1/stock/search', req)
    	print(str(response.content, encoding='utf8'))
    	self.assertEqual(response.status_code, 200)

    def test_can_search_stock_price(self):
        user = json.loads(self.login_sample_user())
        req = {
        'user_id': user['data']['user_id'],
        'api_key':'sk_6765fr554ef33342332467678',
        'stock_symbol':'acam',
        'test':'test'}
        response = self.client.get('/api/v1/stock/price', req)
        print(str(response.content, encoding='utf8'))
        self.assertEqual(response.status_code, 200)

    def test_can_buy_stock(self):
        user = json.loads(self.login_sample_user())
        self.update_test_wallet(user['data']['user_id'])
        req = {
        'user_id': user['data']['user_id'],
        'api_key':'sk_6765fr554ef33342332467678',
        'stock_symbol':'acam',
        'test':'test'}
        response = self.client.get('/api/v1/stock/buy', req)
        print(str(response.content, encoding='utf8'))
        self.assertEqual(response.status_code, 406)

    def test_can_sell_stock(self):
        user = json.loads(self.login_sample_user())
        self.update_test_wallet(user['data']['user_id'])
        self.user_create_stock(user['data']['user_id'])
        receiver = json.loads(self.login_sample_receiver())
        req = {
        'user_id': user['data']['user_id'],
        'api_key':'sk_6765fr554ef33342332467678',
        'stock_symbol':'yy',
        'receiver_id': receiver['data']['user_id'],
        'test':'test'}
        response = self.client.get('/api/v1/stock/sell', req)
        print(str(response.content, encoding='utf8'))
        self.assertEqual(response.status_code, 200)
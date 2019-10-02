from django.test import TestCase
from app.repository import iexRepository, stockRepository, userRepository
import json

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

    def create_stock(self, user_id):
        st = {}
        st['stock_symbol'] = 'yy'
        stock = stockRepository(st).insertStock(user_id)
        return stock

    def test_user_create_stock(self, user_id):
        st = {}
        st['stock_symbol'] = 'yy'
        stock = stockRepository(st).insertStock(user_id)
        self.assertNotEqual(False, stock)

    def test_get_user_repo_stocks(self):
        user = json.loads(self.login_sample_user())
        stocks = userRepository().getUserStock(user['data']['user_id'])
        self.assertEqual(0, len(stocks))
        self.create_stock(user['data']['user_id'])
        stocks = userRepository().getUserStock(user['data']['user_id'])
        self.assertEqual(1, len(stocks))
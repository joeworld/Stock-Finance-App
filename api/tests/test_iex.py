from django.test import TestCase
from app.repository import iexRepository
from django.conf import settings

class IexTestClass(TestCase):
    @classmethod
    def setUpTestData(cls):
        print("setUpTestData: Run once to set up non-modified data for all class methods.")
        pass

    def setUp(self):
        print("setUp: Run once for every test method to setup clean data.")
        pass

    def test_token_is_not_none(self):
        print("Be sure there is a token")
        token = settings.IEX_TOKEN_SK
        self.assertNotEqual(None, token)

    def test_stock_quote(self):
    	print("Be sure stock quotes can be collected from IEX")
    	data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
    	self.assertNotEqual(False, data)

    def test_stock_quote_via_client(self):
    	print("Be sure stock price can be collected from IEX")
    	data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockViaClient()
    	self.assertNotEqual(False, data)

    def test_multiple_stock_quotes(self):
    	print("Be sure multiple stocks can be collected from IEX")
    	data = iexRepository(settings.IEX_TOKEN_SK).getMultipleStocks(['AAPL','SE','ACAM'])
    	self.assertNotEqual(False, data)

    def test_if_latestprice_is_in_iex(self):
    	data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
    	print(data['latestPrice'])
    	self.assertNotEqual(None, data['latestPrice'])

    def test_if_companyname_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['companyName'])
        self.assertNotEqual(None, data['companyName'])

    def test_if_latestprice_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['latestPrice'])
        self.assertNotEqual(None, data['latestPrice'])

    def test_if_latesttime_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['latestTime'])
        self.assertNotEqual(None, data['latestTime'])

    def test_if_latestcap_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['marketCap'])
        self.assertNotEqual(None, data['marketCap'])

    def test_if_latestupdate_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['latestUpdate'])
        self.assertNotEqual(None, data['latestUpdate'])

    def test_if_latestlowweek_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['week52Low'])
        self.assertNotEqual(None, data['week52Low'])

    def test_if_latestexchange_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['primaryExchange'])
        self.assertNotEqual(None, data['primaryExchange'])

    def test_if_lateshighweek_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['week52High'])
        self.assertNotEqual(None, data['week52High'])

    def test_if_latestytd_is_in_iex(self):
        data = iexRepository(settings.IEX_TOKEN_SK, 'ACAM').getStockQuote()
        print(data['ytdChange'])
        self.assertNotEqual(None, data['ytdChange'])
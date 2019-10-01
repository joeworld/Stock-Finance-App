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
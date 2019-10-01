from django.test import TestCase

class UserAuthTestClass(TestCase):
    @classmethod
    def setUpTestData(cls):
        print("setUpTestData: Run once to set up non-modified data for all class methods.")
        pass

    def setUp(self):
        print("setUp: Run once for every test method to setup clean data.")
        pass

    def test_create_user(self):
    	response = self.client.get('/api/v1/auth/register')
    	self.assertEqual(response.status_code, 406)
    	print("Method: Test that register without credentials will throw 406 error.")
    	res = {'message':'Some things are missing in your request','data':{},'status':'false','status_code':406}
    	self.assertJSONEqual(str(response.content, encoding='utf8'), res)
    	req = {'username':'registeruser',
    	'email':'registeruser@gmail.com',
    	'password':'registeruser123',
    	'api_key':'sk_67767665t5y67g556t565654544',
    	'test':'test'}
    	response = self.client.get('/api/v1/auth/register', req)
    	# print(str(response.content, encoding='utf8'))
    	self.assertEqual(response.status_code, 200)

    def create_sample_user(self):
    	req = {'username':'registeruser',
    	'email':'registeruser@gmail.com',
    	'password':'registeruser123',
    	'api_key':'sk_67767665t5y67g556t565654544',
    	'test':'test'}
    	response = self.client.get('/api/v1/auth/register', req)
    	return {'username':'registeruser','password':'registeruser123'}

    def test_login_user(self):
    	user = self.create_sample_user()
    	req = {
    	'username':'registeruser',
    	'password':'registeruser123',
    	'api_key':'sk_67767665t5y67g556t565654544',
    	'test':'test'}
    	response = self.client.get('/api/v1/auth/signin', req)
    	# print(str(response.content, encoding='utf8'))
    	self.assertEqual(response.status_code, 200)
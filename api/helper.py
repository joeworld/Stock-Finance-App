
def returnResponse(message, data, status, status_code, sold = None):
	if sold == None:
		response = {'message':message,'data':data,'status':status,'status_code':status_code}
	else:
		response = {'message':message,'data':data,'status':status,'status_code':status_code,'sold': sold}
	return response
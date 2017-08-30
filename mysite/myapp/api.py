# -*- coding: utf-8 -*-

import os
import sys
import json
import MySQLdb
from django.http import JsonResponse, StreamingHttpResponse, HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout, models  #登入和登出
from django.conf import settings

def operator_db(request, sql, is_search=False):
	db = MySQLdb.connect(host="localhost",user="root",passwd="admin1",db="myaoo",charset="utf8")
	cursor = db.cursor()
	print sql
	cursor.execute(sql)
	if is_search:
		data = cursor.fetchall()
		db.close()
		return data
	db.commit()
	db.close()

def resource(request):
	sql = "select *from blog_user"
	data = operator_db(request, sql, True)
	aa = []
	for one in data:
		info = dict()
		info['customerId'] = one[0]
		info['companyName'] = one[1]
		info['contactName'] = one[2]
		info['phone'] = one[3]
		aa.append(info)
	# safe ： 默认为True。如果设置为False，可以传递任何对象进行序列化（否则，只允许dict 实例）。
	# 如果safe 为True，而第一个参数传递的不是dict 对象，将抛出一个TypeError。
	return JsonResponse(aa, safe=False)

def add(request):
	if request.method == 'POST':
		try:
			user_obj=json.loads(request.body)
			print  "import data: ", user_obj
			id = int(user_obj["customerId"])
			name = user_obj["companyName"]
			password = user_obj["contactName"]
			message_id = int(user_obj["phone"])
		except:
			print "Input error!"
			sys.exit()
		sql = "insert into blog_user(id,name,password,message_id) values('%d','%s','%s','%d')" % (id,name,password,message_id)
		operator_db(request, sql)
		print "Import data done!"
	return JsonResponse({})

def login_api(request):
    if request.method == "POST":
        print request.body
        user_obj=json.loads(request.body)
        username = user_obj["username"]
        password = user_obj["password"]
        print user_obj["username"]
        user = authenticate(username=username,password=password)  # 类型为<class 'django.contrib.auth.models.User'>
        # print(type(models.Customer.objects.get(name="赵凡")))
        print(user,type(user))
        if user:
            login(request, user)  # 验证成功之后登录
            # return redirect('/myapp/post/')
            return JsonResponse({'id':1, 'name':username})
        else:
			return JsonResponse({'status':'error','message':'用户或密码错误！'})
    return JsonResponse({})

def register_api(request):
    if request.method == "POST":
        user_obj = json.loads(request.body)
        print "**************", user_obj
        username = user_obj["username"]
        email = "person@126.com"#user_obj["email"]
        password = user_obj["password"]
        print username
        user = models.User.objects.create_user(username, email, password)
        user.save()
        print "Register Success!!!"
    return JsonResponse({})

def file_upload(request): #列出树形目录，上传文件页面
    if request.method == 'POST':
        path_root = settings.FILE_ROOT # 文件根路径 #上传文件存放的主目录
        myFile =request.FILES.get("myfile", None)    # 获取上传的文件，如果没有文件，则默认为None
        print "^^^^^^^^^^", myFile, type(myFile), myFile.name
        if not myFile:
            dstatus = "Please select the file to upload!"
        else:
            path_ostype = os.path.join(path_root, 'file_upload_preserve_dir')
            path_dst_file = os.path.join(path_ostype, myFile.name)
            # print path_dst_file
            if os.path.isfile(path_dst_file):
                dstatus = "%s already exist!"%(myFile.name)
            else:
                destination = open(path_dst_file,'wb+')    # 打开特定的文件进行二进制的写操作
                for chunk in myFile.chunks():      # 分块写入文件
                    destination.write(chunk)
                destination.close()
                dstatus = "%s upload success!"%(myFile.name)
        return HttpResponse(dstatus)
    return JsonResponse({})

def file_download(request):
	response = file_download_api(fpath='file_download_source/files', fname='secret.txt')
	if response:
		return response
	else:
		return HttpResponse(u"Sorry！文件路径错误！")

def file_download_api(**kwarg): #提供文件下载页面
    #定义文件分块下载函数
    def file_iterator(file_name, chunk_size=512):
        with open(file_name,'rb') as f: #如果不加‘rb’以二进制方式打开，文件流中遇到特殊字符会终止下载，下载下来的文件不完整
            while True:
                c = f.read(chunk_size)
                if c:
                    yield c
                else:
                    break
    fpath = kwarg["fpath"]
    fname = kwarg["fname"]
    # path_root = "C:\Users\111\Desktop\mysite\file_upload_dir"
    path_root = settings.FILE_ROOT # 文件根路径
    if fpath is not None and fname is not None:
        file_fpath = os.path.join(path_root, fpath) #fapth是文件的上一级目录名称
        file_dstpath = os.path.join(file_fpath, fname) #fname是文件名称
        if not os.path.exists(file_dstpath):
			return HttpResponse(u"Sorry！没有找到该文件！")
        response = StreamingHttpResponse(file_iterator(file_dstpath))
        response['Content-Type'] = 'application/octet-stream'
        response['Content-Disposition'] = 'attachment;filename="{0}"'.format(fname) #此处fname是要下载的文件的文件名称
		#format:字符串格式化，通过{}和:来代替传统 %方式
        return response
    return {}

from src.QcloudApi.qcloudapi import QcloudApi
def qcloudapi(request):
	module = 'account'
	action = 'DescribeProject'
	config = {
	    'Region': 'tj',
	    'secretId': 'AKIDnX6UjeBdjiXDh4TM9oIbigT6YoyzwtdM',
	    'secretKey': 'mNm03vdBXihVDj4DC0c4LXYP4XvBHCyc',
	    'method': 'get'
	}
	# params = {
	#     'entityFileName': '/test.txt',
	#     'entityFile': '/tmp/test.txt',
	#     'SignatureMethod':'HmacSHA256',#指定所要用的签名算法，可选HmacSHA256或HmacSHA1，默认为HmacSHA1
	# }
	params = {}
	try:
	    service = QcloudApi(module, config)
	    print service.generateUrl(action, params)
	    result = service.call(action, params)
	    #service.setRequestMethod('get')
	    #print service.call('DescribeCdnEntities', {})
	except Exception, e:
	    print 'exception:', e
	# print "qqqqqqqqq", json.loads(result)["data"]
	if request.method == 'POST':
		print json.loads(request.body)
		for one in json.loads(result)["data"]:
			if json.loads(request.body)['name'].strip() == one["projectName"]:
				return JsonResponse([one], safe=False)
	return JsonResponse(json.loads(result)["data"], safe=False)

def get_booklist(request):
	if request.method == 'POST':
		request_data = json.loads(request.body)
		if request_data.has_key("name"):
			name = request_data["name"].strip()
			sql = "select *from books where name='%s'" % (name)
			data = operator_db(request, sql, True)
			total = len(data)
		else:
			sql = "select count(1) from books"
			total = int(operator_db(request, sql, True)[0][0])
			page = request_data["page"]
			lines = request_data["lines"]
			sql = "select *from books limit %d,%d" % ((page-1)*lines, page*lines)
			data = operator_db(request, sql, True)
		aa = []
		for one in data:
			info = dict()
			info['name'] = one[1]
			print info['name']
			info['author'] = one[2]
			info['date'] = one[3]
			info['description'] = one[4]
			aa.append(info)
		# safe ： 默认为True。如果设置为False，可以传递任何对象进行序列化（否则，只允许dict 实例）。
		# 如果safe 为True，而第一个参数传递的不是dict 对象，将抛出一个TypeError。
		return JsonResponse({"total":total, "data":aa}, safe=False)
	return JsonResponse({})

def delete_book_api(request):
	if request.method == 'POST':
		data = json.loads(request.body)
		names = []
		if data.has_key('name'):
			names.append(data["name"])
		elif data.has_key('names'):
			names = data["names"].split(',')
		for name in names:
			sql = "delete from books where name='%s'" % (name)
			operator_db(request, sql)
		print "Delete data!"
	return JsonResponse({})

def edit_book_api(request):
	if request.method == 'POST':
		data = json.loads(request.body)
		date = data["date"]
		name = data["name"]
		sql = "update books set date='%s' where name='%s'" % (date, name)
		operator_db(request, sql)
		print "Edit data!"
	return JsonResponse({})

def add_book_api(request):
	if request.method == 'POST':
		data = json.loads(request.body)
		name = data["name"]
		author = data["author"]
		date = data["date"]
		description = data["description"]
		sql = "insert into books values(NULL, '%s', '%s', '%s', '%s')" % (name,author,date,description)
		operator_db(request, sql)
		print "Add data!"
	return JsonResponse({})

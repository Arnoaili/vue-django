#-*- coding:utf-8 -*-

from django.conf.urls import url
from . import views
from . import api

urlpatterns = [
    url(r'^post/$', views.post, name='post'),
    url(r'^$', views.index, name='index'),
    url(r'^auto_login/$', views.auto_login, name='auto_login'),
    url(r'^auto_logout/$', views.auto_logout, name='auto_logout'),
    url(r'^test/$', views.test, name='test'),
    url(r'^modal/$', views.modal, name='modal'),
    url(r'^resource/$', api.resource, name='resource'),
    url(r'^add/$', api.add, name='add'),
    url(r'^login_api/$', api.login_api, name='login_api'),
    url(r'^register_api/$', api.register_api, name='register_api'),
    url(r'^file_upload/$', api.file_upload, name='file_upload'),
    url(r'^file_download/$', api.file_download, name='file_download'),
    url(r'^qcloudapi/$', api.qcloudapi, name='qcloudapi'),
    url(r'^get_booklist/$', api.get_booklist, name='get_booklist'),
    url(r'^delete_book_api/$', api.delete_book_api, name='delete_book_api'),
    url(r'^edit_book_api/$', api.edit_book_api, name='edit_book_api'),
    url(r'^add_book_api/$', api.add_book_api, name='add_book_api'),
]

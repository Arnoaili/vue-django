# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required  # 验证用户是否登录
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
# Create your views here.

@login_required
def post(request):
    # if not request.user.is_authenticated(): #false 原始方法，如果没认证就重定向到登陆界面
    #     return redirect('/myapp/auto_login/')
	return render(request,'post.html')

@login_required(login_url='/myapp/auto_login/')
def index(request):
    return HttpResponse(u"欢迎光临 自强学堂!")

@login_required
def test(request):
    # a="www"
    # if a:
    #     return redirect('/myapp/post/')
    return render(request, 'test.html')

@login_required
def modal(request):
	return render(request, 'modal.html')

def auto_login(request):
    return render(request, 'login.html')

def auto_logout(request):
    logout(request)  # 退出登录
    print "******logout***********"
    return redirect("/myapp/auto_login/")

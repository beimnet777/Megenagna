from urllib import response
from django.shortcuts import render
from rest_framework.views import APIView
from django.contrib.auth import authenticate
from rest_framework.response import Response
import jwt,datetime
from rest_framework import status

class login(APIView):
  def post(self,request):
   
    user=authenticate(request,username=request.data['username'],password=request.data['password'])
    
    if user:
      payload={
      'id':user.id,
      'exp':datetime.datetime.utcnow() +datetime.timedelta(hours=1.0),
      'iat':datetime.datetime.utcnow()}
      token=jwt.encode(payload,'secret',algorithm='HS256')
      response=Response()
      response.set_cookie(key='jwt',value=token,httponly=True)
      response.data={
        'jwt':token
      }
      return response
    return Response(status=status.HTTP_401_UNAUTHORIZED)
class Logout(APIView):
  def post(self,request):
    
    response=Response()
    response.delete_cookie('jwt')
    response.data={
      'message':'SUCCESS'
    }
    return response

# Create your views here.

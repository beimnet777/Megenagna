from django.shortcuts import render
from rest_framework import generics,viewsets
from .models import EmployeeProfile, EmployerProfile, Job
from .serializer import EmployeeSerializer,EmployerSerializer,JobSerializer



# Create your views here.
class EmployeeProfileView(viewsets.ModelViewSet):
    queryset = EmployeeProfile.objects.all()
    serializer_class = EmployeeSerializer

class EmployerProfileView(viewsets.ModelViewSet):
    queryset = EmployerProfile.objects.all()
    serializer_class = EmployerSerializer

class JobViewSet(viewsets.ModelViewSet):
    queryset = Job.objects.all()
    serializer_class = JobSerializer

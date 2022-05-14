from django.shortcuts import render
from rest_framework import generics
from .models import Employee, Employer, Job
from .serializer import EmployeeSerializer,EmployerSerializer,JobSerializer


# Create your views here.
class EmployeeView(generics.ListCreateAPIView):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer

class EmployerView(generics.ListCreateAPIView):
    queryset = Employer.objects.all()
    serializer_class = EmployerSerializer

class JobView(generics.ListCreateAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer

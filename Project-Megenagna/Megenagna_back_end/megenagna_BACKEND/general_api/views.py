from django.core import serializers
from rest_framework.decorators import api_view
from django.contrib.auth.decorators import login_required
from rest_framework import status
from rest_framework import generics,viewsets
from django.contrib.auth.models import User
from django.utils.decorators import method_decorator

from general_api.pagination import customPageNumberPagination
from .models import EmployeeProfile, EmployerProfile, Job,Application
from .serializer import EmployeeSerializer,EmployerSerializer,JobSerializer,EmployeeUserSerializer,EmployerUserSerializer,ApplicationSerializer

from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.permissions import IsAuthenticated
from django.http import HttpResponse

# Create your views here.
def allowed_users(groups=[]):
    def decorator(view_func):
        def wrapper_func(request, *args, **kwargs):
            group = None

            if request.user.groups.exists():
                group = request.user.groups.all()[0].name
            if group in groups:
                return view_func(request, *args, **kwargs)
            else:
                return HttpResponse("You are not authorize to view this page ")
        
        return wrapper_func
    return decorator




@method_decorator(allowed_users(['Employee']),name='list')
@method_decorator(allowed_users(['Employee']),name='retrieve')
@method_decorator(allowed_users(['Employee']),name='create')

class EmployeeProfileView(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated]
    queryset = EmployeeProfile.objects.all()
    serializer_class = EmployeeSerializer
    

# @method_decorator(allowed_users(['Employer']),name='list')
# @method_decorator(allowed_users(['Employer']),name='retrieve')
# @method_decorator(allowed_users(['Employer']),name='create')

class EmployerProfileView(viewsets.ModelViewSet):
    queryset = EmployerProfile.objects.all()
    serializer_class = EmployerSerializer
    permission_classes = [IsAuthenticated]

# @method_decorator(allowed_users(['Employee','Employer']),name='list')
# @method_decorator(allowed_users(['Employee','Employer']),name='retrieve')
# @method_decorator(allowed_users(['Employer']),name='create')

class JobViewSet(viewsets.ModelViewSet):
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    # permission_classes = [IsAuthenticated]



@method_decorator(allowed_users(['Employee']),name='retrieve')
@method_decorator(allowed_users(['Employee']),name='list')
class EmployeeUserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = EmployeeUserSerializer


# @method_decorator(allowed_users(['Employer']),name='retrieve') 
# @method_decorator(allowed_users(['Employer']),name='list')   
class EmployerUserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = EmployerUserSerializer

@method_decorator(allowed_users(['Employee','Employer']),name='list')
@method_decorator(allowed_users(['Employee','Employer']),name='retrieve')
@method_decorator(allowed_users(['Employee']),name='create')
   
class ApplicationViewSet(viewsets.ModelViewSet):
    queryset = Application.objects.all()
    serializer_class = ApplicationSerializer
    permission_classes = [IsAuthenticated]


class JobLister(generics.ListAPIView):
    queryset = Job.objects.all()
    pagination_class = customPageNumberPagination
    serializer_class = JobSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name']
    permission_classes = [IsAuthenticated]



@api_view(['GET'])
@login_required
@allowed_users(['Employer'])
def get_jobs_company(request, id):
    queryset = Job.objects.filter(user=id)
    data = serializers.serialize('json', list(queryset))
    return HttpResponse(data, status=status.HTTP_200_OK)


def get_application(request, id):
    queryset = Application.objects.filter(job=id)
    data = serializers.serialize('json', list(queryset))
    return HttpResponse(data, status=status.HTTP_200_OK)


@api_view(['GET'])
@login_required
def get_user(request):
    user=request.user
    queryset=[user]
    data = serializers.serialize('json', list(queryset))
    return HttpResponse(data,status=status.HTTP_200_OK)
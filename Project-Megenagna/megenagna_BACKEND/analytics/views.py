from general_api.models import Application
from rest_framework.decorators import api_view

from .models import Analytics
from rest_framework import status
from rest_framework.response import Response
from django.http import JsonResponse
from django.core import serializers
from django.contrib.auth.decorators import login_required
from general_api.views import allowed_users



@api_view(['GET'])
@login_required
@allowed_users(['Employer'])
def get_analytics(request,id):
  age_18_29= Application.objects.filter(age__range=(18, 29),job=id ).count()
  age_30_50= Application.objects.filter(age__range=(30, 50) ,job=id ).count()
  age_51= Application.objects.filter(age__range=(50, 100),job=id  ).count()
  gpa_3_5_4=Application.objects.filter(gpa__range=(3.5, 4),job=id  ).count()
  gpa_3_3_5=Application.objects.filter(gpa__range=(3, 3.5),job=id  ).count()
  gpa_3=Application.objects.filter(gpa__range=(0, 3),job=id  ).count()
  experience_0_2=Application.objects.filter(experience__range=(0, 2),job=id  ).count()
  experience_2_5=Application.objects.filter(experience__range=(2, 5),job=id  ).count()
  experience_6=Application.objects.filter(experience__range=(6, 100),job=id  ).count()
  male=Application.objects.filter(sex='Male',job=id  ).count()
  female=Application.objects.filter(sex='Female',job=id  ).count()

  dict={

    "age_18_29":age_18_29,
    "age_30_50":age_30_50,
    "age_51":age_51,
    "male":male,
    "female":female,
    "experience_0_2":experience_0_2,
    "experience_2_5":experience_2_5,
    "experience_6":experience_6,
    "gpa_3_5_4":gpa_3_5_4,
    "gpa_3_3_5":gpa_3_3_5,
    "gpa_3":gpa_3

  }


  
  analytic=Analytics(
    age_18_29=age_18_29,age_30_50=age_30_50,age_51=age_51,
    gpa_3=gpa_3,gpa_3_3_5=gpa_3_3_5,gpa_3_5_4=gpa_3_5_4,
    experience_6=experience_6,experience_2_5=experience_2_5,experience_0_2=experience_0_2,
    female=female,male=male
  )
  data = serializers.serialize("json", [analytic])
  
  
  return JsonResponse(dict)



# Create your views here.

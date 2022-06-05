from rest_framework import serializers
from django.contrib.auth.models import User
from django.contrib.auth.models import Group

from .models import EmployeeProfile, EmployerProfile,Job,Application


class EmployeeUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=('id','first_name','last_name','email','username','password')
    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        
        new_group = Group.objects.get(name ='Employee')

        user.groups.add(new_group)
        return user
class EmployerUserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=('id','first_name','last_name','email','username','password')
    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        
        new_group = Group.objects.get(name ='Employer')

        user.groups.add(new_group)
        return user
class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmployeeProfile
        fields = ('id','employee_name','employee_specialization','employee_age',
        'employee_description','employee_gpa',
        'employee_degree_name','skills_1','skills_2','skills_3','skills_4',
        'user','image')

class EmployerSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmployerProfile
        fields = ('id','employer_name','employer_function','employer_city','employer_sub_city','user','image')

class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('id','name','job_experience_years','job_description','job_benefits',
        'job_salary','skills_needed_1','skills_needed_2','skills_needed_3','skills_needed_4',
        'user','image')
class ApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Application
        fields =  '__all__'      
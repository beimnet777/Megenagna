from rest_framework import serializers

from .models import EmployeeProfile, EmployerProfile,Job

class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmployeeProfile
        fields = ('id','employee_name','employee_specialization','employee_age',
        'employee_description','employee_gpa',
        'employee_degree_name','skills_1','skills_2','skills_3','skills_4')

class EmployerSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmployerProfile
        fields = ('id','employer_name','employer_function','employer_city','employer_sub_city')

class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('id','job_name','job_experience_years','job_description','job_benefits',
        'job_salary','skills_needed_1','skills_needed_2','skills_needed_3','skills_needed_4')
        
from rest_framework import serializers

from .models import Employer,Employee,Job

class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ('id','employee_name','employee_specialization',
        'employee_description','employee_gpa',
        'employee_degree')

class EmployerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employer
        fields = ('id','employer_name','employer_function')

class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ('id','job_name','job_experience_years','job_description')
    

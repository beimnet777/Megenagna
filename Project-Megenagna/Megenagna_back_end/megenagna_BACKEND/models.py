from django.db import models
from django.contrib.auth.models import User



# Create your models here.
class EmployeeProfile(models.Model):

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    employee_name = models.CharField(max_length=100)
    employee_age = models.IntegerField()
    employee_specialization = models.CharField(max_length = 100)
    employee_description = models.TextField()
    employee_gpa = models.FloatField(max_length=3)
    employee_degree_name = models.CharField(max_length=70)
    skills_1=models.CharField(max_length=60)
    skills_2=models.CharField(max_length=60)
    skills_3=models.CharField(max_length=60)
    skills_4=models.CharField(max_length=60)
    sex=models.CharField(max_length=10)
    image=models.ImageField(upload_to='static',null=True)

class EmployerProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    employer_name = models.CharField(max_length=100)
    employer_city=models.CharField(max_length=60)
    employer_sub_city=models.CharField(max_length=60)
    employer_function = models.CharField(max_length = 100)
    image=models.ImageField(upload_to='static',null=True)
    

class Job(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    name = models.CharField(max_length= 100)
    job_experience_years = models.IntegerField()
    job_description = models.TextField()
    job_benefits=models.TextField()
    job_salary=models.IntegerField()
    skills_needed_1=models.CharField(max_length=60)
    skills_needed_2=models.CharField(max_length=60)
    skills_needed_3=models.CharField(max_length=60)
    skills_needed_4=models.CharField(max_length=60)
    image=models.ImageField(upload_to='static',null=True)
class Application(models.Model):
    job = models.ForeignKey(Job, on_delete=models.CASCADE)
    experience = models.IntegerField()
    gpa=models.FloatField(max_length=3)
    degree=models.CharField(max_length=100)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    sex=models.CharField(max_length=10)
    experience=models.IntegerField() 
    age=models.IntegerField()
    status=models.IntegerField()



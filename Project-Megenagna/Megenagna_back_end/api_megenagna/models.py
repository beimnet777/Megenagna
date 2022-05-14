from sys import maxsize
from django.db import models


# Create your models here.

class Employee(models.Model):
    employee_name = models.CharField(max_length=100)
    employee_age = models.IntegerField()
    employee_specialization = models.CharField(max_length = 100)
    employee_description = models.TextField()
    employee_gpa = models.FloatField(max_length=3)
    employee_degree = models.FileField()

class Employer(models.Model):
    employer_name = models.CharField(max_length=100)
    employer_function = models.CharField(max_length = 100)

class Job(models.Model):
    job_name = models.CharField(max_length= 100)
    job_experience_years = models.IntegerField()
    job_description = models.TextField()





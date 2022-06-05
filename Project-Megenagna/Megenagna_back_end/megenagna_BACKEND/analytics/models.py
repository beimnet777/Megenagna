from django.db import models
class Analytics(models.Model):
  age_18_29=models.IntegerField()
  age_30_50=models.IntegerField()
  age_51=models.IntegerField()
  gpa_3_5_4=models.IntegerField()
  gpa_3_3_5=models.IntegerField()
  gpa_3=models.IntegerField()
  experience_0_2=models.IntegerField()
  experience_2_5=models.IntegerField()
  experience_6=models.IntegerField()
  male=models.IntegerField()
  female=models.IntegerField()

# Create your models here.

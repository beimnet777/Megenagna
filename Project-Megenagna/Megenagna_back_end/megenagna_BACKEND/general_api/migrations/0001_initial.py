# Generated by Django 4.0.3 on 2022-06-03 13:44

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Job',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('job_experience_years', models.IntegerField()),
                ('job_description', models.TextField()),
                ('job_benefits', models.TextField()),
                ('job_salary', models.IntegerField()),
                ('skills_needed_1', models.CharField(max_length=60)),
                ('image', models.ImageField(null=True, upload_to='static')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EmployerProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employer_name', models.CharField(max_length=100)),
                ('employer_city', models.CharField(max_length=60)),
                ('employer_sub_city', models.CharField(max_length=60)),
                ('employer_function', models.CharField(max_length=100)),
                ('image', models.ImageField(null=True, upload_to='static')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EmployeeProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employee_name', models.CharField(max_length=100)),
                ('employee_age', models.IntegerField()),
                ('employee_specialization', models.CharField(max_length=100)),
                ('employee_description', models.TextField()),
                ('employee_gpa', models.FloatField(max_length=3)),
                ('employee_degree_name', models.CharField(max_length=70)),
                ('skills_1', models.CharField(max_length=60)),
                ('skills_2', models.CharField(max_length=60)),
                ('skills_3', models.CharField(max_length=60)),
                ('skills_4', models.CharField(max_length=60)),
                ('sex', models.CharField(max_length=10)),
                ('image', models.ImageField(null=True, upload_to='static')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Application',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gpa', models.FloatField(max_length=3)),
                ('degree', models.CharField(max_length=100)),
                ('sex', models.CharField(max_length=10)),
                ('experience', models.IntegerField()),
                ('age', models.IntegerField()),
                ('status', models.IntegerField()),
                ('job', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='general_api.job')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]

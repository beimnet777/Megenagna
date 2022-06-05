# Generated by Django 4.0.3 on 2022-06-03 13:44

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Analytics',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('age_18_29', models.IntegerField()),
                ('age_30_50', models.IntegerField()),
                ('age_51', models.IntegerField()),
                ('gpa_3_5_4', models.IntegerField()),
                ('gpa_3_3_5', models.IntegerField()),
                ('gpa_3', models.IntegerField()),
                ('experience_0_2', models.IntegerField()),
                ('experience_2_5', models.IntegerField()),
                ('experience_6', models.IntegerField()),
                ('male', models.IntegerField()),
                ('female', models.IntegerField()),
            ],
        ),
    ]
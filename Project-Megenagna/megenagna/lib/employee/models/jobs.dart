import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Job {
  final int id;
  final int user;
  final String name;
  final int job_experience_years;
  final String job_description;
  final String job_benefits;
  final int job_salary;
  final String skills_needed_1;
  final String skills_needed_2;
  final String skills_needed_3;
  final String skills_needed_4;
  final image;

  Job(
      this.id,
      this.name,
      this.job_experience_years,
      this.job_description,
      this.job_benefits,
      this.job_salary,
      this.skills_needed_1,
      this.skills_needed_2,
      this.skills_needed_3,
      this.skills_needed_4,
      this.user,
      this.image);

  factory Job.fromJson(Map<String, dynamic> json) {
    var tempid = json['id'];
    var tempName = json['name'];
    var tempExp = json['job_experience_years'];
    var tempDesc = json['job_description'];
    var tempBen = json['job_benefits'];
    var tempSal = json['job_salary'];
    var tempS1 = json['skills_needed_1'];
    var tempS2 = json['skills_needed_2'];
    var tempS3 = json['skills_needed_3'];
    var tempS4 = json['skills_needed_4'];
    var tempUser = json['user'];
    var tempImg = "assets/photo01.jpg";

    Job job = Job(tempid, tempName, tempExp, tempDesc, tempBen, tempSal, tempS1,
        tempS2, tempS3, tempS4, tempUser, tempImg);
    return job;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> employeeJson = {
      'user': this.user, //change to real user from object
      'name': this.name, //change to real id from object
      'job_experience_years': this.job_experience_years,
      'job_description': this.job_description,
      'job_benefits': this.job_benefits,
      'job_salary': this.job_salary,
      'skills_needed_1': this.skills_needed_1,
      'skills_needed_2': this.skills_needed_2,
      'skills_needed_3': this.skills_needed_3,
      'skills_needed_4': this.skills_needed_4,
      'image': this.image,
    };
    return employeeJson;
  }

  // factory Job.fromJson(String json) {
  //   Map<String, dynamic> newJson = jsonDecode(json);
  //   var tempUser = json['user'];
  //   var tempName = json['name'];
  //   var tempExp = json['job_experience_years'];
  //   var tempDesc = json['job_description'];
  //   var tempBen = json['job_benefits'];
  //   var tempSal = json['job_salary'];
  //   var tempS1 = json['skills_needed_1'];
  //   var tempS2 = json['skills_needed_2'];
  //   var tempS3 = json['skills_needed_3'];
  //   var tempS4 = json['skills_needed_4'];
  //   var tempImg = json['image'];

  //   Job job = Job(tempUser, tempName, tempExp, tempDesc, tempBen, tempSal,
  //       tempS1, tempS2, tempS3, tempS4, tempImg);
  //   return job;
}

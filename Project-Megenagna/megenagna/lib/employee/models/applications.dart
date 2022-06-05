import 'dart:convert';

class Application {
  final job;
  final int experience;
  final gpa;
  final String degree;
  final user;
  final String sex;
  final int age;
  final int status;

  Application(this.experience, this.gpa, this.degree, this.sex, this.age,
      this.status, this.job, this.user);

  factory Application.fromJson(Map<String, dynamic> json) {
    var tempexp = json['experience'];
    var tempGpa = json['gpa'];
    var tempDeg = json['degree'];
    var tempSex = json['sex'];
    var tempAge = json['age'];
    var tempStatus = json['status'];
    var tempJob = json['job'];
    var tempUser = json['user'];

    return Application(tempexp, tempGpa, tempDeg, tempSex, tempAge, tempStatus,
        tempJob, tempUser);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> employeeJson = {
      // 'id': this.id,
      'experience': this.experience,
      'gpa': this.gpa,
      'degree': this.degree,
      'sex': this.sex,
      'age': this.age,
      'status': this.status,
      'job': this.job,
      'user': this.user,
    };
    return employeeJson;
  }
}

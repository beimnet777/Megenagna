import 'dart:convert';

class Employee {
  final int user;
  final int id;
  final employee_name;
  final employee_age;
  final employee_specialization;
  final employee_description;
  final employee_gpa;
  final employee_degree_name;
  final sex;
  final skills_1;
  final skills_2;
  final skills_3;
  final skills_4;

  Employee(
      this.user,
      this.id,
      this.employee_name,
      this.employee_age,
      this.employee_specialization,
      this.employee_description,
      this.employee_gpa,
      this.employee_degree_name,
      this.skills_1,
      this.skills_2,
      this.skills_3,
      this.skills_4,
      this.sex);

  factory Employee.fromJson(Map<String, dynamic> json) {
    var tempUser = json['user'];
    var tempId = json['id'];
    var tempName = json['employee_name'];
    var tempAge = json['employee_age'];
    var tempSpec = json['employee_specialization'];
    var tempDesc = json['employee_description'];
    var tempGpa = json['employee_gpa'];
    var tempDeg = json['employee_degree_name'];
    var tempSex = json['sex'];

    return Employee(tempUser, tempId, tempName, tempAge, tempSpec, tempDesc,
        tempGpa, tempDeg, "jsadna", "asdn", "adsd", "asdas", tempSex);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> employeeJson = {
      'user': this.user, //change to real user from object
  //    'id': this.id, //change to real id from object
      'employee_name': this.employee_name,
      'employee_age': this.employee_age,
      'employee_specialization': this.employee_specialization,
      'employee_description': this.employee_description,
      'employee_gpa': this.employee_gpa,
      'employee_degree_name': this.employee_degree_name,
      'skills_1': "null",
      'skills_2': "null",
      'skills_3': "null",
      'skills_4': "null",
      'sex': this.sex,
    };
    return employeeJson;
  }
}

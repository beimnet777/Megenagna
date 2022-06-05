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

  Employee(
      this.user,
      this.id,
      this.employee_name,
      this.employee_age,
      this.employee_specialization,
      this.employee_description,
      this.employee_gpa,
      this.employee_degree_name,
      this.sex);

  factory Employee.fromJson(String json) {
    Map<String, dynamic> newJson = jsonDecode(json);
    var tempUser = newJson['user'];
    var tempId = newJson['id'];
    var tempName = newJson['employee_name'];
    var tempAge = newJson['employee_age'];
    var tempSpec = newJson['employee_specialization'];
    var tempDesc = newJson['employee_description'];
    var tempGpa = newJson['employee_gpa'];
    var tempDeg = newJson['employee_degree_name'];
    var tempSex = newJson['sex'];

    return Employee(tempUser, tempId, tempName, tempAge, tempSpec, tempDesc,
        tempGpa, tempDeg, tempSex);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> employeeJson = {
      'user': this.user, //change to real user from object
      'id': this.id, //change to real id from object
      'employee_name': this.employee_name,
      'employee_age': this.employee_age,
      'employee_specialization': this.employee_specialization,
      'employee_description': this.employee_description,
      'employee_gpa': this.employee_gpa,
      'employee_degree_name': this.employee_degree_name,
      'sex': this.sex,
    };
    return employeeJson;
  }
}

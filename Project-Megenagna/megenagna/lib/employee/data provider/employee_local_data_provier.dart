import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/employee/models/employee.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeDataProvider {
  final String baseUrlEmployeeProfile =
      'http://localhost:8000/api/v1/model/employee';

  Future getEmployeeProfile(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/v1/model/employee/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load Employee");
    }
  }

  Future<List<Employee>> getAllProfiles() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/v1/model/employee/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    List<Employee> allEmps = [];
    if (response.statusCode == 200) {
      print(response.body);
      final decodedJson = jsonDecode(response.body);
      print(decodedJson);
      for (Map<String, dynamic> em in decodedJson) {
        var temp = Employee.fromJson(em);
        allEmps.add(temp);
      }
      if (allEmps.isEmpty) {
        throw Exception("No profile Found");
      }
      return allEmps;
    } else {
      throw Exception("failed to load Employee");
    }
  }

  Future createEmployeeProfile(Employee employee) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.post(
      Uri.parse("http://localhost:8000/api/v1/model/employee/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(employee.toJson()),
    );
    print(jsonDecode(response.body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Employee');
    }
  }

  Future editEmployeeProfile(Employee employee) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.patch(
      Uri.parse("$baseUrlEmployeeProfile/${employee.id}/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(employee.toJson()),
    );

    /// Map<String, dynamic> newJson = jsonDecode(jsonDecode(response.body));
    // print(employee.toJson());
    // print(newJson);

    if (response.statusCode == 200 ||
        response.statusCode == 204 ||
        response.statusCode == 201) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Employee");
    }
  }

  // Future deleteEmployeeProfile(Employee employee) async {
  //   final response =
  //       await http.delete(Uri.parse("$baseUrlEmployeeProfile/${employee.id}"));

  //   if (response.statusCode != 204) {
  //     throw Exception("Failed to delete Profile");
  //   }
  // }
}

import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:last/employee/models/Employer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployerProvider {
  final String jobBaseUrl = 'http://localhost:8000/api/v1/model/EmployerUser';

  getEmployer(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$jobBaseUrl/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      print(
          "111111111111111111111111111111111111111111111111111111111111111111111111");
      print(response.body);
      return Employer.fromJson(response.body);
    } else {
      throw Exception("failed to load Employee");
    }
  }
}

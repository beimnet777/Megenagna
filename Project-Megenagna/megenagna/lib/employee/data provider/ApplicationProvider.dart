import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/employee/models/applications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationProvider {
  final String baseUrlApplication =
      'http://localhost:8000/api/v1/model/Application';

  // getApplicationsById(int id){
  //   final response = http.get(Uri.parse(uri))
  // }

  Future createApplication(Application application) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("in create");
    final response = await http.post(
      Uri.parse('$baseUrlApplication/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(application.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Application.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("failed to load Employee");
    }
  }

  Future<List<Application>> getAllApplications() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.get(Uri.parse('$baseUrlApplication/'),
    headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    List<Application> allApplications = [];
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> app in decodedJson) {
        var temp = Application.fromJson(app);
        allApplications.add(temp);
      }
      return allApplications;
    } else {
      throw Exception("failed to load Employee");
    }
  }
}

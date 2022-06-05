import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:last/employee/models/jobs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobProvider {
  final String jobBaseUrl = 'http://127.0.0.1:8000/api/v1/model/jobs';

  Future<List<Job>> getAllJobs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("in provider");
    print(token);
    final response = await http.get(
      Uri.parse('$jobBaseUrl/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.body);
    List<Job> allJobs = [];
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      print(decodedJson);
      for (Map<String, dynamic> job in decodedJson) {
        var temp = Job.fromJson(job);
        print(temp);
        allJobs.add(temp);
      }
      print(allJobs);
      return allJobs;
    } else {
      throw Exception("failed to load Employee");
    }
  }
}

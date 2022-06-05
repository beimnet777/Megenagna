import 'dart:convert';
import 'package:last/Auth/bloc/auth_bloc.dart';
import 'package:last/employer/blocs/post_blocs/post_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/application.dart';
import '../models/job.dart';
import '/Auth/models/user.dart';
import 'package:http/http.dart' as http;

final String baseUrlJob = 'http://127.0.0.1:8000/api/v1/model/jobs/';
final String baseUrlJobStats = 'http://127.0.0.1:8000/analytics';
final String baseUrlJobList = 'http://127.0.0.1:8000/jobs';
final String baseUrlApplicantshttp = 'http://127.0.0.1:8000/apps';

class JobProvider {
  Future createJob(PostPressed post) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final int? id = prefs.getInt('id');
    Map data = {
      "name": post.jobTitle,
      "job_experience_years": post.experience,
      "job_description": post.jobDescription,
      "job_benefits": post.jobBenefit,
      "job_salary": post.salary,
      "skills_needed_1": post.skill,
      "skills_needed_2": "null",
      "skills_needed_3": "null",
      "skills_needed_4": "null",
      "user": id,
      "image": null
    };

    var body = json.encode(data);
    final response = await http.post(
      Uri.parse(baseUrlJob),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      print(jsonDecode(response.body));
      return Job.fromJsonJob(jsonDecode(response.body));
    } else {
      return 0;
    }
  }

  Future getStatus(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    final response = await http.get(
      Uri.parse("$baseUrlJobStats/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

      return jsonDecode(response.body);
    } else {
      return 0;
    }
  }

  Future getAllJobs(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrlJobList/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    List<Job> allJobs = [];
    if (response.statusCode == 200) {
      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> job in decodedJson) {
        var temp = Job.fromJson(job);
        allJobs.add(temp);
      }
      print(allJobs);
      return allJobs;
    } else {
      return 0;
    }
  }

  Future getApplicants(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrlApplicantshttp/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );
    List<Application> allApplication = [];
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> app in decodedJson) {
        var temp = Application.fromJsonApp(app);
        allApplication.add(temp);
      }

      return allApplication;
    } else {
      return 0;
    }
  }
}

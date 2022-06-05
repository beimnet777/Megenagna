import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/create_profile_blocs/createprofileevent.dart';

class CompanyProfileProvider {
  final String baseUrlEmployerProfile =
      'http://127.0.0.1:8000/api/v1/model/employer/';
  Future createEmployeeProfile(CreateProfilePressed profile, int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var data = <String, dynamic>{
      "employer_name": profile.name,
      "employer_function": profile.companyFunction,
      "employer_city": profile.city,
      "employer_sub_city": profile.sub_string,
      "user": id,
      "image": null
    };
    final response = await http.post(
      Uri.parse(baseUrlEmployerProfile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    print(response.body);
    if (response.statusCode == 201) {
      return jsonEncode(response.body);
    } else {
      return 0;
    }
  }
}

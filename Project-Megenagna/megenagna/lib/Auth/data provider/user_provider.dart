import 'dart:convert';

import 'package:megenagna/Auth/models/user.dart';
import 'package:http/http.dart' as http;

final String baseUrlEmployee = 'localhost:8000/api/v1/model/EmployeeUser';
final String baseUrlEmployer = 'localhost:8000/api/v1/model/EmployerUser';

class UserProvider {
  Future<User> createUser(User user) async {
    if (user.type == 0) {
      final response = await http.post(
        Uri.parse(baseUrlEmployee),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.jsonify(user)),
      );
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load course');
      }
    } else {
      final response = await http.post(
        Uri.parse(baseUrlEmployer),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.jsonify(user)),
      );
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load course');
      }
    }
  }
}

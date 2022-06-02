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
        body: jsonEncode(user.jsonify()),
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
        body: jsonEncode(user.jsonify()),
      );
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load course');
      }
    }
  }

  Future<User> getUser(String id) async {
    final response = await http.get(Uri.parse('$baseUrlEmployee/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load course');
    }
  }

  Future<void> deleteUser(User user) async {
    if (user.type == 0) {
      final http.Response response = await http.delete(
        Uri.parse('$baseUrlEmployee/${user.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 204) {
        throw Exception('Failed to delete course.');
      }
    } else {
      final http.Response response = await http.delete(
        Uri.parse('$baseUrlEmployer/${user.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode != 204) {
        throw Exception('Failed to delete course.');
      }
    }
  }

  Future<void> updateUser(User user) async {
    if (user.type == 0) {
      final http.Response response = await http.put(
        Uri.parse('$baseUrlEmployer/${user.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.jsonify()),
      );
      if (response.statusCode != 204) {
        throw Exception('Failed to load course');
      }
    } else {
      final http.Response response = await http.put(
        Uri.parse('$baseUrlEmployee/${user.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.jsonify()),
      );
      if (response.statusCode != 204) {
        throw Exception('Failed to load course');
      }
    }
  }
}

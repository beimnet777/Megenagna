import 'dart:convert';
import 'package:last/Auth/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/Auth/models/user.dart';
import 'package:http/http.dart' as http;

final String baseUrlEmployee =
    'http://127.0.0.1:8000/api/v1/model/EmployeeUser/';
final String baseUrlEmployer =
    'http://127.0.0.1:8000/api/v1/model/EmployerUser/';
final String baseUrlEmployeeLogin = 'http://127.0.0.1:8000/auth/api/token/';
final String baseUrlGetUser = 'http://127.0.0.1:8000/userInfo/';

class UserProvider {
  Future createUser(User user) async {
    Map data = {
      "first_name": user.username,
      "last_name": user.password,
      "email": user.first_name,
      "username": user.last_name,
      "password": user.email
    };
    if (user.type == 1) {
      var body = json.encode(data);
      final response = await http.post(
        Uri.parse(baseUrlEmployee),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return 0;
      }
    } else {
      final response = await http.post(
        Uri.parse(baseUrlEmployer),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        
        return 0;
      }
    }
  }

  Future<User> getUser(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrlEmployee/$id'),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load course');
    }
  }

  Future getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('$baseUrlGetUser'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    });
   

    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
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
        body: jsonEncode(user.toJson()),
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
        body: jsonEncode(user.toJson()),
      );
      if (response.statusCode != 204) {
        throw Exception('Failed to load course');
      }
    }
  }

  Future loging(Login login) async {
    final http.Response response = await http.post(
        Uri.parse(baseUrlEmployeeLogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": login.username.toString(),
          "password": login.password.toString()
        }));

    if (response.statusCode == 200) {
      

      return (jsonDecode(response.body));
    } else {
      // print(jsonDecode(response.body));

      return 0;
    }
  }
}

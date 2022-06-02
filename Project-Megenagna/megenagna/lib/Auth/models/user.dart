import 'package:flutter/material.dart';

class User {
  final int id;
  final String username;
  final String password;
  final String first_name;
  final String last_name;
  final String email;
  int type;

  User(this.id, this.username, this.password, this.first_name, this.last_name,
      this.email,
      {this.type = 0});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['username'],
      json['password'],
      json['first_name'],
      json['last_name'],
      json['email'],
    );
  }

  Map<String, String> jsonify(User user) {
    return <String, String>{
      'username': user.username,
      'password': user.password,
      'first_name': user.first_name,
      'last_name': user.last_name,
      'email': user.email
    };
  }
}

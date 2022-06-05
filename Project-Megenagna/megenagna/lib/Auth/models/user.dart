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
      this.email, this.type);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['username'],
      json['password'],
      json['first_name'],
      json['last_name'],
      json['email'],
      0,
    );
  }

  Map<String, String> toJson() => {
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'username': username,
        'password': password,
      };
}

class UserData {
  final String username;
  final String password;
  final int type;
  UserData(this.username, this.password, {this.type = 0});
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(json['username'], json['password']);
  }

  Map<String, String> toJson() => {'username': username, 'password': password};
}

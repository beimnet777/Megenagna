import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Employer {
  final int id;
  final String firstName;
  final String lastName;

  Employer(this.id, this.firstName, this.lastName);

  factory Employer.fromJson(json) {
    Map<String, dynamic> newJson = jsonDecode(json);

    var tempid = newJson['id'];
    var tempFName = newJson['first_name'];
    var tempLName = newJson['last_name'];

    Employer employer = Employer(tempid, tempFName, tempLName);
    return employer;
  }
}

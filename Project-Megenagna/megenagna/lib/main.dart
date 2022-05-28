import 'package:flutter/material.dart';
import 'package:megenagna/ui/ProfileUpdate.dart';
import 'package:megenagna/ui/companyProfile.dart';
import 'package:megenagna/ui/Home.dart';
import 'package:megenagna/ui/Profile.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileUpdate(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Inter',
    ),
  ));
}

import 'package:flutter/material.dart';
import 'package:megenagna/companyProfile.dart';
import 'package:megenagna/ui/Home.dart';
import 'package:megenagna/ui/Profile.dart';

void main() {
  runApp(MaterialApp(
    home: CompanyProfile(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Inter',
    ),
  ));
}

import "package:charts_flutter/flutter.dart" as charts;
import 'package:flutter/material.dart';

//class for instantiation of Gpa data from the API
class Gpa {
  final int count;
  final String range;
  final charts.Color barcolor = charts.ColorUtil.fromDartColor(Colors.blue);

  Gpa(this.count, this.range);
}

import 'package:flutter/material.dart';
import '../models/stat/GPA.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//class that returns the Gpa bar chart depending of the gpa distibution of its users
class GpaChart extends StatelessWidget {
  final List<Gpa> data = [
    Gpa(50, "2.5-3"),
    Gpa(70, "3-3.9"),
    Gpa(20, "3.5-4"),
  ];
  // GpaChart(this.data);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Gpa, String>> series = [
      charts.Series(
        id: "GPAS",
        data: data,
        domainFn: (Gpa series, _) => series.range,
        measureFn: (Gpa series, _) => series.count,
      )
    ];
    return charts.BarChart(series, animate: true);
  }
}



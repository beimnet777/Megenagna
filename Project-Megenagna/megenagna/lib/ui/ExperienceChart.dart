import 'package:flutter/material.dart';
import './stat/Experience.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//clasas constructs the barchart fom the Experience of users that applied for that specific job
class ExperienceChart extends StatelessWidget {
  final List<Experience> data = [
    Experience(10, 1),
    Experience(20, 2),
    Experience(4, 3),
    Experience(30, 4),
    Experience(11, 5),
    Experience(15, 6),
    Experience(5, 7),
    Experience(21, 8),
    Experience(12, 9),
    Experience(13, 10),
    Experience(10, 11),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Experience, String>> series = [
      charts.Series(
          data: data,
          id: "Expreience",
          domainFn: (Experience series, _) => (series.year).toString(),
          measureFn: (Experience series, _) => series.count)
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}

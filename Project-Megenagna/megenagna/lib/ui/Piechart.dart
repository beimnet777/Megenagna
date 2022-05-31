import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './stat/Gender.dart';

//This constructs the pie chart by the amount of male and females that applied for the job
class PieChart extends StatelessWidget {
  final List<Gender> data = [
    Gender(50, "Male", charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    Gender(70, "Female",
        charts.ColorUtil.fromDartColor(Color.fromRGBO(95, 217, 255, 1))),
  ];
  // GpaChart(this.data);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Gender, String>> series = [
      charts.Series(
        id: "Gender",
        data: data,
        domainFn: (Gender series, _) => series.gender,
        measureFn: (Gender series, _) => series.count,
        colorFn: (Gender series, _) => series.pieColor,
      )
    ];
    return charts.PieChart(
      series,
      animate: true,
    );
  }
}

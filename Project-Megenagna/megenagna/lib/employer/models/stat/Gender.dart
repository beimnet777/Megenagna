import 'package:charts_flutter/flutter.dart' as charts;

//class thats constructes gender data from for the the piechart
class Gender {
  final int count;
  final String gender;
  final charts.Color pieColor;

  Gender(this.count, this.gender, this.pieColor);
}

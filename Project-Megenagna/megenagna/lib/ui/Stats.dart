import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:megenagna/ui/ExperienceChart.dart';
import 'package:megenagna/ui/GpaChar.dart';
import 'package:megenagna/ui/Piechart.dart';
import './stat/GPA.dart';

//this builds the custom widget tree for the specific job applied
class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Application Statistics",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.white,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView(
              children: [
                /**
                 * The below padding widget contains a paddint widget with all sided padding
                 * with 10 pixels
                 * The PADDING widget then contains a CARD widget with an elevation of 10
                 * Under the padding there is the COLUMN class which contains a ROW and a CONTAINER widget
                 * The ROW widget contains the title of the chart with expanded widgets both to left and to the right to center the widget
                 * The final COLUMN widget calls the GpaChart() class which will generate the barchart which will be displayed
                 */
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(//The Card widget starts here, More desciption of container above
                    elevation: 10,
                    child: Column(//Column widget starts here, More desciption of container above
                      children: [// Children of the column widget
                        Row(//Row widget starts here, More desciption of container above
                          children: [// childrens of the Row widget above
                            Expanded(child: Container()),//Expanded widget used to center the text below
                            Text("GPA Distribution"),// Text widget that contains the title of the card
                            Expanded( // Expanded widget to center the above text widget
                              child: Container(),
                            )
                          ],
                        ),
                        Container(height: 200, width: 400, child: GpaChart()),// container that contains the class call for the GpaChart widget tree
                      ],
                    ),
                  ),
                ),
                /**
                 * The below padding widget contains a paddint widget with all sided padding
                 * with 10 pixels
                 * The PADDING widget then contains a CARD widget with an elevation of 10
                 * Under the padding there is the COLUMN class which contains a ROW and a CONTAINER widget
                 * The ROW widget contains the title of the chart with expanded widgets both to left and to the right to center the widget
                 * the next Row child contains keys for the below Pie chart
                 * The final COLUMN widget calls the PieChart() class which will generate the barchart which will be displayed
                 */
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text("Gender Distribution"),
                            Expanded(
                              child: Container(),
                            )
                          ],
                        ),
                        Row(children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            child: Text("Male"),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(95, 217, 255, 1)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 0),
                            child: Text("Female"),
                          ),
                        ]),
                        Container(height: 200, width: 400, child: PieChart()),
                      ],
                    ),
                  ),
                ),
                /**
                 * The below padding widget contains a paddint widget with all sided padding
                 * with 10 pixels
                 * The PADDING widget then contains a CARD widget with an elevation of 10
                 * Under the padding there is the COLUMN class which contains a ROW and a CONTAINER widget
                 * The ROW widget contains the title of the chart with expanded widgets both to left and to the right to center the widget
                 * The final COLUMN widget calls the ExpreinceaChart() class which will generate the barchart which will be displayed
                 */
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Text("GPA Distribution"),
                            Expanded(
                              child: Container(),
                            )
                          ],
                        ),
                        Container(
                            height: 200, width: 400, child: ExperienceChart()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

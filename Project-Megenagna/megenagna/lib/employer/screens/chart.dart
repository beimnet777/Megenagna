import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Chart extends StatelessWidget {
  final String title = "The Last Chart";
  final List<dynamic> data = [
    ["2.2-2", 5],
    ["3-3.5", 40],
    ["3.5-3.7", 22],
    ["3.7-4", 33]
  ];

  int findtotal() {
    int total = 0;
    for (int i = 0; i < data.length; i++) {
      var val = data[i];
      int num = val[1];
      total = total + num;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Column(children: [
        Row(children: [
          Expanded(
            child: Container(),
          ),
          Text(title),
          Expanded(
            child: Container(),
          )
        ]),
        Container(
            height: findtotal().toDouble() + 20,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                print(index);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 10,
                      height: (data[index][1] / data.length) * 10,
                      color: Colors.blue,
                    ),
                    Text(data[index][0])
                  ],
                );
              },
            )),
      ]),
    ));
  }
}

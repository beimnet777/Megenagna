import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(13)),
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.search),
                  Container(
                    padding: EdgeInsets.only(bottom: 7, left: 5),
                    width: 180,
                    height: 25,
                    child: TextField(
                      style: TextStyle(fontSize: 11),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'search here...'),
                    ),
                  ),
                ],
              )),
          InkWell(
            onTap: (() {}),
            child: CircleAvatar(
              radius: 20,
              foregroundImage: AssetImage("assets/photo01.jpg"),
            ),
          )
        ],
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 5),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(218, 232, 255, 1)),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Pending"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 5),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(230, 255, 210, 1)),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Accepted"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 5),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 167, 117, 1)),
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Denied"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      SizedBox(height: 15),
      Expanded(
        child: Container(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                      color: _colorPicker(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 20,
                                foregroundImage: AssetImage(
                                    "assets/photo01.jpg"), //insert logo of company
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "MYNERGY",
                                style: TextStyle(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 120,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue[700]),
                                child: Center(
                                    child: Text(
                                  "Full Time",
                                  style: TextStyle(color: Colors.white),
                                )), //full time or partime info,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Mechanic"), //job title here
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                    ),
                                  ],
                                ),
                                Text("12,000 - 15,000 ETB per month"), //payment
                                Text("Education level: Bachelor"), // edu level
                                Text("Experience: 2 years"), //experience
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      )
    ]));
  }

  _colorPicker(int index) {
    return index % 3 == 1
        ? Color.fromRGBO(218, 232, 255, 1)
        : index % 3 == 2
            ? Color.fromRGBO(230, 255, 210, 1)
            : Color.fromRGBO(255, 167, 117, 1);
  }
}

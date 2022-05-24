import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pressAttention = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
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
                                  border: InputBorder.none,
                                  hintText: 'search here...'),
                            ),
                          ),
                        ],
                      )),
                  CircleAvatar(
                    radius: 20,
                    foregroundImage: AssetImage("../assets/photo01.jpg"),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, //insert number of fields
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 0, top: 5),
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 159, 36, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        onTap: () =>
                            setState(() => pressAttention = !pressAttention),
                        // hoverColor: Colors.orangeAccent,
                        // highlightColor: Colors.orange[800],
                        child: Center(
                            child: Text("Some field")), //insert field name here
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.755,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.only(bottom: 15, left: 15, right: 15),
                        color: Color.fromRGBO(245, 222, 183, 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  foregroundImage: AssetImage(
                                      "../assets/photo01.jpg"), //insert logo of company
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                      ),
                                      Container(
                                        width: 120,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.blue[700]),
                                        child: Center(
                                            child: Text(
                                          "Full Time",
                                          style: TextStyle(color: Colors.white),
                                        )), //full time or partime info
                                      )
                                    ],
                                  ),
                                  Text(
                                      "12,000 - 15,000 ETB per month"), //payment
                                  Text(
                                      "Education level: Bachelor"), // edu level
                                  Text("Experience: 2 years"), //experience
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                InkWell(
                                  child: Text(
                                    "APPLY NOW",
                                    style: TextStyle(
                                        color: Colors.blue[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.4),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                InkWell(
                                  child: Text(
                                    "MORE >>",
                                    style: TextStyle(
                                        color: Colors.blue[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.window_outlined), label: "idk"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ]),
      ),
    );
  }
}

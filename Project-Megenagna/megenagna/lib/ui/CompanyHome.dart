import 'package:flutter/material.dart';
import 'package:megenagna/ui/Applicants.dart';
import 'package:megenagna/ui/Apply.dart';

class CompanyHome extends StatelessWidget {
  const CompanyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Row(
          children: [
            CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage("assets/photo01.jpg"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Company Name",
            ),
          ],
        ),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            onPressed: () {
              //add the new AD adder form here and go route
              // Navigator.push(
              //     context, MaterialPageRoute(builder: ((context) => Apply())));
            },
            icon: Icon(Icons.add),
            iconSize: 30,
          )
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisSpacing: 40,
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 1),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.blue[700]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("456 Applicants")
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            height: 1,
            decoration: BoxDecoration(color: Colors.blue[700]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Released ADs",
                    style: TextStyle(fontSize: 25.4, color: Colors.blue[700]),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Expanded(
                      child: InkWell(
                        onTap: (() {
                          //convert to go router
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ApplicantsList())));
                        }),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Card(
                            elevation: 5,
                            margin: EdgeInsets.only(
                                bottom: 15, left: 15, right: 15),
                            color: Color.fromRGBO(245, 222, 183, 1),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Mechanic"), //job title here
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                          ),
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
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      )),
    );
  }
}

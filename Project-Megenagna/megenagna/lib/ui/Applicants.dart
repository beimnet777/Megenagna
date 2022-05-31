import 'package:flutter/material.dart';

class ApplicantsList extends StatelessWidget {
  const ApplicantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text("Mechanic applicants"), //applicants of what field??
        ),
        body: Container(
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(
                          bottom: 15, left: 15, right: 15, top: 5),
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
                                "Applicant name", //applicant name
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
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Education level: Bachelor"), // edu level
                                    Text("Experience: 2 years"), //experience
                                  ],
                                ),
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
        ));
  }
}

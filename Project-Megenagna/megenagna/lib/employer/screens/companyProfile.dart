import 'package:flutter/material.dart';
import 'Applicants.dart';

class CompanyProfile extends StatefulWidget {
  @override
  State<CompanyProfile> createState() => CompanyProfile_State();
}

class CompanyProfile_State extends State<CompanyProfile> {
  static const IconData drive_file_rename_outline_outlined =
      IconData(0xeff9, fontFamily: "MaterialIcons");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "MYNERGY",
        //   style: TextStyle(color: Colors.black),
        // ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return ApplicantsList();
                })));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back_ios_new_sharp)),
                  Expanded(child: Container()),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        drive_file_rename_outline_outlined,
                        size: 25,
                      ))
                ],
              ),
              Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/discover.jpg",
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 8,
                        spreadRadius: 6,
                        offset: const Offset(0, 0),
                      )
                    ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "MYNERGY PLC.",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                        Container(
                          child: Text(
                            "adslf hsalk dh fkl ashd flkas hdfkl ahskldf haslkfdhkl asdhjfkl haslkdjf hlaskhfdkl sdfasifhaio shfiohsdfoi ahsdifhasih fioahsfio hasidfhiasuh fidsuhfi o.",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Text("asdfhjg@afihi.com"),
                        Text("Location Goes here"),
                        Text("+251835408625"),
                        Container(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/discover.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 3, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: Image.asset(
                            "assets/discover.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Image.asset(
                            "assets/discover.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Image.asset(
                            "assets/discover.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/discover.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset(
                          "assets/discover.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

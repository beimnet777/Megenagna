import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue[800],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            SizedBox(height: 35),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("../assets/photo01.jpg")),
                    borderRadius: BorderRadius.circular(40)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 21.95,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "jo2345",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "4 Years Experience",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ]),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.mail_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text("Masters of Civil Engineering"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.mail_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text("Masters of Civil Engineering"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.mail_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text("Masters of Civil Engineering"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.mail_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text("Masters of Civil Engineering"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.mail_outlined,
                            size: 40,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text("Masters of Civil Engineering"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      context.go("/profileUpdate");
                    },
                    icon: Icon(Icons.edit))
              ],
              backgroundColor: Colors.blue[800]),
        ),
        body: Container(
          color: Colors.blue[800],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 130,
                width: 130,
                child: ClipRRect(
                  //this widget contains the image thats is shaped circular
                  child: Image.asset(
                    "assets/photo01.jpg",
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(65),
                ),
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
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "jo2345",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
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

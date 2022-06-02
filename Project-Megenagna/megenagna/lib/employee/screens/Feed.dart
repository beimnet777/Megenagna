import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Apply.dart';
import '../../employer/screens/companyProfile.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      padding: EdgeInsets.only(left: 5),
                      width: 180,
                      height: 25,
                      child: TextField(
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'search here...'),
                      ),
                    ),
                  ],
                )),
            InkWell(
              onTap: (() {
                context.go("/user/profile");
              }),
              child: CircleAvatar(
                radius: 20,
                foregroundImage: AssetImage("assets/photo01.jpg"),
              ),
            )
          ],
        ),
        SizedBox(height: 5),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 35,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 10, //insert number of fields
        //     itemBuilder: (BuildContext context, int index) {
        //       return Container(
        //         margin:
        //             EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
        //         width: 150,
        //         decoration: BoxDecoration(
        //             color: Color.fromRGBO(233, 159, 36, 1),
        //             borderRadius: BorderRadius.circular(15)),
        //         child: InkWell(
        //           onTap: () {},
        //           child: Center(
        //               child: Text("Some field")), //insert field name here
        //         ),
        //       );
        //     },
        //   ),
        // ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: InkWell(
                      // onTap: () {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) {
                      //     return CompanyProfile();
                      //   }));
                      // },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Card(
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
                                  InkWell(
                                    onTap: () {
                                      context.go("/company/profile");
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      foregroundImage: AssetImage(
                                          "assets/photo01.jpg"), //insert logo of company
                                    ),
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
                              Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        context.go('/apply');
                                      },
                                      child: Text(
                                        "APPLY NOW",
                                        style: TextStyle(
                                            color: Colors.blue[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.4),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        context.go('/more');
                                      },
                                      child: Text(
                                        "MORE >>",
                                        style: TextStyle(
                                            color: Colors.blue[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

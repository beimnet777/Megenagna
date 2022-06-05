import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/profile_updater_bloc.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/save_state.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    context.go("/user/home/profile/profileUpdate");
                  },
                  icon: Icon(Icons.edit))
            ],
            backgroundColor: Colors.blue[800]),
        body: BlocBuilder<ProfileUpdaterBloc, SaveState>(
          builder: (context, state) {
            if (state is Loading) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else if (state is LoadFailed) {
              return Container(
                child: Center(
                  child: Text(
                      "No Profile Created please press the edit button to create one!"),
                ),
              );
            } else if (state is Loaded) {
              return Container(
                color: Colors.blue[800],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                              ("${state.employee.employee_name}"),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${state.employee.employee_specialization}",
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
                              "${state.employee.employee_degree_name}",
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
                                Text(
                                    "Degree in: ${state.employee.employee_degree_name}"),
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
                                Text(
                                    "Cumilative GPA: ${state.employee.employee_gpa}"),
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
                                Text(
                                    "${state.employee.employee_age} years of Age"),
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
                                Text("${state.employee.employee_description}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              );
            } else {
              return Text("should never happen");
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/blocs/apply_bloc/apply_bloc.dart';
import 'package:last/employee/blocs/apply_bloc/apply_state.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/profile_updater_bloc.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/save_event.dart';
import 'Apply.dart';
import '../../employer/screens/companyProfile.dart';

class newStatus extends StatelessWidget {
  newStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyBloc, ApplyState>(
      builder: (context, state) {
        if (state is LoadingApplication) {
          return Container(
            child: Center(
              child: Text("Loading..."),
            ),
          );
        } else if (state is LoadedApplication) {
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
                      BlocProvider.of<ProfileUpdaterBloc>(context)
                          .add(Load(id: 1));
                      context.go("/user/home/profile");
                    }),
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 20,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: state.jobs.length,
                      itemBuilder: (context, index) {
                        print(state.apps[index].user);
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
                                margin: EdgeInsets.only(
                                    bottom: 15, left: 15, right: 15),
                                color: (state.apps[index].status == 3)
                                    ? Color.fromRGBO(218, 232, 255, 1)
                                    : (state.apps[index].status == 1)
                                        ? Color.fromRGBO(230, 255, 210, 1)
                                        : Color.fromRGBO(255, 167, 117, 1),
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
                                            foregroundImage: AssetImage(state
                                                .jobs[index]
                                                .image), //insert logo of company
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          "${state.emps[index].firstName} ${state.emps[index].lastName}",
                                          style: TextStyle(
                                              color: Colors.blue[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 25),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(state.jobs[index]
                                                  .name), //job title here
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                              ),
                                            ],
                                          ),
                                          Text(
                                              "${state.jobs[index].job_salary} per month"), //payment
                                          Text(
                                              "Education level: ${state.jobs[index].skills_needed_1}"), // edu level
                                          Text(
                                              "Experience: ${state.jobs[index].job_experience_years} Years of experience"), //experience
                                          SizedBox(
                                            height: 15,
                                          )
                                        ],
                                      ),
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
        } else {
          return Container(
              color: Color.fromRGBO(245, 222, 183, 1),
              child: Center(child: Text("Please Choose field from below")));
        }
      },
    );
  }

  _colorPicker(int index) {
    return index % 3 == 1
        ? Color.fromRGBO(218, 232, 255, 1)
        : index % 3 == 2
            ? Color.fromRGBO(230, 255, 210, 1)
            : Color.fromRGBO(255, 167, 117, 1);
  }
}

// companyGetter(int id) async {
//   final Employer employer = await employerProvider.getEmployer(id);
//   return employer;
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/blocs/job_bloc/job_bloc.dart';
import 'package:last/employee/blocs/job_bloc/job_state.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/profile_updater_bloc.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/save_event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Apply.dart';
import '../../employer/screens/companyProfile.dart';

class Feed extends StatelessWidget {
  Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indexChecker = -1;
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        if (state is LoadingJobs) {
          return Container(
            child: Center(
              child: Text("Loading..."),
            ),
          );
        } else if(state is LoadingFailed){
          return Container(
            child: Center(
              child: Text("unable to load avialable Jobs. please reload.."),
            ),
          );
        }
        else if (state is LoadedJobs) {
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
                    onTap: (() async {
                      final prefs = await SharedPreferences.getInstance();
                      BlocProvider.of<ProfileUpdaterBloc>(context)
                          .add(Load(id: prefs.getInt('id')!));
                      context.go("/user/home/profile");
                    }),
                    child: CircleAvatar(
                      radius: 20,
                      foregroundImage: AssetImage("assets/photo01.jpg"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: state.jobs.length,
                      itemBuilder: (context, index) {
                        print(state.emps.length);
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
                                            context.go("/company/home/profile");
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
                                              context.go('/user/home/apply/${state.jobs[index].id}');
                                              
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
        } else {
          return Container(
              color: Color.fromRGBO(245, 222, 183, 1),
              child: Center(child: Text("Please Choose field from below")));
        }
      },
    );
  }
}

// companyGetter(int id) async {
//   final Employer employer = await employerProvider.getEmployer(id);
//   return employer;
// }

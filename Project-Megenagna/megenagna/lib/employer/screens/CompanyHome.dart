import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employer/blocs/applicantsbloc/applicantsbloc.dart';
// import 'package:last/employer/blocs/applicantsbloc/appplicantsstate.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeBloc.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blocs/applicantsbloc/applicantsevent.dart';
import 'Applicants.dart';
import 'stats.dart';

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
              context.go("/company/home/postAd");
            },
            icon: Icon(Icons.add),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              context.go('/');
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: BlocConsumer<CompanyHomeBloc, PageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is Loading) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                )),
              );
            } else if (state is Loaded) {
              print("it is here");
              return Container(
                // height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    itemCount: state.jobs.length,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: InkWell(
                          onTap: (() {
                            //convert to go router
                            BlocProvider.of<ApplicantsBloc>(context)
                                .add(LoadApplicants(state.jobs[index].id));
                            context.go(
                                "/company/home/applicants/${state.jobs[index].id}");
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
                                            "../../assets/photo01.jpg"), //insert logo of company
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                "Title:${state.jobs[index].name}"), //job title here
                                          ],
                                        ),
                                        Text(
                                            "Salary:${state.jobs[index].job_salary}"), //payment
                                        Text(
                                            "Education Level:${state.jobs[index].job_description}"), // edu level
                                        Text(
                                            "Experience:${state.jobs[index].job_experience_years}"), //experience
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is LoadingFailed) {
              return Center(
                child: Text(
                  "Loading Failed",
                  style: TextStyle(color: Colors.redAccent, fontSize: 20),
                ),
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}

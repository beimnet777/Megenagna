import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employer/blocs/applicantsbloc/applicantsbloc.dart';
import 'package:last/employer/blocs/applicantsbloc/appplicantsstate.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeEvent.dart';
import 'package:last/employer/blocs/statistics_bloc/statisticsbloc.dart';

import '../blocs/statistics_bloc/statisticsevent.dart';

class ApplicantsList extends StatelessWidget {
  final int num;
  ApplicantsList(this.num);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Mechanic applicants"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<StatBloc>(context).add(LoadEvent(num));
                  context.go("/company/home/applicants/${num}/stats");
                },
                icon: Icon(Icons.bar_chart)),
          )
        ], //applicants of what field??
      ),
      body: BlocConsumer<ApplicantsBloc, ApplicantsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingApplicants) {
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
            } else if (state is LoadedApplicants) {
              List applicants = state.applicants;
              return Container(
                padding: EdgeInsets.only(top: 15),
                child: ListView.builder(
                    itemCount: applicants.length,
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
                                      "Applicant", //applicant name
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Education Level: ${state.applicants[index].degree}"),
                                          Text(
                                              "GPA: ${state.applicants[index].gpa.toString()}"), // edu level
                                          Text(
                                              "Experience years: ${state.applicants[index].app_experience_years.toString()}"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.green[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: InkWell(
                                                  onTap: () {
                                                    //set status to 1
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Accept",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 80,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.green[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: InkWell(
                                                  onTap: () {
                                                    //set status to 2
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      "Deny",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
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
              );
            } else if (state is LoadingFailed) {
              return Center(
                child: Text(
                  "Failed to Load the Applicants",
                  style: TextStyle(color: Colors.redAccent, fontSize: 15),
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
          }),
    );
  }
}

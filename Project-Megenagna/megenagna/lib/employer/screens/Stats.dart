import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employer/blocs/statistics_bloc/statisticsbloc.dart';
import 'package:last/employer/blocs/statistics_bloc/statisticsstate.dart';

import 'chart.dart';
// import 'ExperienceChart.dart';
// import 'GpaChar.dart';
// import 'Piechart.dart';
// import '../models/stat/GPA.dart';

//this builds the custom widget tree for the specific job applied
class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Application Statistics",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          body: Container(
            child: BlocConsumer<StatBloc, StatState>(
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
                }
                var data;
                if (state is Loaded) {
                  data = state.data;
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width * 1,
                      color: Colors.white,
                      child: ListView(
                        children: [
                          Card(
                            child: Container(
                              height: 200,
                              child: Column(children: [
                                Row(children: [
                                  Expanded(child: Container()),
                                  Text("Age Distribution"),
                                  Expanded(
                                    child: Container(),
                                  )
                                ]),
                                Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Container(
                                      height: (state.data['age_18_29'] +
                                              state.data['age_30_50'] +
                                              state.data['age_51']) +
                                          150,
                                      child: Row(children: [
                                        Container(
                                          width: 70,
                                          height: (state.data['age_18_29'] +
                                                  state.data['age_30_50'] +
                                                  state.data['age_51']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data[
                                                                    'age_18_29'] +
                                                                1) /
                                                            (state.data[
                                                                    'age_30_50'] +
                                                                state.data[
                                                                    'age_18_29'] +
                                                                state.data[
                                                                    'age_51'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                width: 15,
                                                color: Colors.blue,
                                              ),
                                              Text("18 - 29")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 70,
                                          height: (state.data['age_18_29'] +
                                                  state.data['age_30_50'] +
                                                  state.data['age_51']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data[
                                                                    'age_30_50'] +
                                                                1) /
                                                            (state.data[
                                                                    'age_30_50'] +
                                                                state.data[
                                                                    'age_18_29'] +
                                                                state.data[
                                                                    'age_51'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                color: Colors.blue,
                                                width: 15,
                                              ),
                                              Text("30 - 50")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 70,
                                          height: (state.data['age_18_29'] +
                                                  state.data['age_30_50'] +
                                                  state.data['age_51']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data['age_51'] +
                                                                1) /
                                                            (state.data[
                                                                    'age_30_50'] +
                                                                state.data[
                                                                    'age_18_29'] +
                                                                state.data[
                                                                    'age_51'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                width: 15,
                                                color: Colors.blue,
                                              ),
                                              Text(">51")
                                            ],
                                          ),
                                        )
                                      ]),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: Container(
                              height: 200,
                              child: Column(children: [
                                Row(children: [
                                  Expanded(child: Container()),
                                  Text("Gender Distribution"),
                                  Expanded(
                                    child: Container(),
                                  )
                                ]),
                                Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Container(
                                      height: (state.data['experience_0_2'] +
                                              state.data['experience_2_5'] +
                                              state.data['experience_6']) +
                                          150,
                                      child: Row(children: [
                                        Container(
                                          width: 70,
                                          height: (state.data['male'] +
                                                  state.data['female']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data['female'] +
                                                                1) /
                                                            (state.data[
                                                                    'male'] +
                                                                state.data[
                                                                    'female'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                color: Colors.blue,
                                                width: 15,
                                              ),
                                              Text("Female")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 70,
                                          height: (state.data['male'] +
                                                  state.data['female']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data['male'] +
                                                                1) /
                                                            (state.data[
                                                                    'male'] +
                                                                state.data[
                                                                    'female'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                color: Colors.blue,
                                                width: 15,
                                              ),
                                              Text("Male")
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: Container(
                              height: 200,
                              child: Column(children: [
                                Row(children: [
                                  Expanded(child: Container()),
                                  Text("Experience Distribution"),
                                  Expanded(
                                    child: Container(),
                                  )
                                ]),
                                Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Container(
                                      height: (state.data['experience_0_2'] +
                                              state.data['experience_2_5'] +
                                              state.data['experience_6']) +
                                          150,
                                      child: Row(children: [
                                        Container(
                                          width: 70,
                                          height: (state
                                                      .data['experience_0_2'] +
                                                  state.data['experience_2_5'] +
                                                  state.data['experience_6']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data[
                                                                    'experience_0_2'] +
                                                                1) /
                                                            (state.data[
                                                                    'experience_0_2'] +
                                                                state.data[
                                                                    'experience_2_5'] +
                                                                state.data[
                                                                    'experience_6'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                width: 15,
                                                color: Colors.blue,
                                              ),
                                              Text("0-2 Years")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 70,
                                          height: (state
                                                      .data['experience_0_2'] +
                                                  state.data['experience_2_5'] +
                                                  state.data['experience_6']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data[
                                                                    'experience_2_5'] +
                                                                1) /
                                                            (state.data[
                                                                    'experience_0_2'] +
                                                                state.data[
                                                                    'experience_2_5'] +
                                                                state.data[
                                                                    'experience_6'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                color: Colors.blue,
                                                width: 15,
                                              ),
                                              Text("2-5 Years")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 70,
                                          height: (state
                                                      .data['experience_0_2'] +
                                                  state.data['experience_2_5'] +
                                                  state.data['experience_6']) +
                                              100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                height: ((state.data[
                                                                    'experience_6'] +
                                                                1) /
                                                            (state.data[
                                                                    'experience_0_2'] +
                                                                state.data[
                                                                    'experience_2_5'] +
                                                                state.data[
                                                                    'experience_6'] +
                                                                1)) *
                                                        10 +
                                                    2,
                                                width: 15,
                                                color: Colors.blue,
                                              ),
                                              Text(">5 years")
                                            ],
                                          ),
                                        )
                                      ]),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  Row(children: [
                                    Expanded(child: Container()),
                                    Text("GPA Distribution"),
                                    Expanded(
                                      child: Container(),
                                    )
                                  ]),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      Container(
                                        height: (state.data['gpa_3_5_4'] +
                                                state.data['gpa_3_3_5'] +
                                                state.data['gpa_3']) +
                                            150,
                                        child: Row(children: [
                                          Container(
                                            width: 70,
                                            height: (state.data['gpa_3_5_4'] +
                                                    state.data['gpa_3_3_5'] +
                                                    state.data['gpa_3']) +
                                                100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: ((state.data[
                                                                      'gpa_3_5_4'] +
                                                                  1) /
                                                              (state.data[
                                                                      'gpa_3_5_4'] +
                                                                  state.data[
                                                                      'gpa_3_3_5'] +
                                                                  state.data[
                                                                      'gpa_3'] +
                                                                  1)) *
                                                          10 +
                                                      2,
                                                  width: 15,
                                                  color: Colors.blue,
                                                ),
                                                Text("3.5-4.0")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            height: (state.data['gpa_3_5_4'] +
                                                    state.data['gpa_3_3_5'] +
                                                    state.data['gpa_3']) +
                                                100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: ((state.data[
                                                                      'gpa_3_3_5'] +
                                                                  1) /
                                                              (state.data[
                                                                      'gpa_3_5_4'] +
                                                                  state.data[
                                                                      'gpa_3_3_5'] +
                                                                  state.data[
                                                                      'gpa_3'] +
                                                                  1)) *
                                                          10 +
                                                      2,
                                                  color: Colors.blue,
                                                  width: 15,
                                                ),
                                                Text("3.0-3.5")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            height: (state.data['gpa_3_5_4'] +
                                                    state.data['gpa_3_3_5'] +
                                                    state.data['gpa_3']) +
                                                100,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: ((state.data[
                                                                      'gpa_3'] +
                                                                  1) /
                                                              (state.data[
                                                                      'gpa_3_5_4'] +
                                                                  state.data[
                                                                      'gpa_3_3_5'] +
                                                                  state.data[
                                                                      'gpa_3'] +
                                                                  1)) *
                                                          10 +
                                                      2,
                                                  width: 15,
                                                  color: Colors.blue,
                                                ),
                                                Text("<3.0")
                                              ],
                                            ),
                                          )
                                        ]),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ));
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
          )),
    );
  }
}

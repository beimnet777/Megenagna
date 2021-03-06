import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/models/applications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import '../../employer/screens/companyProfile.dart';

import '../blocs/apply_bloc/apply_bloc.dart';
import '../blocs/apply_bloc/apply_event.dart';
import '../blocs/apply_bloc/apply_state.dart';

class Apply extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final genderCtrl = TextEditingController();
  final degreeCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final expCtrl = TextEditingController();
  final gpaCtrl = TextEditingController();
  final int num;
  Apply(this.num);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Now!"),
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage("assets/photo01.jpg"),
                        fit: BoxFit.cover))),
            SizedBox(
              height: 30,
            ),
            Text(
              "Job Title",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "A retail salesperson assists customers in making purchases, including processing payments. This type of position exists in a wide variety of businesses that sell merchandise directly to customers, such as furniture, clothing, cars and equipment. Creating a strong job description is essential to defining the responsibilities of this role within your organization and determining the requirements for a candidate."), //insert job title here
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: Column(children: [
                    TextFormField(
                      controller: genderCtrl,
                      decoration: InputDecoration(label: Text("Gender(M/F):")),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Gender is required";
                        } else {
                          return null;
                        }
                      },
                    ), //Gender from here
                    TextFormField(
                      controller: degreeCtrl,
                      decoration: InputDecoration(label: Text("Degree:")),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Degree is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: ageCtrl,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(label: Text("Age:")),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Age is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: gpaCtrl,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(label: Text("GPA:")),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "GPA is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: expCtrl,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration:
                          InputDecoration(label: Text("Experience(in years):")),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Experience is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<ApplyBloc, ApplyState>(
                      builder: (context, state) {
                        String adaptiveText = "Apply";

                        if (state is Saving) {
                          adaptiveText = "Applying...";
                        } else if (state is ApplyFailed) {
                          adaptiveText = "failed";
                        }

                        return InkWell(
                            onTap: () async {
                              final formValid =
                                  _formKey.currentState!.validate();
                              if (!formValid) {
                                return;
                              }
                              final prefs =
                                  await SharedPreferences.getInstance();
                              // print("inAplyyyyyyyyyyyyyyyyyyyyy");
                              // print(prefs.getInt('id'));
                              // print("inAplyyyyyyyyyyyyyyyyyyyyy");
                              print(
                                  "#################################################");
                              print(num);
                              print(
                                  "#################################################");

                              final Application app = Application(
                                  int.parse(expCtrl.text),
                                  int.parse(gpaCtrl.text),
                                  degreeCtrl.text,
                                  genderCtrl.text,
                                  int.parse(ageCtrl.text),
                                  3,
                                  num,
                                  prefs.getInt('id'));
                              BlocProvider.of<ApplyBloc>(context)
                                  .add(ApplyEvent(app));
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[700]),
                              child: Center(
                                child: Text(
                                  "$adaptiveText",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ));
                      },
                      listenWhen: (p, c) {
                        return c is ApplySuccesfull;
                      },
                      listener: (BuildContext context, Object? state) {
                        context.go('/user/home');
                      },
                    ),

                    SizedBox(
                      height: 10,
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

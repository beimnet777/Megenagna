import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeBloc.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeEvent.dart';
import 'package:last/employer/blocs/post_blocs/postState.dart';
import 'package:last/employer/blocs/post_blocs/post_event.dart';
import 'package:last/employer/blocs/post_blocs/postbloc.dart';
import 'package:last/employer/blocs/statistics_bloc/statisticsstate.dart';

class PostAd extends StatelessWidget {
  TextEditingController nameControler = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController jobBenefitController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController skillController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST AD"),
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameControler,
                      decoration: InputDecoration(
                        hintText: "Job Title",
                      ),
                      validator: (String? name) {
                        if (name == null || name.isEmpty) {
                          return "Job title can not be null";
                        }
                      },
                    ),
                    TextFormField(
                        controller: experienceController,
                        decoration: InputDecoration(
                          hintText: "Experience",
                        ),
                        validator: (String? experiance) {
                          if (experiance == null || experiance.isEmpty) {
                            return "Expected Experience can not be null";
                          }
                        }),
                    TextFormField(
                      controller: salaryController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Salary"),
                      validator: (String? salary) {
                        if (salary == null || salary.isEmpty) {
                          return "Salary can not be Empty";
                        }
                      },
                    ),
                    TextFormField(
                      controller: jobDescriptionController,
                      decoration: InputDecoration(hintText: "Job Benefits"),
                      validator: (String? jobBenefit) {
                        if (jobBenefit == null || jobBenefit.isEmpty) {
                          return "Job Benefit can not be empty";
                        }
                      },
                    ),
                    TextFormField(
                      controller: jobBenefitController,
                      decoration: InputDecoration(hintText: "Job Description"),
                      validator: (String? jobDescription) {
                        if (jobDescription == null || jobDescription.isEmpty) {
                          return "Job description can not be empty";
                        }
                      },
                    ),
                    TextFormField(
                      controller: skillController,
                      decoration: InputDecoration(hintText: "Skills required"),
                      validator: (String? skill) {
                        if (skill == null || skill.isEmpty) {
                          return "skill can not be empty";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Container(
                            width: 100,
                            child: BlocConsumer<PostBloc, PostState>(
                              listener: (context, state) {
                                if (state is Posted) {
                                  BlocProvider.of<CompanyHomeBloc>(context)
                                      .add(Opening());
                                  context.go("/company/home");
                                }
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<PostBloc>(context).add(
                                          PostPressed(
                                              nameControler.text,
                                              experienceController.text,
                                              salaryController.text,
                                              jobBenefitController.text,
                                              jobDescriptionController.text,
                                              skillController.text));
                                      final formValid =
                                          formKey.currentState!.validate();
                                      if (!formValid) {
                                        return;
                                      } else {}
                                    },
                                    child: Text("Post"));
                              },
                            )),
                        Expanded(child: Container())
                      ],
                    ),
                    BlocConsumer<PostBloc, PostState>(
                        builder: (context, state) {
                          if (state is PosteFailed) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  "Post Failed",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                              ],
                            );
                          }
                          return Row(children: []);
                        },
                        listener: (context, state) {})
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

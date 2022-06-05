import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/models/employee.dart';
// import 'blocs/profile _update_blocs/profile _update_blocs/profile_updater_bloc.dart';
import '../blocs/profile _update_blocs/save_event.dart';
import '../blocs/profile _update_blocs/profile_updater_bloc.dart';
import '../blocs/profile _update_blocs/save_event.dart';
import '../blocs/profile%20_update_blocs/save_state.dart';

import '../blocs/profile _update_blocs/profile_updater_bloc.dart';
import '../blocs/profile _update_blocs/save_event.dart';

class ProfileUpdate extends StatelessWidget {
  //controlers for the form are below this line
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final specController = TextEditingController();
  final descController = TextEditingController();
  final gpaController = TextEditingController();
  final degreeNameController = TextEditingController();
  final sexController = TextEditingController();
  //conterllers end here

  //form variables start here
  final name = "Belete Mamo";
  final age = "12";
  final specialization = "AI";
  final description = "asjdnsajdnas";
  final gpa = "3";
  final degree_name = "Masters";
  final sex = "male";
  final formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(elevation: 0, backgroundColor: Colors.blue[800]),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              // First Child of the container the top wigdet
              Container(
                //this container contains the blue widget on the screen with the image with 30% height
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.blue[800],
                child: Center(
                    child: Container(
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    //this widget contains the image thats is shaped circular
                    child: Image.asset(
                      "assets/photo01.jpg",
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                )),
              ),
              Form(
                key: formKey,
                child: Card(
                  elevation: 10,
                  child: Column(children: [
                    /** 
                             * NAME
                             * the next widget is the form field that containts the Name of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: name, //border: OutlineInputBorder()
                          ),
                          validator: (String? name) {
                            if (name == null || name.isEmpty) {
                              return "Name can not be empty";
                            }
                          },
                        ),
                      ),
                    ),
                    /**
                             * age NUMBER 
                             * the next widget is the form field that containts the age number of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: age,
                            // border: OutlineInputBorder()
                          ),
                          validator: (String? phone) {
                            if (age == null || age.isEmpty) {
                              return "age must not be empty";
                            }

                            // final ageTest =
                            //     RegExp("/^(^\+251|^251|^0)?9\d{8}\$/");
                            // final ageValid = ageTest.hasMatch(age);

                            // return ageValid
                            //     ? null
                            //     : "age number is incorrect";
                          },
                        ),
                      ),
                    ),
                    /** 
                             * age
                             * the next widget is the form field that containts the age of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: specController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: specialization,
                            // border: OutlineInputBorder()
                          ),
                          validator: (String? age) {
                            if (age == null || age.isEmpty) {
                              return "age can not be empty";
                            }

                            // bool ageValid = RegExp(
                            //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //     .hasMatch(age);
                            return null;
                            // ageValid ? null : "Invalied age address";
                          },
                        ),
                      ),
                    ),
                    /** 
                             * CITY
                             * the next widget is the form field that containts the living city of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: descController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText:
                                description, //border: OutlineInputBorder()
                          ),
                          validator: (String? cityName) {
                            if (cityName == null || cityName.isEmpty) {
                              return "City name should not be empty";
                            }
                          },
                        ),
                      ),
                    ),
                    /** 
                             * EDUCATION LEVEL
                             * the next widget is the form field that containts the Education level of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: gpaController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: gpa,
                            //border: OutlineInputBorder()
                          ),
                          validator: (String? educationLevel) {
                            if (educationLevel == null ||
                                educationLevel.isEmpty) {
                              return "Education Level should not be empty";
                            }
                          },
                        ),
                      ),
                    ),
                    /** 
                             * FIELD OF STUDY
                             * the next widget is the form field that containts the  field of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: degreeNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText:
                                degree_name, //border: OutlineInputBorder()
                          ),
                          validator: (String? field) {
                            if (field == null || field.isEmpty) {
                              return "Field of work should not be empty";
                            }
                          },
                        ),
                      ),
                    ),
                    /** 
                             * COUNTRY
                             * the next widget is the form field that containts the counter of the user
                             * the users previous data will be in as a place holder in the field
                             */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          controller: sexController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: sex,
                            // border: OutlineInputBorder()
                          ),
                          validator: (String? country) {
                            if (country == null || country.isEmpty) {
                              return "Country name should not be empty";
                            }
                          },
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //   child: Container(
                    //     height: 200,
                    //     child: SizedBox(
                    //       height: 200,
                    //       child: TextFormField(
                    //         expands: true,
                    //         maxLines: null,
                    //         controller: sexController,
                    //         keyboardType: TextInputType.name,
                    //         decoration: InputDecoration(
                    //           hintText: selfDescription,
                    //           //border: OutlineInputBorder()
                    //         ),
                    //         validator: (String? description) {
                    //           if (description == null || description.isEmpty) {
                    //             return "Description should not be empty";
                    //           }
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    BlocConsumer<ProfileUpdaterBloc, SaveState>(
                        listener: (context, state) {
                      if (state is Saved) {
                        context.go("/user/home");
                      }
                    }, builder: (context, state) {
                      Widget temp = const Text("SAVE");
                      if (state is Saving) {
                        temp = Text("saving..");
                      } else if (state is Saved) {
                        temp = Text("saved");
                      }
                      return ElevatedButton(
                        onPressed: () {
                          final formValid = formKey.currentState!.validate();
                          if (!formValid) {
                            return;
                          }
                          final Employee emp = Employee(
                            3,
                            1,
                            nameController.text,
                            ageController.text,
                            specController.text,
                            descController.text,
                            int.parse(gpaController.text),
                            degreeNameController.text,
                            sexController.text,
                          );

                          final presseBlock =
                              BlocProvider.of<ProfileUpdaterBloc>(context);
                          presseBlock.add(Save(employee: emp));
                        },
                        child: temp,
                      );
                    })
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

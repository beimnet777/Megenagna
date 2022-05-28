import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdate extends StatelessWidget {
  //controlers for the form are below this line
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final educationLevelController = TextEditingController();
  final fieldController = TextEditingController();
  final descriptionController = TextEditingController();
  //conterllers end here

  //form variables start here
  final name = "Belete Mamo";
  final phoneNumber = "+25134529375";
  final emailAddress = "BeleteMamo@email.com";
  final country = "Ethipia";
  final city = "Mekele";
  final educationLevel = "Masters";
  final field = "MEchanical Engineer";
  final selfDescription =
      "asdfhklhk daskjhkjlasfd sadkfjh sdakjfhas sdahjkfa jksdhkjhads asdjkfhaksjdfh asdhfjkhasjkdlfhkjaafjhasfjk asjkhfjksah asjkfaskj a sj askjfhksajdfhkja jkahsd fasjkf";
  //form variables end here

  // key variable in the form
  final formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          color: Colors.white,
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
                  child: Column(
                    children: [
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
                                hintText: name, border: OutlineInputBorder()),
                            validator: (String? name) {
                              if (name == null || name.isEmpty) {
                                return "Name can not be empty";
                              }
                            },
                          ),
                        ),
                      ),
                      /**
                   * PHONE NUMBER 
                   * the next widget is the form field that containts the phone number of the user
                   * the users previous data will be in as a place holder in the field
                   */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: phoneNumber,
                                border: OutlineInputBorder()),
                            validator: (String? phone) {
                              if (phone == null || phone.isEmpty) {
                                return "Phone must not be empty";
                              }

                              final phoneTest =
                                  RegExp("/^(^\+251|^251|^0)?9\d{8}\$/");
                              final phoneValid = phoneTest.hasMatch(phone);

                              return phoneValid
                                  ? null
                                  : "Phone number is incorrect";
                            },
                          ),
                        ),
                      ),
                      /** 
                   * EMAIL
                   * the next widget is the form field that containts the Email of the user
                   * the users previous data will be in as a place holder in the field
                   */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: emailAddress,
                                border: OutlineInputBorder()),
                            validator: (String? email) {
                              if (email == null || email.isEmpty) {
                                return "Email can not be empty";
                              }

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email);
                              return emailValid
                                  ? null
                                  : "Invalied email address";
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
                            controller: countryController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: country,
                                border: OutlineInputBorder()),
                            validator: (String? country) {
                              if (country == null || country.isEmpty) {
                                return "Country name should not be empty";
                              }
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
                            controller: cityController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: city, border: OutlineInputBorder()),
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
                            controller: educationLevelController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: educationLevel,
                                border: OutlineInputBorder()),
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
                            controller: fieldController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: field, border: OutlineInputBorder()),
                            validator: (String? field) {
                              if (field == null || field.isEmpty) {
                                return "Field of work should not be empty";
                              }
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Container(
                          height: 200,
                          child: SizedBox(
                            height: 200,
                            child: TextFormField(
                              expands: true,
                              maxLines: null,
                              controller: descriptionController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: selfDescription,
                                  border: OutlineInputBorder()),
                              validator: (String? description) {
                                if (description == null ||
                                    description.isEmpty) {
                                  return "Description should not be empty";
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final formValid = formKey.currentState!.validate();
                            if (!formValid) {
                              return;
                            }
                          },
                          child: Text("SAVE"))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

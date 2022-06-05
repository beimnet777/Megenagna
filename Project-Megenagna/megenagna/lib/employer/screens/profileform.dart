import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/save_event.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeBloc.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeEvent.dart';
import 'package:last/employer/blocs/create_profile_blocs/createprofilebloc.dart';
import 'package:last/employer/blocs/create_profile_blocs/createprofileevent.dart';
import 'package:last/employer/blocs/create_profile_blocs/createprofilestate.dart';
import 'package:last/employer/blocs/post_blocs/postState.dart';
import 'package:last/employer/blocs/post_blocs/post_event.dart';
import 'package:last/employer/blocs/post_blocs/postbloc.dart';
import 'package:last/employer/blocs/statistics_bloc/statisticsstate.dart';

class ProfileForm extends StatelessWidget {
  TextEditingController nameControler = TextEditingController();
  TextEditingController companyFunctionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController sub_CityController = TextEditingController();

  final newKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Your Profile"),
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: newKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameControler,
                      decoration: InputDecoration(
                        hintText: "Employer Name",
                      ),
                      validator: (String? name) {
                        if (name == null || name.isEmpty) {
                          return "Employer name can not be null";
                        }
                      },
                    ),
                    TextFormField(
                        controller: companyFunctionController,
                        decoration: InputDecoration(
                          hintText: "Company Function",
                        ),
                        validator: (String? experiance) {
                          if (experiance == null || experiance.isEmpty) {
                            return "Company Function can not be null";
                          }
                        }),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(hintText: "City"),
                      validator: (String? salary) {
                        if (salary == null || salary.isEmpty) {
                          return "City can not be Empty";
                        }
                      },
                    ),
                    TextFormField(
                      controller: sub_CityController,
                      decoration: InputDecoration(hintText: "Sub-City"),
                      validator: (String? jobBenefit) {
                        if (jobBenefit == null || jobBenefit.isEmpty) {
                          return "Sub-City can not be empty";
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
                            child: BlocConsumer<CreateProfileBloc,
                                CreateProfileState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<CreateProfileBloc>(
                                              context)
                                          .add(CreateProfilePressed(
                                        nameControler.text,
                                        companyFunctionController.text,
                                        cityController.text,
                                        sub_CityController.text,
                                      ));
                                      final formValid =
                                          newKey.currentState!.validate();
                                      if (!formValid) {
                                        return;
                                      } else {}
                                    },
                                    child: Text("Create"));
                              },
                              listener: (context, state) {
                                if (state is Saved) {
                                  BlocProvider.of<CompanyHomeBloc>(context)
                                      .add(Opening());
                                  context.go("/company/home");
                                }
                              },
                            )),
                        Expanded(child: Container())
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

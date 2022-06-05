import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/Auth/bloc/radiobloc/radiobloc.dart';
import 'package:last/Auth/bloc/radiobloc/radioevent.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeEvent.dart';
import 'package:last/employer/blocs/company_home_bloc/companyHomeState.dart';
import 'package:last/employer/screens/CompanyHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../employee/blocs/job_bloc/job_bloc.dart';
import '../../employee/blocs/job_bloc/job_event.dart';
import 'SignUp.dart';
import '../../employer/blocs/company_home_bloc/companyHomeBloc.dart';

import '../../employer/blocs/company_home_bloc/companyHomeState.dart';
import '/Auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: Form(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                              color: Colors.blue,
                              width: 2.0,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text('መገናኛ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800))),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid)),
                          hintText: "Enter Username",
                          icon: Icon(Icons.photo_camera_front_rounded)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a Password";
                        } else if (value.length < 8) {
                          return "password is too short ";
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          hintText: "Enter Password",
                          icon: Icon(Icons.password)),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(child: Container()),
                      BlocConsumer<AuthBloc, AuthState>(
                          listener: ((context, state) async {
                        if (state is Loggedin) {
                          // if user is logged indsfjgh
                          print("I am here");
                          final prefs = await SharedPreferences.getInstance();
                          if (prefs.getInt('type') == 1) {
                            BlocProvider.of<JobBloc>(context).add(LoadJoabs());
                            context.go("/user/home");
                          } else {
                            BlocProvider.of<CompanyHomeBloc>(context)
                                .add(Opening());
                            context.go("/company/home");
                          }
                        }
                      }), builder: (context, state) {
                        Widget temp = const Text("Login");
                        final String username = usernameController.text;
                        final String password = passwordController.text;

                        return ElevatedButton(
                            child: temp,
                            onPressed: () => BlocProvider.of<AuthBloc>(context)
                                .add(Login(
                                    username: usernameController.text,
                                    password: passwordController.text)));
                      }),
                      const SizedBox(width: 20),
                      BlocConsumer<AuthBloc, AuthState>(
                          listener: ((context, state) {
                        if (state is SigningUp) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        }
                      }), builder: (context, state) {
                        final String username = usernameController.text;
                        final String password = passwordController.text;
                        return ElevatedButton(
                            child: const Text("Sign Up"),
                            onPressed: () => BlocProvider.of<AuthBloc>(context)
                                .add(SignUp()));
                      }),
                      Expanded(child: Container())
                    ]),
                    BlocConsumer<AuthBloc, AuthState>(
                        builder: (context, state) {
                          Widget text;
                          if (state is LoginFailed) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  Text(
                                    "            Log in Failed\nPassword or Username Incorrect",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              ),
                            );
                          }
                          return Row(
                            children: [],
                          );
                        },
                        listener: (context, state) {})
                  ],
                ))));
  }
}

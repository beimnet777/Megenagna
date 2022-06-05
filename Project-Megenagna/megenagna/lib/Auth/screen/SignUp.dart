import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:last/employee/blocs/profile%20_update_blocs/save_state.dart';
import '../bloc/radiobloc/radiobloc.dart';
import '../bloc/radiobloc/radioevent.dart';
import '/Auth/bloc/auth_bloc.dart';

class SignupScreen extends StatelessWidget {
  int value = 1;

  final OutlineInputBorder border = const OutlineInputBorder(
      borderSide:
          BorderSide(color: Colors.blue, width: 1, style: BorderStyle.solid));
  final _SignUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    RegExp validEmail =
        RegExp(r'([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})');

    TextEditingController firstNamectrl = TextEditingController();
    TextEditingController lastNamectrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController addressCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    TextEditingController confirmPassCtrl = TextEditingController();
    return Scaffold(
        body: Form(
      key: _SignUpKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                      color: Colors.blue, width: 2.0, style: BorderStyle.solid),
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
              controller: firstNamectrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please fill in the field";
                }
              },
              decoration: InputDecoration(
                border: border,
                hintText: "Enter your first name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: lastNamectrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your last name";
                }
              },
              decoration: InputDecoration(
                border: border,
                hintText: "Enter your last name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter your email";
                } else if (!validEmail.hasMatch(value)) {
                  return "invalid email";
                }
              },
              decoration: InputDecoration(
                border: border,
                hintText: "Enter your email",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your Address';
                }
              },
              decoration: InputDecoration(
                border: border,
                hintText: "Enter your address",
              ),
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
              controller: passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                        style: BorderStyle.solid)),
                hintText: "Enter Password",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value != passwordCtrl.text) {
                  return 'Passwords are not same';
                }
              },
              controller: confirmPassCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                        style: BorderStyle.solid)),
                hintText: "Confirm Password",
              ),
            ),
            BlocConsumer<RadioBloc, int>(
              listener: (context, state) => {},
              builder: (context, state) {
                value = state;
                return Row(
                  children: [
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: value,
                            onChanged: (_) {
                              BlocProvider.of<RadioBloc>(context)
                                  .add(RadioPressed(value));
                            }),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Employer"),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: value,
                            onChanged: (_) {
                              BlocProvider.of<RadioBloc>(context)
                                  .add(RadioPressed(value));
                            }),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Company"),
                      ],
                    ),
                    Expanded(child: Container())
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is ToProfile) {
                print("i am here");
                if (value == 1) {
                  Router.navigate(context, () {
                    context.go("/user/home/profileupdate");
                  });
                } else if (value == 2) {
                  context.go("/CreateHostProfile");
                }
              }
            }, builder: (context, state) {
              final String firstName = firstNamectrl.text;
              final String lastName = lastNamectrl.text;
              final String email = emailCtrl.text;
              final String username = addressCtrl.text;
              final String password = passwordCtrl.text;
              print(firstNamectrl.text);
              print(firstName);

              // print(lastNamectrl.text);
              print(lastName);
              print("here");
              // print(addressCtrl.text);
              print(username);

              return ElevatedButton(
                  onPressed: () {
                    if (_SignUpKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(Register(
                          firstName: firstNamectrl.text,
                          lastName: lastNamectrl.text,
                          email: emailCtrl.text,
                          username: addressCtrl.text,
                          password: passwordCtrl.text,
                          type: value));
                    }
                  },
                  child: const Text('Register'));
            }),
            BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  Widget text;
                  if (state is SigningUpFailed) {
                    return Row(
                      children: [
                        Expanded(child: Container()),
                        Text(
                          "SignUp in Failed",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        Expanded(child: Container()),
                      ],
                    );
                  }
                  return Row(
                    children: [],
                  );
                },
                listener: (context, state) {})
          ],
        ),
      ),
    ));
  }
}

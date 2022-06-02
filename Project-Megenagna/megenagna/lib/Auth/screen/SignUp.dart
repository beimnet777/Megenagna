import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Auth/bloc/auth_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

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
              validator:(value) {
                if (value != passwordCtrl.text){
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
            const SizedBox(height: 10),
            BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                            body: Center(child: Text('signed Up whoooooo'))))),
                builder: (context, state) {
                  final String firstName = firstNamectrl.text;
                  final String lastName = lastNamectrl.text;
                  final String email = emailCtrl.text;
                  final String address = addressCtrl.text;
                  final String password = passwordCtrl.text;
                  return ElevatedButton(
                      onPressed: () => {
                            if (_SignUpKey.currentState!.validate())
                              {
                                BlocProvider.of<AuthBloc>(context).add(Register(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    address: address,
                                    password: password))
                              }
                          },
                      child: const Text('Register'));
                })
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SignUp.dart';
import 'package:project/Auth/bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                  style: BorderStyle.solid)),
                          hintText: "Enter Username",
                          icon: Icon(Icons.photo_camera_front_rounded)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Enter a Password";
                        }
                        else if (value.length < 8){
                          return "password is too short ";
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
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
                          listener: ((context, state) {
                        if (state is Loggedin) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Scaffold(
                                      body: Center(child: Text("hello")))));
                        }
                      }), builder: (context, state) {
                        Widget temp = const Text("Login");
                        final String username = usernameController.text;
                        final String password = passwordController.text;

                        return ElevatedButton(
                            child: temp,
                            onPressed: () => BlocProvider.of<AuthBloc>(context)
                                .add(Login(
                                    username: username, password: password)));
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
                  ],
                ))));
  }
}

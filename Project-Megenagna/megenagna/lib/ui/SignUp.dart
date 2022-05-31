import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final OutlineInputBorder border = const OutlineInputBorder(
      borderSide:
          BorderSide(color: Colors.blue, width: 1, style: BorderStyle.solid));
  final _SignUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    RegExp validEmail =
        RegExp(r'([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})');
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
                if(value == null || value.isEmpty){

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
            ElevatedButton(
                onPressed: () => {
                  if (_SignUpKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')))
                  }
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    ));
  }
}

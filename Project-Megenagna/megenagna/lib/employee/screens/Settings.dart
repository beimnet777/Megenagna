import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              context.go("/profileUpdate");
            },
            title: Text("Edit Profile"),
            leading: Icon(Icons.edit_note),
          ),
          ListTile(
            onTap: () {
              //add go_route to profile update page
            },
            title: Text("About us"),
            leading: Icon(Icons.help_center),
          ),
          ListTile(
            onTap: () {
              context.go('/');
            },
            title: Text("Logout"),
            leading: Icon(Icons.logout_outlined),
          ),
          ListTile(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              context.go('/');
            },
            title: Text("Delete Account"),
            leading: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

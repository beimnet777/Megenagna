import 'package:flutter/material.dart';

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
              //add go_route to profile update page
            },
            title: Text("Edit Profile"),
            leading: Icon(Icons.edit_note),
          ),
          ListTile(
            onTap: () {
              //add go_route to profile update page
            },
            title: Text("Notifications"),
            leading: Icon(Icons.notifications_none),
          ),
          ListTile(
            onTap: () {
              //add go_route to profile update page
            },
            title: Text("FAQ"),
            leading: Icon(Icons.help_center),
          ),
          ListTile(
            onTap: () {
              //add go_route to profile update page
            },
            title: Text("Logout"),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

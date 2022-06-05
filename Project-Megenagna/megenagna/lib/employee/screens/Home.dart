import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last/employee/blocs/apply_bloc/apply_bloc.dart';
import 'package:last/employee/blocs/apply_bloc/apply_event.dart';
import 'package:last/employee/blocs/job_bloc/job_bloc.dart';
import 'package:last/employee/blocs/job_bloc/job_event.dart';
import 'package:last/employee/screens/Settings.dart';
import 'package:last/employee/screens/newStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Apply.dart';
import 'Feed.dart';

import '../blocs/bottom_navigation/bottom_navigation_bloc.dart';
import '../blocs/bottom_navigation/bottom_navigation_event.dart';

class Home extends StatelessWidget {
  // final String id;
  // Home(this.id);
  int navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BottomNavBloc, int>(
          builder: (context, state) {
            return pagePicker(state);
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBloc, int>(
          builder: (BuildContext context, int state) {
            return BottomNavigationBar(
              onTap: (int value) async {
                if (value == 0) {
                  BlocProvider.of<JobBloc>(context).add(LoadJoabs());
                } else if (value == 1) {
                  final prefs = await SharedPreferences.getInstance();
                  print("################################################");
                  print(prefs.getInt('id'));
                  print("################################################");
                  BlocProvider.of<ApplyBloc>(context).add(
                      LoadEvents(prefs.getInt('id')!)); //pass id from cache
                }
                final authBloc = BlocProvider.of<BottomNavBloc>(context);
                authBloc.add(BarItemChanged(value));
              },
              currentIndex: state,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.window_outlined), label: "Status"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            );
          },
        ),
      ),
    );
  }

  pagePicker(int index) {
    return index == 0
        ? Feed()
        : index == 1
            ? newStatus()
            : Settings();
  }
}

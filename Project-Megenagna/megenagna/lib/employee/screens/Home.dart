import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megenagna/employee/screens/Settings.dart';
import 'Apply.dart';
import 'Feed.dart';
import 'Status.dart';

import '../blocs/bottom_navigation/bottom_navigation_bloc.dart';
import '../blocs/bottom_navigation/bottom_navigation_event.dart';

class Home extends StatelessWidget {
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
              onTap: (int value) {
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
            ? Status()
            : Settings();
  }
}

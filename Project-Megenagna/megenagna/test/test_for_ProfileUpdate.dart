import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:last/employee/data%20provider/employee_local_data_provier.dart';
import 'package:last/employee/models/employee.dart';
import 'package:last/employee/repository/employee_local_repository.dart';

import '../lib/employee/screens/ProfileUpdate.dart';
import '../lib/employee/blocs/profile _update_blocs/profile_updater_bloc.dart';
import '../lib/main.dart';

void main() {
  Widget tasteable_widget({required Widget child}) {
    return MaterialApp(home: child);
  }

  group('The tests included for the Feed screen', () {
    testWidgets(
        'Testing if the feed screen has equal differences between its widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(tasteable_widget(child: ProfileUpdate()));

      expect(find.byType(Form), findsOneWidget);
    });
  });
}

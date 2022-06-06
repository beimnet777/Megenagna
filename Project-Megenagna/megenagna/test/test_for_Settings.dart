import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/employee/screens/Settings.dart';
import 'package:go_router/go_router.dart';

void main() {
  
  group('The tests included for the Feed screen', () {
    testWidgets(
        'Testing if the feed screen has equal differences between its widgets',
        (WidgetTester tester) async {
      const result = SizedBox(
        height: 10,
      );
      await tester.pumpWidget(const MaterialApp(home: Settings()));

      expect(find.byWidget(result), findsNWidgets(3));
    });
  });
}

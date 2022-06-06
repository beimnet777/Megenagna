import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/employee/screens/Profile.dart';

void main() {
  group('The tests included for the Feed screen', () {
    testWidgets('Testing if the widgets are distanced equally',
        (WidgetTester tester) async {
      const result = SizedBox(
        height: 10,
      );
      await tester.pumpWidget(const MaterialApp(home: Profile()));

      expect(find.byWidget(result), findsNWidgets(3));
    });
  });
}

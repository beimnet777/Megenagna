import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/employee/screens/Feed.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('The tests included for the Feed screen', () {
    testWidgets(
        'Testing if the feed screen has equal differences between its widgets',
        (WidgetTester tester) async {
      const result = TextField(
        style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'search here...'),
      );
      await tester.pumpWidget(MaterialApp(home: Feed()));

      expect(find.byWidget(result), findsOneWidget);
    });
  });
}

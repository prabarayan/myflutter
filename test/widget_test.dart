// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('BMI screen calculates the default BMI value', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Prabaharan'), findsOneWidget);
    expect(find.text('GET BMI'), findsOneWidget);

    await tester.tap(find.text('GET BMI'));
    await tester.pump();

    expect(find.text('YOUR BMI IS'), findsOneWidget);
    expect(find.text('23.4'), findsOneWidget);
  });
}

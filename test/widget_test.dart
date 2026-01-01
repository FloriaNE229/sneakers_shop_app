// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sneakers_shop_app/main.dart';

void main() {
  testWidgets('Nike app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NikeApp());

    // Verify that our app contains "Experience".
    expect(find.text('Experience '), findsOneWidget);
    
    // Verify that "Sneakers" category is present.
    expect(find.text('Sneakers'), findsOneWidget);
    
    // Verify that "Cart" is present.
    expect(find.text('Cart'), findsOneWidget);
  });
}

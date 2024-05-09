import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../lib/screens/shape.dart';

// Mocking File for testing purposes
class MockFile extends Mock implements File {}

void main() {
  testWidgets('Shape Page Image and Download Button Test', (WidgetTester tester) async {
    // Build the Shape widget
    await tester.pumpWidget(MaterialApp(
      home: Shape(),
    ));

    // Verify that the AppBar has the correct title
    expect(find.text('Shapes'), findsOneWidget);

    // Verify that the Image asset is loaded correctly
    expect(find.byType(Image), findsOneWidget);
    print('Image asset is loaded successfully.');

    // Verify that the floating action button is present
    expect(find.byType(FloatingActionButton), findsOneWidget);
    print('Floating action button is present.');

    // Simulate tapping the download button
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    print('Download button was tapped.');

    // Note: Actual file writing can't be captured through direct widget testing,
    // so file-writing logic isn't directly validated here. Instead, the intention
    // is to verify the image loads correctly and the download button can be tapped.
  });
}

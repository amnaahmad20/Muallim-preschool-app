import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '/Users/apple/StudioProjects/Muallim/lib/screens/main_page.dart';
import '/Users/apple/StudioProjects/Muallim/lib/screens/SettingsPage.dart';


void main() {
  testWidgets('MainPage Navigation and Element Test with Print Statements', (WidgetTester tester) async {
    // Build the MainPage widget
    await tester.pumpWidget(MaterialApp(
      home: MainPage(),
      routes: {
        '/urdu': (context) => Scaffold(body: Text('Urdu Page')),
        '/english': (context) => Scaffold(body: Text('English Page')),
        '/number': (context) => Scaffold(body: Text('Number Page')),
        '/shape': (context) => Scaffold(body: Text('Shape Page')),
        '/flower': (context) => Scaffold(body: Text('Flower Page')),
        '/animal': (context) => Scaffold(body: Text('Animal Page')),
        '/bird': (context) => Scaffold(body: Text('Bird Page')),
      },
    ));

    // Verify that the MainPage is displayed
    expect(find.byType(MainPage), findsOneWidget);
    print('MainPage is displayed successfully.');

    // Check that all the navigation options are present
    expect(find.text(" آؤ اردو سیکھیں۔"), findsOneWidget);
    expect(find.text("English Letter Journey"), findsOneWidget);
    expect(find.text("Number Wonderland"), findsOneWidget);
    expect(find.text("Shape Safari"), findsOneWidget);
    expect(find.text("Flower Fantasy"), findsOneWidget);
    expect(find.text("Animal Kingdom"), findsOneWidget);
    expect(find.text("Birds Bonanza"), findsOneWidget);
    print('All navigation options are displayed successfully.');

    // Test tapping on " آؤ اردو سیکھیں۔" to navigate to the Urdu Page
    await tester.tap(find.text(" آؤ اردو سیکھیں۔"));
    await tester.pumpAndSettle();
    expect(find.text('Urdu Page'), findsOneWidget);
    print('Navigated to Urdu Page successfully.');

    // Navigate back to MainPage
    Navigator.of(tester.element(find.text('Urdu Page'))).pop();
    await tester.pumpAndSettle();

    // Test tapping on "English Letter Journey" to navigate to the English Page
    await tester.tap(find.text("English Letter Journey"));
    await tester.pumpAndSettle();
    expect(find.text('English Page'), findsOneWidget);
    print('Navigated to English Page successfully.');

    // Navigate back to MainPage
    Navigator.of(tester.element(find.text('English Page'))).pop();
    await tester.pumpAndSettle();

    // Ensure scrolling occurs within a specific Scrollable parent widget
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -200)); // Adjust offset for appropriate scrolling

    // Test tapping on "Shape Safari" to navigate to the Shape Page
    await tester.tap(find.text("Shape Safari"));
    await tester.pumpAndSettle();
    expect(find.text('Shape Page'), findsOneWidget);
    print('Navigated to Shape Page successfully.');

    Navigator.of(tester.element(find.text('Shape Page'))).pop();
    await tester.pumpAndSettle();

    // Ensure scrolling again to expose further options
    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -200)); // Adjust offset for appropriate scrolling

    // Test tapping on "Flower Fantasy" to navigate to the Flower Page
    await tester.tap(find.text("Flower Fantasy"));
    await tester.pumpAndSettle();
    expect(find.text('Flower Page'), findsOneWidget);
    print('Navigated to Flower Page successfully.');

    Navigator.of(tester.element(find.text('Flower Page'))).pop();
    await tester.pumpAndSettle();

    // Repeat scrolling and tapping for the remaining pages as needed

    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -200));
    await tester.tap(find.text("Animal Kingdom"));
    await tester.pumpAndSettle();
    expect(find.text('Animal Page'), findsOneWidget);
    print('Navigated to Animal Page successfully.');

    Navigator.of(tester.element(find.text('Animal Page'))).pop();
    await tester.pumpAndSettle();

    await tester.drag(find.byType(SingleChildScrollView), Offset(0, -200));
    await tester.tap(find.text("Birds Bonanza"));
    await tester.pumpAndSettle();
    expect(find.text('Bird Page'), findsOneWidget);
    print('Navigated to Bird Page successfully.');
  });
}

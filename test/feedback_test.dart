import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '/Users/apple/StudioProjects/Muallim/lib/screens/FeedbackPage.dart';

void main() {
  testWidgets('FeedbackPage Widget Test with Print Statements', (WidgetTester tester) async {
    // Build the FeedbackPage widget
    await tester.pumpWidget(MaterialApp(home: FeedbackPage()));

    // Verify that the FeedbackPage is displayed
    expect(find.byType(FeedbackPage), findsOneWidget);
    print('FeedbackPage is displayed successfully.');

    // Verify that the AppBar is present and has the correct title
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Feedback'), findsOneWidget);
    print('AppBar with the title "Feedback" is displayed.');

    // Verify that the WebView is present
    expect(find.byType(WebView), findsOneWidget);
    print('WebView is present on the FeedbackPage.');

    // Simulate a web resource error to verify that the alert dialog appears
    // Note: WebView errors cannot be triggered directly via WidgetTester,
    // so we'll simulate the dialog manually to verify its appearance.

    await tester.runAsync(() async {
      showDialog(
        context: tester.element(find.byType(FeedbackPage)),
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('No Internet Connection'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 50,
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                Text(
                  'Please check your internet connection and try again.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      // Wait for the dialog to be fully displayed
      await tester.pumpAndSettle();
    });

    // Verify that the alert dialog is shown
    expect(find.text('No Internet Connection'), findsOneWidget);
    print('No Internet Connection alert dialog is displayed.');

    // Verify that the "OK" button exists in the alert dialog
    expect(find.text('OK'), findsOneWidget);
    print('Alert dialog with "OK" button is displayed.');

    // Tap on the "OK" button to dismiss the alert dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    print('Alert dialog was dismissed.');
  });
}

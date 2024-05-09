import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

  class User_details extends StatelessWidget {
  final String googleFormUrl =
 'https://docs.google.com/forms/d/e/1FAIpQLScBQnk1TbuxoKV_2Hzm7Ax4Xxq-FDiWBImCLF9Ho-9s3egbyQ/viewform?usp=sf_link';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('User details'),
  ),
  body: WebView(
  initialUrl: googleFormUrl,
  javascriptMode: JavascriptMode.unrestricted,
  debuggingEnabled: true,
  onWebViewCreated: (WebViewController webViewController) {},
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {
  // Display an alert dialog when a web resource error occurs
  showDialog(
  context: context,
  barrierDismissible: false, // Prevent dialog from being dismissed by tapping outside
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
  // Close the dialog and navigate back to the previous screen
  Navigator.of(context).pop();
  Navigator.of(context).pop(); // Assuming main screen is two screens behind
  },
  child: Text('OK'),
  ),
  ],
  );
  },
  );
  },
  ),
  );
  }
  }

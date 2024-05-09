import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'About_us.dart';
import 'FeedbackPage.dart';
import 'user_details.dart';
double _volume = 0.5;
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State {
   // Initial volume value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF864341),
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Slider(
              value: _volume,
              onChanged: (newValue) {
                setState(() {
                  _volume = newValue;
                });
              },
            ),
          ),
          ListTile(
            title: Text('User Details'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => User_details()), // Navigate to UserDetailsPage
              );
            },
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()), // Replace AboutUsPage with the actual page widget
              );
            },
          ),
          ListTile(
            title: Text('Feedback'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()), // Navigate to FeedbackPage
              );
            },
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Close the app
                SystemNavigator.pop();
              },
              child: Text('Close App'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delayed navigation to login screen after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'lib/assets/mualim-splash screen.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF864341),
        height: 40,
        width: double.infinity,
        child: Center(
          child: Text(
            'A product of LOVE Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

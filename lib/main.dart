import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_page.dart';
import 'screens/SettingsPage.dart';
import 'screens/About_us.dart';
import 'screens/urdu.dart';
import 'screens/english.dart';
import 'screens/number.dart';
import 'screens/shape.dart';
import 'screens/flower.dart';
import 'screens/animal.dart';
import 'screens/birds.dart';
void main() {
  runApp(ColorLearningApp());
}

class ColorLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mualam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainPage(),
        '/settings': (context) => SettingsPage(),
        '/AboutUsPage': (context) => AboutUsPage(),
        '/urdu': (context) => Urdu(),
        '/english': (context) => English(),
        '/number': (context) => Number(),
        '/shape': (context) => Shape(),
        '/flower': (context) => Flower(),
        '/animal': (context) => Animal(),
        '/bird': (context) => Bird(),





      },
    );
  }
}
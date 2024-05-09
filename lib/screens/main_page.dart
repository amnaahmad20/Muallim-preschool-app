import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'SettingsPage.dart'; // Import the SettingsPage


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مُعلِم',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
        backgroundColor: Color(0xFF864341),
      ),
      drawer: Drawer(
        child: SettingsPage(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildOption(context, " آؤ اردو سیکھیں۔", Color(0x6D123F), Icons.pin_end, () {
              Navigator.pushNamed(context, '/urdu');
            }),
            SizedBox(height: 20),
            _buildOption(context, "English Letter Journey", Color(0xDBA009), Icons.sort_by_alpha_outlined, () {
              Navigator.pushNamed(context, '/english');
            }),
            SizedBox(height: 20),
            _buildOption(context, "Number Wonderland", Color(0x145DA0), Icons.format_list_numbered_outlined, () {
              Navigator.pushNamed(context, '/number');
            }),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/mainpage.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20),
            _buildOption(context, "Shape Safari", Color(0x74748F), Icons.circle, () {
              Navigator.pushNamed(context, '/shape');
            }),
            SizedBox(height: 20),
            _buildOption(context, "Flower Fantasy", Color(0xB7342F), Icons.local_florist_outlined, () {
              Navigator.pushNamed(context, '/flower');
            }),
            SizedBox(height: 20),
            _buildOption(context, "Animal Kingdom", Color(0xC87735), Icons.pets_outlined, () {
              Navigator.pushNamed(context, '/animal');
            }),
            SizedBox(height: 20),
            _buildOption(context, "Birds Bonanza", Color(0x20605C), Icons.crop, () {
              Navigator.pushNamed(context, '/bird');
            }),
            SizedBox(height: 20), // Extra space to ensure the footer doesn't cover the content
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF864341),
        height: 24,
        width: 30,
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

  Widget _buildOption(BuildContext context, String title, Color color, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 50, // Increase the icon size
              ),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

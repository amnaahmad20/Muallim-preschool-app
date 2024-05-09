import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xFF864341),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Teal Heading
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'LOVE Home',
                style: TextStyle(
                  color: Color(0xFF168AAD),
                  fontSize: 36, // Increased font size
                  fontWeight: FontWeight.bold, // Bold font weight
                ),
              ),
            ),
            // Logo Picture
            Image.asset(
              'lib/assets/LOGO-LoveHome.png', // Replace 'assets/logo.png' with your actual logo image path
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // Paragraph of text
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'LOVE Home is a platform that combines educational content, interactive applications, counselling services, and AI-driven insights to strengthen family bond. It is a Software As A Service (SAAS) that will feature insightful short videos, enlightening interviews with esteemed psychiatrists and experts, and rich collection of blogs that cover a spectrum of parenting challenges, mental health topics, and proven strategies for nurturing a child.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18), // Increased font size
              ),
            ),
            SizedBox(height: 20),
            // Links to Instagram and Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {
                    _launchURL('mailto:love.home1084@gmail.com');
                  },
                ),
                IconButton(
                  icon: Image.asset('lib/assets/instagram logo.jpeg',width: 30, // Adjust width as needed
                    height: 30,),
                  // Replace with your Instagram icon image
                  onPressed: () {
                    _launchURL('https://www.instagram.com/lovehome_official_/');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

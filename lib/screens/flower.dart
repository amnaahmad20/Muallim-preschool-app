import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';

class Flower extends StatelessWidget {
  final String imagePath = 'lib/assets/flowers.jpg'; // Updated image path

  Future<void> _downloadImage() async {
    try {
      // Get the directory where the image will be saved
      Directory? directory = await getExternalStorageDirectory(); // Use getExternalStorageDirectory() for external storage
      String path = directory!.path + '/make_color.png';

      // Read the image file
      ByteData data = await rootBundle.load(imagePath);
      List<int> bytes = data.buffer.asUint8List();

      // Write the image file to the device storage
      await File(path).writeAsBytes(bytes);
    } catch (e) {
      debugPrint('Error downloading image: $e'); // Improved error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flowers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xFF864341),
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.1,
          maxScale: 4.0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF864341),
        height: 30,
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
      floatingActionButton: FloatingActionButton(
        onPressed: _downloadImage,
        backgroundColor: Color(0xFFB66E6C),
        child: Icon(Icons.download),
      ),
    );
  }
}

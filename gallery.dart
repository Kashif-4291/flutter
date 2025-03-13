import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  Future<void> _openGallery() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery); // Opens the gallery
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openGallery,
          child: const Text('Click to Open Gallery'),
        ),
      ),
    );
  }
}

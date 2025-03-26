import 'package:flutter/material.dart';

class ArrayScreen extends StatelessWidget {
  const ArrayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Storing names and image paths without displaying them
    final List<String> names = ['Kashif', 'Jamshaid', 'Maqsood', 'Muzammal', 'Bilal', 'Umair'];
    final List<String> images = [
      'assets/image/math.jpg',
      'assets/image/math2.jpg',
      'assets/image/math3.jpg',
      'assets/image/bgnu.jpeg',
      'assets/image/logo.jpeg',
      'assets/image/computer.jpg',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Stored Data")),
      body: const Center(
        child: Text(
          "Data is stored but not displayed",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data from array.dart
    final List<String> names = ['Kashif', 'Jamshaid', 'Maqsood', 'Muzammal', 'Bilal', 'Umair'];
    final List<String> images = [
      'asset/image/math.jpg',
      'asset/image/math2.jpg',
      'asset/image/math3.jpg',
      'asset/image/bgnu.jpeg',
      'asset/image/logo.jpeg',
      'asset/image/computer.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Data in Random Widgets'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: names.length, // Ensure both lists have equal length
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    images[index],
                    width: 100,  // Increased size
                    height: 100, // Increased size
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    names[index],
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), // Bigger text
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

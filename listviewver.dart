import 'package:flutter/material.dart';
// ignore: unused_import
import 'array.dart'; // Import the ArrayScreen

class DynamicListScreen extends StatefulWidget {
  const DynamicListScreen({super.key});

  @override
  _DynamicListScreenState createState() => _DynamicListScreenState();
}

class _DynamicListScreenState extends State<DynamicListScreen> {
  // Fetching names and images from array.dart
  final List<String> names = ['Kashif', 'Jamshaid', 'Maqsood', 'Muzammal', 'Bilal', 'Umair'];
  final List<String> images = [
    'asset/image/math.jpg',
    'asset/image/math2.jpg',
    'asset/image/math3.jpg',
    'asset/image/bgnu.jpeg',
    'asset/image/logo.jpeg',
    'asset/image/computer.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic List from Array'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text("Name: ${names[index]}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text("Image Path: ${images[index]}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Screen'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Kashif Ali',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

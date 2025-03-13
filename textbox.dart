import 'package:flutter/material.dart';

class TextboxScreen extends StatelessWidget {
  const TextboxScreen({super.key}); // Add `const` here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textbox Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Button pressed');
              },
              child: const Text('Print'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({super.key});

  @override
  _PrintScreenState createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  String _name = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = _controller.text; // Store entered name
                });
              },
              child: const Text('Print'),
            ),
            const SizedBox(height: 20),
            Text(
              _name.isNotEmpty ? 'Your Name: $_name' : '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

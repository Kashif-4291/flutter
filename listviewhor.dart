import 'package:flutter/material.dart';

class ListviewVerScreen extends StatelessWidget {
  const ListviewVerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of names
    final List<String> names = ['Kashif', 'Jamshaid', 'Maqsood', 'Muzammal', 'Bilal', 'Umair'];

    // List of corresponding images (make sure these images exist in your assets folder)
    final List<String> images = [
      'asset/image/math.jpg',
      'asset/image/math2.jpg',
      'asset/image/math3.jpg',
      'asset/image/bgnu.jpeg',
      'asset/image/logo.jpeg',
      'asset/image/computer.jpg',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Vertical ListView")),
      body: ListView.builder(
        itemCount: names.length, // Only 6 items
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                // First Card: Displays Name
                Card(
                  color: Colors.blue[100],
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      names[index],
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // Second Card: Displays Image
                Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      images[index], // Uses corresponding image
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // ListTile for numbering items
                ListTile(
                  leading: const Icon(Icons.list, color: Colors.blue),
                  title: Text('Item $index'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

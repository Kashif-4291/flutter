import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'BABA GURU NANAK UNIVERSITY NANKANA SAHIB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset(
              'asset/image/logo.jpeg',
              width: 30, 
              height: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(widget.title, style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Image.asset(
  'asset/image/bgnu.jpeg',
  width: 150,
  height: 150, 
  fit: BoxFit.contain,
),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Baba Guru Nanak University (BGNU) is a prestigious public university located in Nankana Sahib, Punjab, '
                  'Pakistan, the birthplace of Guru Nanak. The university aims to provide high-quality education, promote research, '
                  'and foster innovation across various disciplines. On 28 October 2019, the foundation stone of the university was laid '
                  'by the then Prime Minister of Pakistan, Imran Khan, marking a significant step in the advancement of higher education in the region.\n\n'
                  
                  'BGNU offers a wide range of undergraduate and postgraduate programs in science, technology, humanities, and social sciences. '
                  'The university strives to create a diverse and inclusive academic environment where students can excel in their chosen fields. '
                  'It is committed to equipping students with the necessary skills and knowledge to contribute positively to society.\n\n'
                  
                  'The university campus is designed to provide modern educational facilities, including well-equipped laboratories, libraries, and research centers. '
                  'With a focus on academic excellence and character building, BGNU envisions becoming a leading institution that shapes the future of its students and the nation.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Gmail: bgnu@gmail.com', style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('Phone: +92 300 1234567', style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('Address: Nankana Sahib, Pakistan', style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


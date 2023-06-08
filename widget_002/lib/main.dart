import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Widgets'),
        ),
        body: Column(
          children: [
            const Text(
              'Hello, Flutter!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('This is a Button'),
            ),
            const Icon(
              Icons.star,
              color: Colors.blue,
              size: 50.0,
            ),
            Image.network(
              'https://storage.googleapis.com/cms-storage-bucket/65361d7e1dfa118aa63b.png',
              width: 300,
              height: 150,
            ),
            Container(
              height: 100,
              color: Colors.yellow,
              child: const Center(
                child: Text('Container Widget'),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.pink),
                Icon(Icons.comment, color: Colors.blue),
                Icon(Icons.share, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gesture Handling Example'),
        ),
        body: const Center(
          child: MyGestureWidget(),
        ),
      ),
    );
  }
}

class MyGestureWidget extends StatelessWidget {
  const MyGestureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('MyGestureWidget was tapped!');
        }
      },
      onDoubleTap: () {
        if (kDebugMode) {
          print('MyGestureWidget was double-tapped!');
        }
      },
      onLongPress: () {
        if (kDebugMode) {
          print('MyGestureWidget was long-pressed!');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text('Tap Me'),
      ),
    );
  }
}

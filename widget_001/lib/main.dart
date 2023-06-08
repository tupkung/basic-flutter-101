import 'package:flutter/material.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Column(
              children: [
                Text(
              'Hello, Flutter!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Arial',
              ),
            ),
            Text(
              'Hello, World!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Arial',
              ),
            ),
            ],
          )
        ),
      ),
    ),
  ));
}

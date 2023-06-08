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
          title: const Text('InheritedWidget Example'),
        ),
        body: const MyParentWidget(),
      ),
    );
  }
}

class MyParentWidget extends StatelessWidget {
  const MyParentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SharedDataWidget(
      data: 'Hello, World!',
      child: MyChildWidget(),
    );
  }
}

class SharedDataWidget extends InheritedWidget {
  final String data;

  const SharedDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    return data != oldWidget.data;
  }

  static SharedDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>()!;
  }
}

class MyChildWidget extends StatelessWidget {
  const MyChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String sharedData = SharedDataWidget.of(context).data;
    return Text(sharedData);
  }
}

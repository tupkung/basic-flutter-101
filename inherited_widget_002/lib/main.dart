import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'InheritedWidget Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counter: _counter,
      increment: _incrementCounter,
      decrement: _decrementCounter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidget Example'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              CounterText(),
              CounterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CounterProvider({
    Key? key,
    required this.counter,
    required this.increment,
    required this.decrement,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context);
    return Text(
      '${counterProvider.counter}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = CounterProvider.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: counterProvider.increment,
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: counterProvider.decrement,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _RouterDelegate(),
      routeInformationParser: _RouteInformationParser(),
    );
  }
}

class _RouteInformationParser extends RouteInformationParser<int> {
  @override
  Future<int> parseRouteInformation(RouteInformation routeInformation) async {
    return int.tryParse(routeInformation.location ?? '') ?? 0;
  }

  @override
  RouteInformation restoreRouteInformation(int path) {
    return RouteInformation(location: '$path');
  }
}

class _RouterDelegate extends RouterDelegate<int> with ChangeNotifier, PopNavigatorRouterDelegateMixin<int> {
  int _selectedIndex = 0;

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  int get currentConfiguration => _selectedIndex;

  @override
  Future<void> setNewRoutePath(int path) async {
    _selectedIndex = path;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: HomePage(
            selectedIndex: _selectedIndex,
            onItemTapped: (index) {
              _selectedIndex = index;
              notifyListeners();
            },
          ),
        ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}

class HomePage extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const HomePage({super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page $selectedIndex'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '0'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: '1'),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

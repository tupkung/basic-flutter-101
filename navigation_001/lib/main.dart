import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerDelegate: _RouterDelegate(),
      routeInformationParser: _RouteInformationParser(),
    );
  }
}

class _RouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return HomePath();
    }
    final firstSegment = uri.pathSegments[0];
    if (firstSegment == 'details') {
      return DetailsPath();
    }
    return HomePath();
  }
}

class _RouterDelegate extends RouterDelegate<RoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  RoutePath? _currentPath;

  @override
  RoutePath? get currentConfiguration => _currentPath;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('HomePage'),
          child: HomePage(
            onDetailsPressed: _handleDetailsPressed,
          ),
        ),
        if (_currentPath is DetailsPath)
          MaterialPage(
            key: const ValueKey('DetailsPage'),
            child: DetailsPage(
              onPop: _handlePop,
            ),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _currentPath = HomePath();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath path) async {
    _currentPath = path;
  }

  void _handleDetailsPressed() {
    _currentPath = DetailsPath();
    notifyListeners();
  }

  void _handlePop() {
    _currentPath = HomePath();
    notifyListeners();
  }
}


class HomePage extends StatelessWidget {
  final VoidCallback onDetailsPressed;

  const HomePage({super.key, required this.onDetailsPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: onDetailsPressed,
          child: const Text('Go to details'),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final VoidCallback onPop;

  const DetailsPage({super.key, required this.onPop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: onPop,
          child: const Text('Pop details'),
        ),
      ),
    );
  }
}

abstract class RoutePath {}

class HomePath extends RoutePath {}

class DetailsPath extends RoutePath {}

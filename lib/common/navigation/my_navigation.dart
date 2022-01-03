import 'package:flutter/material.dart';
import 'package:flutter_starter_mobile/common/data/extensions.dart';

enum NavigationRoute {
  // TODO
  screen
}

class RouteGenerator {
  static Route generateRoute(RouteSettings routeSettings) {
    final routeUri = routeSettings.name!.getUri;
    if (routeUri.path == NavigationRoute.screen.path) {
      final id = int.tryParse(routeUri.queryParameters['id']!);
      return MaterialPageRoute(
        //TODO
          settings: routeSettings, builder: (_) => Container());
    } else {
      return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text('Navigation error'),
          ),
        );
      },
    );
  }
}

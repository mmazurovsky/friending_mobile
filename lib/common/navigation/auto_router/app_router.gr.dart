// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OneRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnePage(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          OneRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [OnePage]
class OneRoute extends PageRouteInfo<void> {
  const OneRoute()
      : super(
          OneRoute.name,
          path: '/',
        );

  static const String name = 'OneRoute';
}

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
    FrontRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FrontPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    PeopleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PeoplePage(),
      );
    },
    EventsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EventsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          FrontRoute.name,
          path: '/',
          children: [
            RouteConfig(
              PeopleRoute.name,
              path: 'people-page',
              parent: FrontRoute.name,
            ),
            RouteConfig(
              EventsRoute.name,
              path: 'events-page',
              parent: FrontRoute.name,
            ),
            RouteConfig(
              ProfileRoute.name,
              path: 'profile-page',
              parent: FrontRoute.name,
            ),
          ],
        ),
        RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
      ];
}

/// generated route for
/// [FrontPage]
class FrontRoute extends PageRouteInfo<void> {
  const FrontRoute({List<PageRouteInfo>? children})
      : super(
          FrontRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'FrontRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [PeoplePage]
class PeopleRoute extends PageRouteInfo<void> {
  const PeopleRoute()
      : super(
          PeopleRoute.name,
          path: 'people-page',
        );

  static const String name = 'PeopleRoute';
}

/// generated route for
/// [EventsPage]
class EventsRoute extends PageRouteInfo<void> {
  const EventsRoute()
      : super(
          EventsRoute.name,
          path: 'events-page',
        );

  static const String name = 'EventsRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile-page',
        );

  static const String name = 'ProfileRoute';
}

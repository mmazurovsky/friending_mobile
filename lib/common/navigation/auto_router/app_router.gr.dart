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
    ForgotPasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    OtherUserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserProfileRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: OtherUserProfilePage(
          key: args.key,
          shortProfile: args.shortProfile,
        ),
        transitionsBuilder: TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ExploreRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ExplorePage(),
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
    ProfileEditingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfileEditingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SignInPage(
          key: args.key,
          withBackButton: args.withBackButton,
        ),
      );
    },
    ThisUserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ThisUserProfileRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ThisUserProfilePage(
          key: args.key,
          shortProfile: args.shortProfile,
        ),
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
              ExploreRoute.name,
              path: 'explore-page',
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
              children: [
                RouteConfig(
                  ProfileEditingRoute.name,
                  path: 'profile-editing-page',
                  parent: ProfileRoute.name,
                ),
                RouteConfig(
                  SignInRoute.name,
                  path: 'sign-in-page',
                  parent: ProfileRoute.name,
                ),
                RouteConfig(
                  ThisUserProfileRoute.name,
                  path: 'this-user-profile-page',
                  parent: ProfileRoute.name,
                ),
              ],
            ),
          ],
        ),
        RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot-password-page',
        ),
        RouteConfig(
          OtherUserProfileRoute.name,
          path: '/other-user-profile-page',
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
/// [OtherUserProfilePage]
class OtherUserProfileRoute extends PageRouteInfo<OtherUserProfileRouteArgs> {
  OtherUserProfileRoute({
    Key? key,
    required ShortReadUserModel shortProfile,
  }) : super(
          OtherUserProfileRoute.name,
          path: '/other-user-profile-page',
          args: OtherUserProfileRouteArgs(
            key: key,
            shortProfile: shortProfile,
          ),
        );

  static const String name = 'OtherUserProfileRoute';
}

class OtherUserProfileRouteArgs {
  const OtherUserProfileRouteArgs({
    this.key,
    required this.shortProfile,
  });

  final Key? key;

  final ShortReadUserModel shortProfile;

  @override
  String toString() {
    return 'OtherUserProfileRouteArgs{key: $key, shortProfile: $shortProfile}';
  }
}

/// generated route for
/// [ExplorePage]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute()
      : super(
          ExploreRoute.name,
          path: 'explore-page',
        );

  static const String name = 'ExploreRoute';
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
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          path: 'profile-page',
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [ProfileEditingPage]
class ProfileEditingRoute extends PageRouteInfo<void> {
  const ProfileEditingRoute()
      : super(
          ProfileEditingRoute.name,
          path: 'profile-editing-page',
        );

  static const String name = 'ProfileEditingRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    bool withBackButton = false,
  }) : super(
          SignInRoute.name,
          path: 'sign-in-page',
          args: SignInRouteArgs(
            key: key,
            withBackButton: withBackButton,
          ),
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    this.withBackButton = false,
  });

  final Key? key;

  final bool withBackButton;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, withBackButton: $withBackButton}';
  }
}

/// generated route for
/// [ThisUserProfilePage]
class ThisUserProfileRoute extends PageRouteInfo<ThisUserProfileRouteArgs> {
  ThisUserProfileRoute({
    Key? key,
    required ShortReadUserModel shortProfile,
  }) : super(
          ThisUserProfileRoute.name,
          path: 'this-user-profile-page',
          args: ThisUserProfileRouteArgs(
            key: key,
            shortProfile: shortProfile,
          ),
        );

  static const String name = 'ThisUserProfileRoute';
}

class ThisUserProfileRouteArgs {
  const ThisUserProfileRouteArgs({
    this.key,
    required this.shortProfile,
  });

  final Key? key;

  final ShortReadUserModel shortProfile;

  @override
  String toString() {
    return 'ThisUserProfileRouteArgs{key: $key, shortProfile: $shortProfile}';
  }
}

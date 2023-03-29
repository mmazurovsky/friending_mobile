import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'auto_router/app_router.dart';

abstract class NavigationTab {
  int get index;
  String get name;
  IconData get iconData;
  GlobalKey<AutoRouterState> get navigationKey;
  PageRouteInfo get tabRoute;
  ScrollController get scrollController;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainTab &&
        other.index == index &&
        other.name == name &&
        other.iconData == iconData &&
        other.tabRoute == tabRoute;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        name.hashCode ^
        iconData.hashCode ^
        tabRoute.hashCode;
  }
}

class MainTab extends NavigationTab {
  MainTab._();
  final GlobalKey<AutoRouterState> _navigationKey =
      GlobalKey<AutoRouterState>();

  final _scrollController = ScrollController();

  @override
  int get index => 0;

  @override
  String get name => 'People';

  @override
  IconData get iconData => Ionicons.people_circle_outline;

  @override
  GlobalKey<AutoRouterState> get navigationKey => _navigationKey;

  @override
  PageRouteInfo get tabRoute => const MainRoute();

  @override
  ScrollController get scrollController => _scrollController;
}

class EventsTab extends NavigationTab {
  EventsTab._();
  final GlobalKey<AutoRouterState> _navigationKey =
      GlobalKey<AutoRouterState>();

  final _scrollController = ScrollController();

  @override
  int get index => 1;

  @override
  String get name => 'Events';

  @override
  IconData get iconData => Ionicons.newspaper_outline;

  @override
  GlobalKey<AutoRouterState> get navigationKey => _navigationKey;

  @override
  //TODO
  PageRouteInfo get tabRoute => const MainRoute();

  @override
  ScrollController get scrollController => _scrollController;
}

class ProfileTab extends NavigationTab {
  ProfileTab._();
  final GlobalKey<AutoRouterState> _navigationKey =
      GlobalKey<AutoRouterState>();

  final _scrollController = ScrollController();

  @override
  int get index => 2;

  @override
  String get name => 'Profile';

  @override
  IconData get iconData => Ionicons.person_circle_outline;

  @override
  GlobalKey<AutoRouterState> get navigationKey => _navigationKey;

  @override
  //TODO
  PageRouteInfo get tabRoute => const MainRoute();

  @override
  ScrollController get scrollController => _scrollController;
}

final allTabsOrderedAccordingToIndex = [
  MainTab._(),
  EventsTab._(),
  ProfileTab._(),
];

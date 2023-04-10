import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../animations/wrappers.dart';
import 'auto_router/app_router.dart';

abstract class NavigationTab {
  int get index;
  String get name;
  IconData get iconData;
  GlobalKey<AutoRouterState> get navigationKey;
  PageRouteInfo get tabRoute;
  ScrollController get scrollController;

  BottomNavigationBarItem getBottomNavigationBarItem({
    required bool isCurrentTab,
    // required NavigationTab thisNavTab,
    // required bool thereWasTabChange,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    final icon = iconData;
    Widget? iconWidget = Icon(
      icon,
      size: 30,
      color: isCurrentTab ? activeColor : inactiveColor,
    );

    return BottomNavigationBarItem(
      label: name,
      icon: isCurrentTab
          //  && thereWasTabChange
          ? ScaleAnimationWrapper(
              child: iconWidget,
            )
          : iconWidget,
    );
  }

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
  String get name => 'Explore';

  @override
  IconData get iconData => Ionicons.earth_outline;

  @override
  GlobalKey<AutoRouterState> get navigationKey => _navigationKey;

  @override
  PageRouteInfo get tabRoute => const ExploreRoute();

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
  PageRouteInfo get tabRoute => const EventsRoute();

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
  PageRouteInfo get tabRoute => const ProfileRoute();

  @override
  ScrollController get scrollController => _scrollController;
}

final allTabsOrderedAccordingToIndex = [
  MainTab._(),
  EventsTab._(),
  ProfileTab._(),
];

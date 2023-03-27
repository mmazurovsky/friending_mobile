import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../dependency_injection/dependency_injection.dart';
import '../theme/theme_state_manager.dart';
import '../theme/themes.dart';
import 'auto_router/app_router.dart';

// left tab to right tab
enum NavigationTab { main, events, profile }

extension TabItemExtension on NavigationTab {
  static const Map<NavigationTab, String> _tabNameMap = {
    NavigationTab.main: 'Screen',
    NavigationTab.events: 'Events',
    NavigationTab.profile: 'Profile',
  };

  static final _tabInactiveIconMap = {
    NavigationTab.main: Icon(
      Ionicons.people_circle_outline,
      size: 30,
      color: Bag.palette.inactive,
    ),
    NavigationTab.events: Icon(
      Ionicons.newspaper_outline,
      size: 30,
      color: Bag.palette.inactive,
    ),
    NavigationTab.profile: Icon(
      Ionicons.person_circle_outline,
      size: 30,
      color: Bag.palette.inactive,
    ),
  };

  static final _tabActiveIconMap = {
    NavigationTab.main: Icon(
      Ionicons.people_circle_outline,
      size: 30,
      color: Bag.palette.accent,
    ),
    NavigationTab.events: Icon(
      Ionicons.newspaper_outline,
      size: 30,
      color: Bag.palette.accent,
    ),
    NavigationTab.profile: Icon(
      Ionicons.person_circle_outline,
      size: 30,
      color: Bag.palette.accent,
    ),
  };

  static final _tabNavigationKeyMap = {
    NavigationTab.main: GlobalKey<AutoRouterState>(),
    NavigationTab.events: GlobalKey<AutoRouterState>(),
    NavigationTab.profile: GlobalKey<AutoRouterState>(),
  };

  static const _tabRouteMap = {
    NavigationTab.main: MainRoute(),
  };

  static final _tabScrollControllerMap = {
    NavigationTab.main: ScrollController(),
  };

  PageRouteInfo get tabRoute => _tabRouteMap[this]!;
  String get tabName => _tabNameMap[this]!;
  Widget get tabActiveIcon => _tabActiveIconMap[this]!;
  Widget get tabInactiveIcon => _tabInactiveIconMap[this]!;
  GlobalKey<AutoRouterState> get tabNavigationKey =>
      _tabNavigationKeyMap[this]!;
  ScrollController get tabScrollController => _tabScrollControllerMap[this]!;
}

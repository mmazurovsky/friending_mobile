import 'package:flutter/material.dart';
import 'package:flutter_starter_mobile/common/data/extensions.dart';
import 'package:ionicons/ionicons.dart';

import '../navigation/my_navigation.dart';

// left tab to right tab
enum NavigationTab { screen }

extension TabItemExtension on NavigationTab {
  static const Map<NavigationTab, String> _tabNameMap = {
    NavigationTab.screen: 'Screen',
  };

  static const _tabInactiveIconMap = {
    NavigationTab.screen: Icon(
      Ionicons.calendar_clear_outline,
      size: 30,
      color: Colors.blue,
    ),
  };

  static const _tabActiveIconMap = {
    NavigationTab.screen: Icon(
      Ionicons.calendar,
      size: 30,
      color: Colors.blue,
    ),
  };

  static const _tabRouteMap = {
    NavigationTab.screen: NavigationRoute.screen,
  };

  static final _navigationKey = {
    NavigationTab.screen: GlobalKey<
        NavigatorState>(), //todo move to service locator and uncomment dispose
  };

  static final _navigationServiceMap = {
    NavigationTab.screen: _NavigationService(GlobalKey<
        NavigatorState>()), //todo move to service locator and uncomment dispose
  };

  static final _scrollControllersMap = {
    NavigationTab.screen:
        ScrollController(), //todo move to service locator and uncomment dispose
  };

  Widget get tabActiveIcon => _tabActiveIconMap[this]!;
  String get tabName => _tabNameMap[this]!;
  Widget get tabInactiveIcon => _tabInactiveIconMap[this]!;
  NavigationRoute get tabNavigationRoute => _tabRouteMap[this]!;
  GlobalKey<NavigatorState> get tabNavigationKey => _navigationKey[this]!;
  _NavigationService get tabNavigationService => _navigationServiceMap[this]!;
  ScrollController get tabScrollController => _scrollControllersMap[this]!;
}

class _NavigationService {
  final GlobalKey<NavigatorState> _navKey;
  const _NavigationService(this._navKey);

  GlobalKey<NavigatorState> get navKey => _navKey;

  void pushRoute({
    required NavigationRoute navRoute,
    Map<String, String>? queryParams,
  }) {
    final navigationUri =
        Uri(path: navRoute.path, queryParameters: queryParams).toString();
    _navKey.currentState!.pushNamed(navigationUri);
  }

  void pushRouteForDeepLink(Uri deepLink) {
    final navigationUri = deepLink.toString();
    _navKey.currentState!.pushNamed(navigationUri);
  }
}

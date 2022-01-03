import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/navigation/state.dart';
import 'package:flutter_mobile_starter/common/data/extensions.dart';
import 'package:provider/provider.dart';

import 'my_bottom_nav_bar.dart';
import 'my_navigation.dart';
import 'navigation_tab.dart';

class NavigationTabScaffold extends StatelessWidget {
  const NavigationTabScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: context.watch<CurrentTabChangeNotifier>().currentTab.index,
        children: const [
          NavigatorForTab(NavigationTab.screen),
        ],
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class NavigatorForTab extends StatelessWidget {
  final NavigationTab tab;

  const NavigatorForTab(
    this.tab, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: tab.tabNavigationKey,
      initialRoute: tab.tabNavigationRoute.path,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

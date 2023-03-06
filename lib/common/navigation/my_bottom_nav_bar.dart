import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../animations/wrappers.dart';
import '../dependency_injection/dependency_injection.dart';
import 'navigation_tab.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  MyBottomNavBarState createState() => MyBottomNavBarState();
}

class MyBottomNavBarState extends State<MyBottomNavBar> {
  BottomNavigationBarItem _getBottomNavigationBarItem({
    required bool isCurrentTab,
    required NavigationTab thisNavTab,
    required bool thereWasTabChange,
  }) {
    Widget? icon =
        isCurrentTab ? thisNavTab.tabActiveIcon : thisNavTab.tabInactiveIcon;
    return BottomNavigationBarItem(
      label: thisNavTab.tabName,
      icon: isCurrentTab && thereWasTabChange
          ? ScaleAnimationWrapper(
              child: icon,
            )
          : icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    NavigationTab currentTab = context.watch<TabsChangeNotifier>().currentTab;
    bool thereWasTabChange =
        context.watch<TabsChangeNotifier>().thereWasTabChange;

    return ChangeNotifierProvider(
      create: (context) => getIt<TabsChangeNotifier>(),
      builder: (_, __) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        showUnselectedLabels: false,
        //* https://github.com/flutter/flutter/issues/86545
        selectedFontSize: 0,
        showSelectedLabels: false,
        onTap: (tappedTabIndex) {
          // cases when tapped on active tab bar item
          if (tappedTabIndex == currentTab.index) {
            // case when navigation stack not empty
            if (currentTab.tabNavigationKey.currentState?.controller
                    ?.canPop() ??
                false) {
              currentTab.tabNavigationKey.currentState!.controller!.popUntil(
                (route) => route.isFirst,
              );
            }
            // case when navigation stack empty
            else {
              if (currentTab.tabScrollController.hasClients) {
                currentTab.tabScrollController.animateTo(
                  0.0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 400),
                );
              }
            }
          } else {
            context
                .read<TabsChangeNotifier>()
                .changeCurrentTab(NavigationTab.values[tappedTabIndex]);
          }
        },
        items: [
          _getBottomNavigationBarItem(
            isCurrentTab: currentTab == NavigationTab.main,
            thisNavTab: NavigationTab.main,
            thereWasTabChange: thereWasTabChange,
          ),
        ],
      ),
    );
  }
}

@lazySingleton
class TabsChangeNotifier with ChangeNotifier {
  NavigationTab _currentTab = NavigationTab.main;
  bool _thereWasTabChange = false;

  NavigationTab get currentTab => _currentTab;
  bool get thereWasTabChange => _thereWasTabChange;

  void changeCurrentTab(NavigationTab newTab) {
    if (_currentTab != newTab) {
      _currentTab = newTab;
      _thereWasTabChange = true;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../animations/wrappers.dart';
import '../bag/palette.dart';
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
    final icon = thisNavTab.iconData;
    Widget? iconWidget = Icon(
      icon,
      size: 30,
      color: isCurrentTab
          ? context.palette.activeIcon
          : context.palette.inactiveIcon,
    );

    return BottomNavigationBarItem(
      label: thisNavTab.name,
      icon: isCurrentTab && thereWasTabChange
          ? ScaleAnimationWrapper(
              child: iconWidget,
            )
          : iconWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentTabIndex = context.watch<TabsStateManager>().currentTab;
    bool thereWasTabChange =
        context.watch<TabsStateManager>().thereWasTabChange;

    return ChangeNotifierProvider(
      create: (context) => getIt<TabsStateManager>(),
      builder: (_, __) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        showUnselectedLabels: false,
        //* https://github.com/flutter/flutter/issues/86545
        selectedFontSize: 0,
        showSelectedLabels: false,
        onTap: (tappedTabIndex) {
          // cases when tapped on active tab bar item
          if (tappedTabIndex == currentTabIndex) {
            // case when navigation stack not empty
            final currentTab = allTabsOrderedAccordingToIndex[currentTabIndex];
            if (currentTab.navigationKey.currentState?.controller
                    ?.canPop() ??
                false) {
              currentTab.navigationKey.currentState!.controller!.popUntil(
                (route) => route.isFirst,
              );
            }
            // case when navigation stack empty
            else {
              if (currentTab.scrollController.hasClients) {
                currentTab.scrollController.animateTo(
                  0.0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 400),
                );
              }
            }
          } else {
            context.read<TabsStateManager>().changeCurrentTab(tappedTabIndex);
          }
        },
        items: [
          _getBottomNavigationBarItem(
            isCurrentTab: currentTabIndex == 0,
            thisNavTab: allTabsOrderedAccordingToIndex[0],
            thereWasTabChange: thereWasTabChange,
          ),
        ],
      ),
    );
  }
}

@lazySingleton
class TabsStateManager with ChangeNotifier {
  int _currentTabIndex = 0;
  bool _thereWasTabChange = false;

  int get currentTab => _currentTabIndex;
  bool get thereWasTabChange => _thereWasTabChange;

  void changeCurrentTab(int newTabIndex) {
    if (_currentTabIndex != newTabIndex) {
      _currentTabIndex = newTabIndex;
      _thereWasTabChange = true;
      notifyListeners();
      _thereWasTabChange = false;
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../bag/stateful/palette.dart';
import '../dependency_injection/dependency_injection.dart';
import 'navigation_tab.dart';

class MyBottomNavBar extends StatefulWidget {
  final TabsRouter _router;
  const MyBottomNavBar(this._router, {Key? key}) : super(key: key);

  @override
  MyBottomNavBarState createState() => MyBottomNavBarState();
}

class MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // bool thereWasTabChange =
    //     context.watch<TabsStateManager>().thereWasTabChange;

    return ChangeNotifierProvider(
      create: (context) => getIt<TabsStateManager>(),
      builder: (context, __) {
        int currentTabIndex = context.watch<TabsStateManager>().currentTab;
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: context.palette.background,
          showUnselectedLabels: false,
          //* https://github.com/flutter/flutter/issues/86545
          selectedFontSize: 0,
          showSelectedLabels: false,
          onTap: (tappedTabIndex) {
            // cases when tapped on active tab bar item
            if (tappedTabIndex == currentTabIndex) {
              // case when navigation stack not empty
              final currentTab =
                  allTabsOrderedAccordingToIndex[currentTabIndex];
              if (currentTab.navigationKey.currentState?.controller?.canPop() ??
                  false) {
                currentTab.navigationKey.currentState!.controller!.popUntil(
                  (route) => route.isFirst,
                );
              }
              // case when navigation stack empty
              else {
                context.read<TabsStateManager>().customNotifyListeners();
                if (currentTab.scrollController.hasClients) {
                  currentTab.scrollController.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 400),
                  );
                }
              }
            } else {
              context
                  .read<TabsStateManager>()
                  .changeCurrentTab(widget._router, tappedTabIndex);
            }
          },
          items: [
            allTabsOrderedAccordingToIndex[0].getBottomNavigationBarItem(
              isCurrentTab: currentTabIndex == 0,
              // thereWasTabChange: thereWasTabChange,
              activeColor: context.palette.activeIcon,
              inactiveColor: context.palette.inactiveIcon,
            ),
            allTabsOrderedAccordingToIndex[1].getBottomNavigationBarItem(
              isCurrentTab: currentTabIndex == 1,
              // thereWasTabChange: thereWasTabChange,
              activeColor: context.palette.activeIcon,
              inactiveColor: context.palette.inactiveIcon,
            ),
            allTabsOrderedAccordingToIndex[2].getBottomNavigationBarItem(
              isCurrentTab: currentTabIndex == 2,
              // thereWasTabChange: thereWasTabChange,
              activeColor: context.palette.activeIcon,
              inactiveColor: context.palette.inactiveIcon,
            ),
          ],
        );
      },
    );
  }
}

@lazySingleton
class TabsStateManager with ChangeNotifier {
  int _currentTabIndex = 0;

  int get currentTab => _currentTabIndex;

  void changeCurrentTab(TabsRouter router, int newTabIndex) {
    if (_currentTabIndex != newTabIndex) {
      _currentTabIndex = newTabIndex;
      router.setActiveIndex(newTabIndex);
      customNotifyListeners();
    }
  }

  void customNotifyListeners() {
    super.notifyListeners();
  }
}

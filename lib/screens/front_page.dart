import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/bag/stateful/theme.dart';
import '../common/dependency_injection/dependency_injection.dart';
import '../common/navigation/my_bottom_nav_bar.dart';
import '../common/navigation/navigation_tab.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: context.colors.backgroundColor,
        systemNavigationBarColor: context.colors.bottomNavigationBarColor,
        statusBarIconBrightness: context.brightness,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarBrightness: context.brightness == Brightness.light ? Brightness.dark : Brightness.light,
      ),
      child: AutoTabsScaffold(
        backgroundColor: context.colors.backgroundColor,
        routes: [
          allTabsOrderedAccordingToIndex[0].tabRoute,
          allTabsOrderedAccordingToIndex[1].tabRoute,
          allTabsOrderedAccordingToIndex[2].tabRoute,
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          final isRegistered = getIt.isRegistered(instance: tabsRouter);
          if (isRegistered) {
            getIt.unregister(instance: tabsRouter);
          }
          getIt.registerSingleton(tabsRouter);
          return SizedBox();
          // return const MyBottomNavBar();
        },
      ),
    );
  }
}

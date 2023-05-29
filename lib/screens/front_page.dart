import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/theme.dart';

import '../common/dependency_injection/dependency_injection.dart';
import '../common/navigation/auto_router/app_router.dart';
import '../common/navigation/my_bottom_nav_bar.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: context.theme.colorScheme.background,
      routes: const [
        ExploreRoute(),
        EventsRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        final isRegistered = getIt.isRegistered(instance: tabsRouter);
        if (isRegistered) {
          getIt.unregister(instance: tabsRouter);
        }
        getIt.registerSingleton(tabsRouter);
        return const MyBottomNavBar();
      },
    );
  }
}

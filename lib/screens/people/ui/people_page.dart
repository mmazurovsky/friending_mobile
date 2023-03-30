import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/navigation/navigation_tab.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: allTabsOrderedAccordingToIndex[0].scrollController,
      slivers: [
        const SliverAppBar(
          title: Text('Main Page'),
          floating: true,
          snap: true,
          centerTitle: true,
        ),
        SliverToBoxAdapter(
            child: PlatformElevatedButton(
                onPressed: () => context.router.push(SignInRoute()),
                child: Text('Sign in')))
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../common/bag/stateful/spaces.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/navigation/navigation_tab.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: allTabsOrderedAccordingToIndex[0].scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: context.spacesWatch.unit2,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: context.spacesWatch.unit1),
            child: Text('Users nearby'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // return widget for each nearby user
            },
            childCount: 10, // replace with actual number of nearby users
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('Users with common interests'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // return widget for each user with common interests
            },
            childCount:
                10, // replace with actual number of users with common interests
          ),
        ),
        SliverToBoxAdapter(
            child: PlatformElevatedButton(
                onPressed: () => context.router.push(SignInRoute()),
                child: Text('Sign in'))),
        SliverToBoxAdapter(
          child: SizedBox(
            height: context.spacesWatch.unit2,
          ),
        ),
      ],
    );
  }
}

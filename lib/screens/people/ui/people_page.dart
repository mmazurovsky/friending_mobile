import 'package:flutter/material.dart';

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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('Item $index'),
            ),
            childCount: 100,
          ),
        )
      ],
    );
  }
}

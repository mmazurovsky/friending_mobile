import 'package:flutter/material.dart';

import '../../../common/navigation/my_bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavBar(),
      body: CustomScrollView(
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
      ),
    );
  }
}

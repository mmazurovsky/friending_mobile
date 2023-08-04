import 'package:flutter/material.dart';

class CurrentPairPage extends StatelessWidget {
  const CurrentPairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Text('CurrentPairPage'),
        ),
      ],
    );
  }
}


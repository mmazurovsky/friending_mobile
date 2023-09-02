import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/theme.dart';

import 'common/navigation/my_bottom_nav_bar.dart';

class ScreenWrapperWithBottomNavBar extends StatelessWidget {
  final Widget child;
  const ScreenWrapperWithBottomNavBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        child,
        Positioned(
          // bottom: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 90,
                color: context.colors.bottomNavigationBarColor,
                alignment: Alignment.topCenter,
                child: const MyBottomNavBar(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

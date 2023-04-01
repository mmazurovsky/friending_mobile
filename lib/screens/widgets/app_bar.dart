import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../common/bag/stateful/theme.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../../common/bag/stateful/spaces.dart';

class CustomAppBarWithBackButton extends StatelessWidget {
  const CustomAppBarWithBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacesWatch.unit1),
      child: Row(
        children: [
          PlatformIconButton(
            onPressed: context.router.pop,
            icon: Icon(Ionicons.arrow_back, color: context.theme.indicatorColor),
          ),
        ],
      ),
    );
  }
}

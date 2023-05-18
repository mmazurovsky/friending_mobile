import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/theme.dart';
import 'package:flutter_mobile_starter/screens/widgets/custom_edge_insets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

class CustomAppBarWithBackButton extends StatelessWidget {
  const CustomAppBarWithBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalUnit1,
      child: Row(
        children: [
          PlatformIconButton(
            onPressed: context.router.pop,
            icon:
                Icon(Ionicons.arrow_back, color: context.theme.indicatorColor),
          ),
        ],
      ),
    );
  }
}

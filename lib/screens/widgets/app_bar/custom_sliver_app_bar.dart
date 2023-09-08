import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/bag/stateful/theme.dart';
import 'app_bar_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget? titleWidget;
  final bool isBackButtonOn;
  final List<Widget>? actions;
  const CustomSliverAppBar({
    super.key,
    this.titleWidget,
    required this.isBackButtonOn,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: context.colors.appBarColor,
      centerTitle: false,
      pinned: true,
      leading: isBackButtonOn
          ? AppBarButton(
              iconWidget: Icon(
                Ionicons.chevron_back_outline,
                color: context.colors.staticIconsColor,
              ),
              onTap: Navigator.of(context).pop,
            )
          : null,
      title: titleWidget,
      actions: actions,
    );
  }
}

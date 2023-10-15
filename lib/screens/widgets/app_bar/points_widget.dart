import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/theme.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../profile/state/points_change_notifier.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<PointsChangeNotifier>().pointsCount;
    return IconButton(
      onPressed: () {},
      icon: Container(
        // width: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [
          //   // Color.fromARGB(255, 251, 237, 254),
          //   // Colors.transparent,
          //   context.colors.appBarColor,

          //   Color.fromARGB(255, 244, 185, 255),
          //   // Color.fromARGB(255, 145, 0, 0),
          // ]),
          color: context.colors.activeIndicatorColor,

          //
          //Color.fromARGB(255, 251, 255, 0),
          // context.colors.appBarAction,
          borderRadius: BorderRadius.circular(20),
        ),
        // alignment: Alignment.center,
        child: AnimatedDigitWidget(
          // prefix: '🔗',
          value: value,
          textStyle: context.styles.bodyBold.copyWith(color: context.colors.onContainerTextColor),
          // suffix: ' ',
          // loop:
        ),
      ),
    );
  }
}

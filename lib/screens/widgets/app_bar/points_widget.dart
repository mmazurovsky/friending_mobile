import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../profile/state/points_change_notifier.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<PointsChangeNotifier>().pointsCount;
    return IconButton(
      onPressed: () {},
      icon: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            Color.fromARGB(255, 251, 237, 254),
            Color.fromARGB(255, 242, 168, 255),
          ]),
          color: context.colors.appBarAction,
          borderRadius: BorderRadius.circular(15),
        ),
        child: AnimatedDigitWidget(
          prefix: '🔗',
          value: value,
          textStyle: context.styles.bodyBold,
          suffix: ' ',
          // loop:
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../common/bag/stateful/theme.dart';
import 'package:ionicons/ionicons.dart';

class TrailingArrowIcon extends StatelessWidget {
  const TrailingArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Ionicons.chevron_forward_outline,
      size: 26,
      color: context.theme.primaryColor,
    );
  }
}

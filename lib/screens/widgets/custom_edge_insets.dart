import 'package:flutter/material.dart';

import '../../common/bag/stateful/spaces.dart';

class CEdgeInsets {
  static EdgeInsets get horizontalStandart =>
      const EdgeInsets.symmetric(horizontal: Spaces.unit3);
  static EdgeInsets get horizontalStandartVerticalUnit1 =>
      const EdgeInsets.symmetric(
        horizontal: Spaces.unit3,
        vertical: Spaces.unit1,
      );
  static EdgeInsets get horizontalUnit1 =>
      const EdgeInsets.symmetric(horizontal: Spaces.unit1);
}

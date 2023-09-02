import 'package:flutter/material.dart';

import '../bag/spaces.dart';

class CEdgeInsets {
  static EdgeInsets get horizontalStandart => const EdgeInsets.symmetric(horizontal: ConstSpaces.unit3);
  static EdgeInsets get horizontalSmall => const EdgeInsets.symmetric(horizontal: 7);

  static EdgeInsets get horizontalStandartVerticalUnit1 => const EdgeInsets.symmetric(
        horizontal: ConstSpaces.unit3,
        vertical: ConstSpaces.unit1,
      );
  static EdgeInsets get horizontalUnit1 => const EdgeInsets.symmetric(horizontal: ConstSpaces.unit1);
}

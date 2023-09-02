import 'package:flutter/material.dart';

import '../../bag/spaces.dart';
import '../../bag/stateful/styles.dart';
import '../custom_edge_insets.dart';

class CustomScreenHeader extends StatelessWidget {
  final String text;
  const CustomScreenHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CEdgeInsets.horizontalStandart.copyWith(
        bottom: ConstSpaces.unit5,
      ),
      child: Text(
        text,
        style: context.styles.genericHeader,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/bag/stateful/styles.dart';
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
        bottom: 20,
      ),
      child: Text(
        text,
        style: context.styles.genericHeader,
      ),
    );
  }
}

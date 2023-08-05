import 'package:flutter/material.dart';

import '../../../common/bag/stateful/theme.dart';
import '../custom_edge_insets.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitle;

  const SectionTitle(
    this.sectionTitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          sectionTitle,
          style: context.colors.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

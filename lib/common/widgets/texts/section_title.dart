import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/styles.dart';

import '../../bag/stateful/theme.dart';
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
          style: context.styles.titleText,
        ),
      ),
    );
  }
}

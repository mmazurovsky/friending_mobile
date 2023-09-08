import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/styles.dart';

import '../../../common/bag/stateful/theme.dart';
import '../custom_edge_insets.dart';

class SectionSubtitle extends StatelessWidget {
  final String subtitle;
  const SectionSubtitle(
    this.subtitle, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          subtitle,
          style: context.styles.bodyText
        ),
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';

import '../../../common/bag/spaces.dart';
import '../custom_edge_insets.dart';
import 'section_divider.dart';

class SectionDividerWithSpacers extends StatelessWidget {
  const SectionDividerWithSpacers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: ConstSpaces.unit4),
        Padding(
          padding: CEdgeInsets.horizontalStandart,
          child: const SectionDivider(),
        ),
        const SizedBox(height: ConstSpaces.unit4),
      ],
    );
  }
}

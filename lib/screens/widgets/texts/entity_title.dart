import 'package:flutter/material.dart';

import '../../../common/bag/stateful/theme.dart';
import '../custom_edge_insets.dart';

class EntityTitle extends StatelessWidget {
  const EntityTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: context.colors.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/bag/stateful/theme.dart';
import '../../../common/data/models/language_model.dart';
import '../custom_edge_insets.dart';
import '../row/row_of_widgets.dart';

class EntitySubtitle extends StatelessWidget {
  final List<LanguageModel> languages;
  const EntitySubtitle({
    Key? key,
    required this.languages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: RowOfWidgets(
        children: [
          Text(
            'User speaking',
            style: context.theme.textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          //TODO: languages widget
        ],
      ),
    );
  }
}

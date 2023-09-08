import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/styles.dart';

import '../../../common/data/models/language_model.dart';
import '../custom_edge_insets.dart';
import '../row/row_of_widgets.dart';

class EntitySubtitle extends StatelessWidget {
  final int age;
  final List<LanguageModel> languages;
  const EntitySubtitle({
    Key? key,
    required this.age,
    required this.languages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: RowOfWidgets(
        children: [
          Text(
            '$age y.o.',
            style: context.styles.genericHeader,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          ...languages.map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                e.emojiCode,
                style: context.styles.genericHeader,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

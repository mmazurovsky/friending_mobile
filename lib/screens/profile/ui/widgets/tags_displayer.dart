import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_edge_insets.dart';
import '../../state/profile_texts_manager.dart';

class TagsDisplayer extends StatelessWidget {
  const TagsDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    final tagsToDisplay = context.watch<ProfileTextsManager>().tagsToDisplay;
    // create widget to display tags of profile as wrap with chips
    return tagsToDisplay.isNotEmpty
        ? Padding(
            padding: CEdgeInsets.horizontalStandart,
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                runSpacing: 1,
                spacing: 8,
                children: tagsToDisplay.map(
                  (e) {
                    return Chip(
                      label: Text(e),
                      onDeleted: () {
                        context.read<ProfileTextsManager>().removeTag(e);
                      },
                    );
                  },
                ).toList()),
          )
        : Container(
            padding: CEdgeInsets.horizontalStandart,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Add your first tags to see people who share your interests! Example: \"cats, vegan, radiohead, crying\"",
            ),
          );
  }
}

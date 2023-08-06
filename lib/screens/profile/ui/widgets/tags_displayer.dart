import 'package:flutter/material.dart';

import '../../../../common/bag/stateful/theme.dart';
import '../../../../common/data/entities/tag_entity.dart';
import '../../../widgets/custom_edge_insets.dart';

class TagsDisplayer extends StatelessWidget {
  final List<TagEntity> tagsToDisplay;
  final Widget displayIfTagsEmpty;
  final void Function(String)? onDeleteTag;
  const TagsDisplayer({
    super.key,
    required this.tagsToDisplay,
    required this.displayIfTagsEmpty,
    this.onDeleteTag,
  });

  @override
  Widget build(BuildContext context) {
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
                      label: Text(e.title),
                      backgroundColor: e.isHighlighted ? context.colors.activeIndicatorColor : context.colors.inactiveIndicatorColor,
                      onDeleted: onDeleteTag != null ? () => onDeleteTag!(e.title) : null,
                    );
                  },
                ).toList()),
          )
        : displayIfTagsEmpty;
  }
}

import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

import '../../../../common/bag/stateful/styles.dart';
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
            child: CustomWrap(
                children: tagsToDisplay.map(
              (e) {
                return CustomChip(
                  tagData: e,
                  onDeleteTag: onDeleteTag,
                );
              },
            ).toList()),
          )
        : displayIfTagsEmpty;
  }
}

class CustomChip extends StatelessWidget {
  final TagEntity tagData;
  final void Function(String)? onDeleteTag;

  const CustomChip({
    super.key,
    required this.tagData,
    this.onDeleteTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDeleteTag != null ? () => onDeleteTag!(tagData.title) : null,
      child: Container(
        child: Text(
          tagData.title,
          style: tagData.isHighlighted ? context.styles.activeChip : context.styles.inactiveChip,
        ),
      ),
    );
  }
}

class CustomWrap extends StatelessWidget {
  final List<Widget> children;
  final int? maxLines;
  const CustomWrap({
    super.key,
    required this.children,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return maxLines != null
        ? ExtendedWrap(
            maxLines: maxLines!,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            runSpacing: 1,
            spacing: 8,
            children: children,
          )
        : Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            runSpacing: 1,
            spacing: 8,
            children: children,
          );
  }
}

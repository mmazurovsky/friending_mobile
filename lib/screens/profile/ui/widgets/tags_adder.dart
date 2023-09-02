import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/widgets/custom_edge_insets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/custom_text_fields.dart';
import '../../state/profile_texts_manager.dart';

class TagsAdder extends StatelessWidget {
  const TagsAdder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: Row(
        children: [
          Expanded(
            child: CTextField(
              requiresMargin: false,
              title: 'Your tags (interests)',
              textInputType: TextInputType.text,
              isSecret: false,
              textEditingController:
                  context.read<ProfileTextsAndTagsManager>().addTagsController,
              focusNode:
                  context.read<ProfileTextsAndTagsManager>().addTagsFocusNode,
            ),
          ),
          // const SizedBox(width: 5),
          PlatformTextButton(
            alignment: Alignment.center,
            onPressed: context.read<ProfileTextsAndTagsManager>().addTags,
            child: const Text(
              'Add tags',
            ),
          ),
          // const SizedBox(width: 5),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_fields.dart';
import '../../state/profile_texts_manager.dart';

class TagsAdder extends StatelessWidget {
  const TagsAdder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CTextField(
            title: 'Add tags',
            textInputType: TextInputType.text,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().addTagsController,
            focusNode: context.read<ProfileTextsManager>().addTagsFocusNode,
          ),
        ),
        // const SizedBox(width: 5),
        PlatformTextButton(
          onPressed: context.read<ProfileTextsManager>().addTags,
          child: const Text('Add all'),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

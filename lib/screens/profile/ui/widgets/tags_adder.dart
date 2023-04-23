import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_fields.dart';
import '../../state/profile_editing_manager.dart';

class TagsAdder extends StatelessWidget {
  const TagsAdder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CTextField(
          title: 'Add tags',
          textInputType: TextInputType.text,
          isSecret: false,
          textEditingController:
              context.read<ProfileEditingManager>().addTagsController,
          focusNode: context.read<ProfileEditingManager>().addTagsFocusNode,
          fillColor: Colors.amber,
        ),
        const SizedBox(width: 5),
        PlatformElevatedButton(
          onPressed: context.read<ProfileEditingManager>().addTags,
          child: const Text('Add all'),
        ),
      ],
    );
  }
}

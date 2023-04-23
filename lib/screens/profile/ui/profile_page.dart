import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/stateful/spaces.dart';
import '../../../common/utils/extensions.dart';
import '../state/profile_editing_manager.dart';
import 'widgets/date_widget.dart';
import 'widgets/profile_images_grid.dart';
import 'widgets/username_text_field.dart';

class ProfileEditingPage extends StatelessWidget {
  const ProfileEditingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileImagesGrid(),
          ],
        ),
      ),
    );
  }
}

class GeneralInfoEditingSection extends StatelessWidget {
  const GeneralInfoEditingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NicknameTextField(
          focusNode: context.read<ProfileEditingManager>().usernameFocusNode,
          textEditingController:
              context.read<ProfileEditingManager>().usernameController,
          triggerValidationOnForm: triggerValidationOnForm,
        ),
        const DateWidget(),
      ]
          .mapWidgetsSeparated(
            separator: const SizedBox(
              height: Spaces.unit2,
            ),
          )
          .toList(),
    );
  }
}

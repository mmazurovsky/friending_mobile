import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/stateful/spaces.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/utils/extensions.dart';
import '../../widgets/custom_text_fields.dart';
import '../repo/profile_repo.dart';
import '../state/profile_editing_manager.dart';
import '../state/profile_images_manager.dart';
import '../state/profile_texts_manager.dart';
import 'widgets/date_widget.dart';
import 'widgets/profile_images_grid.dart';
import 'widgets/username_text_field.dart';

class ProfileEditingPage extends StatelessWidget {
  const ProfileEditingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImagesManager = getIt<ProfileImagesManager>();
    final profileTextsManager = getIt<ProfileTextsManager>();
    final profileEditingManager = ProfileEditingManager(
      profileImagesManager,
      profileTextsManager,
      getIt<ProfileRepo>(),
      getIt<AuthRepo>(),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => profileImagesManager),
        ChangeNotifierProvider(create: (_) => profileTextsManager),
        ChangeNotifierProvider(create: (_) => profileEditingManager),
      ],
      builder: (context, _) {
        return Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: const [
                ProfileImagesGrid(),
                SizedBox(height: 20),
                GeneralInfoEditingSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class GeneralInfoEditingSection extends StatefulWidget {
  const GeneralInfoEditingSection({super.key});

  @override
  State<GeneralInfoEditingSection> createState() =>
      _GeneralInfoEditingSectionState();
}

class _GeneralInfoEditingSectionState extends State<GeneralInfoEditingSection> {
  final _formKey = GlobalKey<FormState>();

  void _triggerFormValidation() {
    _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameTextField(
            focusNode: context.read<ProfileTextsManager>().usernameFocusNode,
            textEditingController:
                context.read<ProfileTextsManager>().usernameController,
            triggerValidationOnForm: _triggerFormValidation,
          ),
          const DateWidget(),
          CTextField(
            title: 'Description',
            textInputType: TextInputType.text,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().descriptionController,
            focusNode: context.read<ProfileTextsManager>().descriptionFocusNode,
            fillColor: Colors.transparent,
          ),
          CTextField(
            title: 'Looking for',
            textInputType: TextInputType.text,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().lookingForController,
            focusNode: context.read<ProfileTextsManager>().lookingForFocusNode,
            fillColor: Colors.transparent,
          ),
          CTextField(
            title: 'Instragram username',
            textInputType: TextInputType.text,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().instagramUsernameController,
            focusNode:
                context.read<ProfileTextsManager>().instagramUsernameFocusNode,
            fillColor: Colors.transparent,
          ),
          CTextField(
            title: 'Telegram username',
            textInputType: TextInputType.text,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().telegramUsernameController,
            focusNode:
                context.read<ProfileTextsManager>().telegramUsernameFocusNode,
            fillColor: Colors.transparent,
          ),
        ]
            .mapWidgetsSeparated(
              separator: const SizedBox(
                height: Spaces.unit2,
              ),
            )
            .toList(),
      ),
    );
  }
}

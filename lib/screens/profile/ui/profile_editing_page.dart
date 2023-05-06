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
import 'widgets/tags_adder.dart';
import 'widgets/tags_displayer.dart';
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
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ProfileImagesGrid(),
                  SizedBox(height: 20),
                  TagsEditingSection(),
                  SizedBox(height: 20),
                  TextInfoEditingSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TagsEditingSection extends StatelessWidget {
  const TagsEditingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TagsAdder(),
        SizedBox(
          height: 10,
        ),
        TagsDisplayer(),
      ],
    );
  }
}

class TextInfoEditingSection extends StatefulWidget {
  const TextInfoEditingSection({super.key});

  @override
  State<TextInfoEditingSection> createState() => _TextInfoEditingSectionState();
}

class _TextInfoEditingSectionState extends State<TextInfoEditingSection> {
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
            textInputType: TextInputType.multiline,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().descriptionController,
            focusNode: context.read<ProfileTextsManager>().descriptionFocusNode,
            fillColor: Colors.transparent,
            maxLines: 7,
            maxLength: 32 * 7,
          ),
          CTextField(
            title: 'Looking for',
            textInputType: TextInputType.multiline,
            isSecret: false,
            textEditingController:
                context.read<ProfileTextsManager>().lookingForController,
            focusNode: context.read<ProfileTextsManager>().lookingForFocusNode,
            fillColor: Colors.transparent,
            maxLines: 4,
            maxLength: 32 * 4,
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
          const SizedBox(
            height: 50,
          ),
        ]
            .mapWidgetsSeparated(
              separator: const SizedBox(
                height: Spaces.unit4,
              ),
            )
            .toList(),
      ),
    );
  }
}

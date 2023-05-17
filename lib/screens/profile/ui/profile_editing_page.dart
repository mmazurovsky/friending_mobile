import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/stateful/spaces.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/utils/extensions.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/custom_text_fields.dart';
import '../../widgets/snack_bar.dart';
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

  void _onUpdateProfile({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) async {
    final scaffoldMessengerKey =
        context.read<GlobalKey<ScaffoldMessengerState>>();
    await context.read<ProfileImagesManager>().uploadNewPhotosToRemote();
    final formIsValid = formKey.currentState?.validate();
    if (formIsValid != null && formIsValid) {
      final areThereUploadedPhotosInManagers =
          context.read<ProfileImagesManager>().areThereUploadedPhotosInManagers;
      if (areThereUploadedPhotosInManagers) {
        final areThereTags =
            context.read<ProfileTextsAndTagsManager>().tagsToDisplay.isNotEmpty;
        if (areThereTags) {
          context.read<ProfileEditingManager>().updateProfile();
        } else {
          scaffoldMessengerKey.currentState
            ?..hideCurrentSnackBar()
            ..showCSnackBar(
              const CustomSnackBarContent('Please, add tags'),
            );
        }
      } else {
        scaffoldMessengerKey.currentState
          ?..hideCurrentSnackBar()
          ..showCSnackBar(
            const CustomSnackBarContent('Please, add at least one photo'),
          );
      }
    } else {
      scaffoldMessengerKey.currentState
        ?..hideCurrentSnackBar()
        ..showCSnackBar(
          const CustomSnackBarContent(
            'Some text field is not valid, pay attention to red borders',
          ),
        );
      //TODO: add validators to text fields
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileImagesManager = getIt<ProfileImagesManager>();
    final profileTextsAndTagsManager = getIt<ProfileTextsAndTagsManager>();
    final profileEditingManager = ProfileEditingManager(
      profileImagesManager,
      profileTextsAndTagsManager,
      getIt<ProfileRepo>(),
      getIt<AuthRepo>(),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => profileImagesManager),
        ChangeNotifierProvider(create: (_) => profileTextsAndTagsManager),
        ChangeNotifierProvider(create: (_) => profileEditingManager),
      ],
      builder: (context, _) {
        final _formKey = GlobalKey<FormState>();

        return Provider(
          create: (context) => _formKey,
          builder: (context, _) => Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileImagesGrid(),
                      const SizedBox(height: 20),
                      const TagsEditingSection(),
                      const SizedBox(height: 20),
                      const TextInfoEditingSection(),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: CEdgeInsets.horizontalStandart,
                          child: PlatformElevatedButton(
                            child: const Text('Update profile'),
                            onPressed: () => _onUpdateProfile(
                              context: context,
                              formKey: _formKey,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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

class TextInfoEditingSection extends StatelessWidget {
  const TextInfoEditingSection({super.key});

  String? _checkDescription(String? description) {
    if (description == null) {
      return 'Description is required';
    } else {
      if (description.length < 32) {
        return 'Please, write at least 32 characters, it is just about 7 words 😉';
      } else {
        return null;
      }
    }
  }

  String? _checkLookingFor(String? lookingFor) {
    if (lookingFor == null) {
      return 'Description is required';
    } else {
      if (lookingFor.length < 3) {
        return 'Please, write at least 3 characters';
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UsernameTextField(
          focusNode:
              context.read<ProfileTextsAndTagsManager>().usernameFocusNode,
          textEditingController:
              context.read<ProfileTextsAndTagsManager>().usernameController,
          triggerValidationOnForm: () {
            context.read<GlobalKey<FormState>>().currentState?.validate();
          },
        ),
        const DateWidget(),
        CTextField(
          title: 'Description',
          textInputType: TextInputType.multiline,
          isSecret: false,
          textEditingController:
              context.read<ProfileTextsAndTagsManager>().descriptionController,
          focusNode:
              context.read<ProfileTextsAndTagsManager>().descriptionFocusNode,
          fillColor: Colors.transparent,
          maxLines: 7,
          maxLength: 32 * 7,
          counter: const SizedBox(),
          validatorFunction: _checkDescription,
        ),
        CTextField(
          title: 'Looking for',
          textInputType: TextInputType.multiline,
          isSecret: false,
          textEditingController:
              context.read<ProfileTextsAndTagsManager>().lookingForController,
          focusNode:
              context.read<ProfileTextsAndTagsManager>().lookingForFocusNode,
          fillColor: Colors.transparent,
          maxLines: 4,
          maxLength: 32 * 4,
          counter: const SizedBox(),
          validatorFunction: _checkLookingFor,
        ),
        CTextField(
          title: 'Instragram username',
          textInputType: TextInputType.text,
          isSecret: false,
          textEditingController: context
              .read<ProfileTextsAndTagsManager>()
              .instagramUsernameController,
          focusNode: context
              .read<ProfileTextsAndTagsManager>()
              .instagramUsernameFocusNode,
          fillColor: Colors.transparent,
        ),
        CTextField(
          title: 'Telegram username',
          textInputType: TextInputType.text,
          isSecret: false,
          textEditingController: context
              .read<ProfileTextsAndTagsManager>()
              .telegramUsernameController,
          focusNode: context
              .read<ProfileTextsAndTagsManager>()
              .telegramUsernameFocusNode,
          fillColor: Colors.transparent,
        ),
      ]
          .mapWidgetsSeparated(
            separator: const SizedBox(
              height: Spaces.unit4,
            ),
          )
          .toList(),
    );
  }
}

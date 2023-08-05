import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../../../common/bag/spaces.dart';
import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/utils/extensions.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/custom_text_fields.dart';
import '../../widgets/loading.dart';
import '../../widgets/snack_bar.dart';
import '../state/profile_editing_manager.dart';
import '../state/profile_images_manager.dart';
import '../state/profile_texts_manager.dart';
import 'widgets/date_widget.dart';
import 'widgets/profile_images_grid.dart';
import 'widgets/tags_adder.dart';
import 'widgets/tags_displayer.dart';
import 'widgets/username_text_field.dart';

class ProfileEditingPage extends StatefulWidget {
  const ProfileEditingPage({super.key});

  @override
  State<ProfileEditingPage> createState() => _ProfileEditingPageState();
}

class _ProfileEditingPageState extends State<ProfileEditingPage> {
  final formKey = GlobalKey<FormState>();
  final profileEditingManager = getIt<ProfileEditingManager>();

  void _onUpdateProfile({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
  }) async {
    final scaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();
    await context.read<ProfileImagesManager>().uploadNewPhotosToRemote();

    List<CustomSnackBarContent> messagesOfInvalidity = [];

    final areThereUploadedPhotosInManagers = context.read<ProfileImagesManager>().areThereUploadedPhotosInManagers;
    if (!areThereUploadedPhotosInManagers) {
      messagesOfInvalidity.add(
        const CustomSnackBarContent('Please, add at least one photo'),
      );
    }

    final areThereTags = context.read<ProfileTextsAndTagsManager>().tagsToDisplay.isNotEmpty;
    if (!areThereTags) {
      messagesOfInvalidity.add(
        const CustomSnackBarContent('Please, add tags'),
      );
    }

    final formIsValid = formKey.currentState?.validate();
    if (formIsValid == null || !formIsValid) {
      messagesOfInvalidity.add(
        const CustomSnackBarContent(
          'Some text field is not valid, pay attention to red borders',
        ),
      );
    }

    final instagramNotFilledCorrectly = context.read<ProfileTextsAndTagsManager>().instagramUsernameController.text.length < 3;
    final telegramNotFilledCorrectly = context.read<ProfileTextsAndTagsManager>().telegramUsernameController.text.length < 3;

    if (instagramNotFilledCorrectly && telegramNotFilledCorrectly) {
      messagesOfInvalidity.add(
        const CustomSnackBarContent(
          'One of social media fields should be correct',
        ),
      );
    }

    if (messagesOfInvalidity.isNotEmpty) {
      scaffoldMessengerKey.currentState
        ?..hideCurrentSnackBar()
        ..showCSnackBar(messagesOfInvalidity.first);
    } else {
      context.read<ProfileEditingManager>().updateProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<ProfileEditingManager>(),
        ),
        ChangeNotifierProvider(create: (_) => profileEditingManager),
        ChangeNotifierProvider(create: (_) => profileEditingManager.imagesManager),
        ChangeNotifierProvider(create: (_) => profileEditingManager.textsManager),
        Provider(create: (context) => formKey),
      ],
      builder: (context, _) {
        final isItProfileCreation = context.read<ProfileEditingManager>().isItProfileCreation;
        return Scaffold(
          body: SafeArea(
            child: context.watch<ProfileImagesManager>().isLoading || context.watch<ProfileTextsAndTagsManager>().isLoading
                ? const LoadingContainer()
                : SingleChildScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Padding(
                            padding: CEdgeInsets.horizontalStandart,
                            child: Text(
                              isItProfileCreation ? 'Profile creation' : 'Profile editing',
                              style: context.styles.genericLargeHeader,
                            ),
                          ),
                          const SizedBox(height: 40),
                          const ProfileImagesGrid(),
                          const SizedBox(height: 40),
                          const TagsEditingSection(),
                          const SizedBox(height: 40),
                          const TextInfoEditingSection(),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: CEdgeInsets.horizontalStandart,
                              child: PlatformElevatedButton(
                                child: Text(isItProfileCreation ? 'Create profile' : 'Update profile'),
                                onPressed: () => _onUpdateProfile(
                                  context: context,
                                  formKey: formKey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
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
      children: [
        const TagsAdder(),
        const SizedBox(
          height: 10,
        ),
        TagsDisplayer(
          tagsToDisplay: context.watch<ProfileTextsAndTagsManager>().tagsToDisplay,
          displayIfTagsEmpty: Container(
            padding: CEdgeInsets.horizontalStandart,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Add your first tags to see people who share your interests! Example: \"cats, vegan, radiohead, crying\"",
            ),
          ),
          onDeleteTag: (String e) {
            context.read<ProfileTextsAndTagsManager>().removeTag(e);
          },
        ),
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
      return 'Looking for section is required';
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
          focusNode: context.read<ProfileTextsAndTagsManager>().usernameFocusNode,
          textEditingController: context.read<ProfileTextsAndTagsManager>().usernameController,
          triggerValidationOnForm: () {
            context.read<GlobalKey<FormState>>().currentState?.validate();
          },
        ),
        const DateWidget(),
        CTextField(
          title: 'Description',
          textInputType: TextInputType.multiline,
          isSecret: false,
          textEditingController: context.read<ProfileTextsAndTagsManager>().descriptionController,
          focusNode: context.read<ProfileTextsAndTagsManager>().descriptionFocusNode,
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
          textEditingController: context.read<ProfileTextsAndTagsManager>().lookingForController,
          focusNode: context.read<ProfileTextsAndTagsManager>().lookingForFocusNode,
          fillColor: Colors.transparent,
          maxLines: 4,
          maxLength: 32 * 4,
          counter: const SizedBox(),
          validatorFunction: _checkLookingFor,
        ),
        CTextField(
          title: 'Instagram username',
          textInputType: TextInputType.text,
          isSecret: false,
          textEditingController: context.read<ProfileTextsAndTagsManager>().instagramUsernameController,
          focusNode: context.read<ProfileTextsAndTagsManager>().instagramUsernameFocusNode,
          fillColor: Colors.transparent,
        ),
        SwitchWithTitle(
          title: context.watch<ProfileTextsAndTagsManager>().instagramSecureStatus == SecureFieldStatusEnum.private
              ? 'Instagram is only visible to your soulmate'
              : 'Instagram is visible for everyone',
          value: context.watch<ProfileTextsAndTagsManager>().instagramSecureStatus == SecureFieldStatusEnum.public,
          onChanged: (value) {
            context.read<ProfileTextsAndTagsManager>().changeInstagramIsPrivate();
          },
        ),
        CTextField(
          title: 'Telegram username',
          textInputType: TextInputType.text,
          isSecret: false,
          textEditingController: context.read<ProfileTextsAndTagsManager>().telegramUsernameController,
          focusNode: context.read<ProfileTextsAndTagsManager>().telegramUsernameFocusNode,
          fillColor: Colors.transparent,
        ),
        SwitchWithTitle(
          title: context.watch<ProfileTextsAndTagsManager>().telegramSecureStatus == SecureFieldStatusEnum.private
              ? 'Telegram is only visible to your soulmate'
              : 'Telegram is visible for everyone',
          value: context.watch<ProfileTextsAndTagsManager>().telegramSecureStatus == SecureFieldStatusEnum.public,
          onChanged: (value) {
            context.read<ProfileTextsAndTagsManager>().changeTelegramIsPrivate();
          },
        ),
        CTextField(
          title: 'WhatsApp phone',
          textInputType: TextInputType.phone,
          isSecret: false,
          textEditingController: context.read<ProfileTextsAndTagsManager>().whatsappPhoneController,
          focusNode: context.read<ProfileTextsAndTagsManager>().whatsappPhoneFocusNode,
          fillColor: Colors.transparent,
        ),
        SwitchWithTitle(
          title: context.watch<ProfileTextsAndTagsManager>().whatsappSecureStatus == SecureFieldStatusEnum.private
              ? 'WhatsApp is only visible to your soulmate'
              : 'WhatsApp is visible for everyone',
          value: context.watch<ProfileTextsAndTagsManager>().whatsappSecureStatus == SecureFieldStatusEnum.public,
          onChanged: (value) {
            context.read<ProfileTextsAndTagsManager>().changeWhatsappIsPrivate();
          },
        ),
      ]
          .mapWidgetsSeparated(
            separator: const SizedBox(
              height: ConstSpaces.unit5,
            ),
          )
          .toList(),
    );
  }
}

class SwitchWithTitle extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  const SwitchWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CEdgeInsets.horizontalStandart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.styles.switchTitle,
          ),
          PlatformSwitch(
            value: value,
            onChanged: onChanged,
            activeColor: context.colors.activeIndicatorColor,
          ),
        ],
      ),
    );
  }
}

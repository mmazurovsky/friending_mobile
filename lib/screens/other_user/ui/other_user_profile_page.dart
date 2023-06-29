import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../common/animations/wrappers.dart';
import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/bag/strings.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/service/open_link_service.dart';
import '../../profile/ui/widgets/tags_displayer.dart';
import '../../widgets/buttons/button_content.dart';
import '../../widgets/canvas/profile_canvas.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/loading.dart';
import '../../widgets/modal_bottom_sheet/modal_bottom_sheet_content.dart';
import '../../widgets/social_links_list.dart';
import '../../widgets/spacers/section_divider_with_spacers.dart';
import '../../widgets/texts/expandable_text_section.dart';
import '../../widgets/texts/section_subtitle.dart';
import '../../widgets/texts/section_title.dart';
import '../state/other_user_manager.dart';

class OtherUserProfilePage extends StatefulWidget {
  final ShortReadUserModel shortProfile;
  const OtherUserProfilePage({
    Key? key,
    required this.shortProfile,
  }) : super(key: key);

  @override
  _OtherUserProfilePageState createState() => _OtherUserProfilePageState();
}

class _OtherUserProfilePageState extends State<OtherUserProfilePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<OtherUserManager>()
        ..loadOtherUserProfile(widget.shortProfile.id),
      builder: (context, child) => EntityPageCanvas(
        data: widget.shortProfile,
        loadableContent: const _OtherProfileContent(),
        scrollController: _scrollController,
        isBackButtonOn: false,
      ),
    );
  }
}

class _OtherProfileContent extends StatefulWidget {
  const _OtherProfileContent({
    Key? key,
  }) : super(key: key);

  @override
  State<_OtherProfileContent> createState() => _OtherProfileContentState();
}

class _OtherProfileContentState extends State<_OtherProfileContent> {
  @override
  Widget build(BuildContext context) {
    return context.watch<OtherUserManager>().isLoading
        ? const LoadingContainer()
        : SlideAnimationWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                //TODO: create button
                // SizedBox(
                //   width: double.infinity,
                //   child: Padding(
                //     padding: CEdgeInsets.horizontalStandart,
                //     child: PlatformElevatedButton(
                //       onPressed: () => showModalBottomSheet(
                //         context: context,
                //         builder: (context) => const SettingsSelector(),
                //       ),
                //       child: Text(
                //         'Open settings',
                //         style: context.theme.textTheme.titleMedium?.copyWith(
                //           fontSize: 17,
                //           color: context.theme.colorScheme.onPrimary,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 20),
                const SectionTitle('Tags'),
                const SizedBox(height: 10),
                TagsDisplayer(
                  tagsToDisplay: context
                      .read<OtherUserManager>()
                      .shortProfile
                      .tagsEntities,
                  displayIfTagsEmpty: Container(),
                ),
                const SectionDividerWithSpacers(),
                const SectionTitle('About'),
                Padding(
                  padding: CEdgeInsets.horizontalStandart,
                  child: ExpandableTextSection(
                    context.read<OtherUserManager>().shortProfile.about,
                  ),
                ),
                const SectionDividerWithSpacers(),
                const SectionTitle('Looking for'),
                Padding(
                  padding: CEdgeInsets.horizontalStandart,
                  child: ExpandableTextSection(
                    context.read<OtherUserManager>().shortProfile.lookingFor,
                  ),
                ),
                const SectionDividerWithSpacers(),
                const SectionTitle('Social links'),
                const SizedBox(height: 5),
                const SectionSubtitle(
                    'This section can only be seen by users you validated'),
                const SizedBox(height: 10),
                //TODO: only display if there is access
                SocialLinksList(
                  instagramUsername: context
                      .read<OtherUserManager>()
                      .fullProfile
                      .privateInfoUserModel
                      .instagramUsername,
                  telegramUsername: context
                      .read<OtherUserManager>()
                      .fullProfile
                      .privateInfoUserModel
                      .telegramUsername,
                ),
                Container(
                  height: 600,
                )
              ],
            ),
          );
  }
}

class _SettingsButtonData {
  final String text;
  final Widget leadingIcon;
  final void Function() onTap;

  _SettingsButtonData({
    required this.text,
    required this.leadingIcon,
    required this.onTap,
  });
}

class SettingsSelector extends StatelessWidget {
  const SettingsSelector({Key? key}) : super(key: key);

  List<_SettingsButtonData> _getSettingsList(BuildContext context) {
    final colorOfIcons = context.theme.primaryColor;
    return [
      _SettingsButtonData(
          text: 'Modify profile',
          leadingIcon: Icon(
            Ionicons.clipboard_outline,
            color: colorOfIcons,
            size: 18,
          ),
          onTap: () =>
              //TODO: update profile on profile editing page pop
              context.router.push(const ProfileEditingRoute())
          // .then(
          //       (value) => ctx.read<ProfileContentManager>().loadProfile(),
          //     ),

          ),
      _SettingsButtonData(
        text: 'Write to support',
        leadingIcon: Icon(
          Ionicons.chatbox_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: () => OpenLinkService.openTelegram('jkjkjkjkjjkjkk'),
      ),
      _SettingsButtonData(
        text: 'Sign out',
        leadingIcon: Icon(
          Ionicons.log_out_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: () => context.read<AuthRepo>().signOut(),
      ),
      _SettingsButtonData(
        text: 'Delete profile',
        leadingIcon: Icon(
          Ionicons.close_circle_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('You are going to delete your profile'),
            actions: [
              TextButton(
                child: Text(Strings.ui.cancel),
                onPressed: () {
                  getIt<AppRouter>().navigatorKey.currentContext!.router.pop();
                },
              ),
              TextButton(
                child: Text(Strings.ui.proceed),
                onPressed: () {
                  context.read<AuthRepo>().deleteProfile();
                },
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsList = _getSettingsList(context);
    return ModalBottomSheetContent(
      height: MediaQuery.of(context).size.height * 0.4,
      iconData: Ionicons.settings_outline,
      title: 'Settings',
      content: ListView.separated(
        padding: const EdgeInsets.only(top: 18),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: settingsList.length,
        separatorBuilder: (_, i) => const SizedBox(height: 18),
        itemBuilder: (context, index) {
          return SettingsButton(settingsList[index]);
        },
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final _SettingsButtonData data;
  const SettingsButton(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data.onTap,
      child: Padding(
        padding: CEdgeInsets.horizontalStandartVerticalUnit1,
        child: ButtonContent(
          leading: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: data.leadingIcon,
          ),
          distanceBetweenLeadingAndText: 13,
          text: data.text,
          textStyle: context.theme.textTheme.titleMedium!,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}

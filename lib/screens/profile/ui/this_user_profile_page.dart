import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../common/animations/wrappers.dart';
import '../../../common/auth_and_profile/auth_repo.dart';
import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/bag/strings.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/navigation/navigation_tab.dart';
import '../../../common/service/open_link_service.dart';
import '../../other_user/ui/other_user_profile_page.dart';
import '../../widgets/buttons/button_content.dart';
import '../../widgets/canvas/profile_canvas.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/loading.dart';
import '../../widgets/modal_bottom_sheet/modal_bottom_sheet_content.dart';
import '../../widgets/social_links_list.dart';
import '../../widgets/texts/expandable_text_section.dart';
import '../../widgets/texts/section_title.dart';
import '../state/profile_content_manager.dart';
import 'widgets/tags_displayer.dart';

//TODO! NEED TO UPDATE PROFILE ON NEW pair data
class ThisUserProfilePage extends StatefulWidget {
  final ShortReadUserModel shortProfile;
  const ThisUserProfilePage({
    Key? key,
    required this.shortProfile,
  }) : super(key: key);

  @override
  _ThisUserProfilePageState createState() => _ThisUserProfilePageState();
}

class _ThisUserProfilePageState extends State<ThisUserProfilePage> {
  late final ScrollController _scrollController;
  final _profileContentManager = getIt<ProfileContentManager>();

  @override
  void initState() {
    super.initState();
    _scrollController = allTabsOrderedAccordingToIndex[2].scrollController;
  }

  //TODO i don't know when it is triggered
  @override
  void didUpdateWidget(covariant ThisUserProfilePage oldWidget) {
    // if (oldWidget.shortProfile != widget.shortProfile) {
      //TODO it is injectable 
    _profileContentManager.loadProfile();
    // }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _profileContentManager,
      child: SafeArea(
        child: EntityPageCanvas(
          preloadedData: widget.shortProfile,
          loadableContent: const _ProfileContent(),
          scrollController: _scrollController,
          isBackButtonOn: false,
          mainActionWidget: const OpenSettingsButton(),
        ),
      ),
    );
  }
}

class _ProfileContent extends StatefulWidget {
  const _ProfileContent({
    Key? key,
  }) : super(key: key);

  @override
  State<_ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<_ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return context.watch<ProfileContentManager>().isLoading
        ? const LoadingContainer()
        : SlideAnimationWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 44),
                SectionTitle(context.read<ProfileContentManager>().profile.pairedWith == null ? 'Currently Unlocked' : 'Locked with'),
                LockStateContent(
                  pairedWith: context.read<ProfileContentManager>().profile.pairedWith,
                ),
                const SizedBox(height: 44),
                const SectionTitle('Tags'),
                const SizedBox(height: 10),
                TagsDisplayer(
                  tagsToDisplay: context.read<ProfileContentManager>().profile.shortUserModel.tagsEntities,
                  displayIfTagsEmpty: Container(),
                  onContainer: false,
                ),
                const SizedBox(height: 44),
                const SectionTitle('About'),
                Padding(
                  padding: CEdgeInsets.horizontalStandart,
                  child: ExpandableTextSection(
                    context.read<ProfileContentManager>().profile.shortUserModel.about,
                  ),
                ),
                const SizedBox(height: 44),
                const SectionTitle('Looking for'),
                Padding(
                  padding: CEdgeInsets.horizontalStandart,
                  child: ExpandableTextSection(
                    context.read<ProfileContentManager>().profile.shortUserModel.lookingFor,
                  ),
                ),
                const SizedBox(height: 44),
                const SectionTitle('Social links'),
                const SizedBox(height: 5),
                const SizedBox(height: 10),
                SocialLinksList(
                  fields: context.read<ProfileContentManager>().profile.secureUserInfoModel.fields,
                ),
              ],
            ),
          );
  }
}

class OpenSettingsButton extends StatelessWidget {
  const OpenSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: CEdgeInsets.horizontalStandart,
        child: PlatformElevatedButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context2) => ChangeNotifierProvider.value(
              value: context.read<ProfileContentManager>(),
              builder: (context3, _) => SettingsSelector(),
            ),
          ),
          color: context.colors.mainActionButtonActive,
          child: Text(
            'Open settings',
            style: context.styles.activeButtonText,
          ),
        ),
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
    final colorOfIcons = context.colors.staticIconsColor;
    return [
      _SettingsButtonData(
        text: 'Modify profile',
        leadingIcon: Icon(
          Ionicons.clipboard_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: () async {
          final result = await context.router.push(const ProfileEditingRoute()) as bool?;
          //INFO: refetching full profile after modification
          //NOTE that short profile which is parameter in page widget is updated in another way (check code to see)
          if (result != null && result) {
            await context.read<ProfileContentManager>().loadProfile();
          }
        },
      ),
      _SettingsButtonData(
        text: 'Write to support',
        leadingIcon: Icon(
          Ionicons.chatbox_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: () => OpenLinkService.openTelegram('julesantkowiak'),
      ),
      _SettingsButtonData(
        text: 'Sign out',
        leadingIcon: Icon(
          Ionicons.log_out_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: context.read<ProfileContentManager>().signOut,
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
          textStyle: context.styles.genericHeader,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}

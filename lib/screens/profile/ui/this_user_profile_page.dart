import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/bag/strings.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/navigation/auto_router/app_router.dart';
import '../../../common/navigation/navigation_tab.dart';
import '../../../common/service/open_link_service.dart';
import '../../widgets/buttons/button_content.dart';
import '../../widgets/canvas/profile_canvas.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/loading.dart';
import '../../widgets/modal_bottom_sheet/modal_bottom_sheet_content.dart';
import '../../widgets/social_links_list.dart';
import '../../widgets/texts/expandable_text_section.dart';
import '../state/profile_content_manager.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController = allTabsOrderedAccordingToIndex[0].scrollController;
  }

  @override
  void dispose() {
    //* disposing this controller causes crash on city change
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EntityPageCanvas(
      data: widget.shortProfile,
      loadableContent: const _ProfileContent(),
      scrollController: _scrollController,
      isBackButtonOn: false,
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
  void _functionToCloseModalBottomSheetAndDoSomething(
      void Function(BuildContext) function) {
    Navigator.of(context).pop();
    Future.delayed(
      const Duration(milliseconds: 300),
      () => function(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => getIt<ProfileContentManager>()..loadProfile(),
        builder: (context, _) {
          return context.watch<ProfileContentManager>().isLoading
              ? const LoadingContainer()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: CEdgeInsets.horizontalStandart,
                        child: PlatformElevatedButton(
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) => SettingsSelector(
                                _functionToCloseModalBottomSheetAndDoSomething),
                          ),
                          child: const Text('Open settings'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: CEdgeInsets.horizontalStandart,
                      child: ExpandableTextSection(
                        context
                            .read<ProfileContentManager>()
                            .profile
                            .additionalUserModel
                            .description!,
                      ),
                    ),
                    Padding(
                      padding: CEdgeInsets.horizontalStandart,
                      child: ExpandableTextSection(
                        context
                            .read<ProfileContentManager>()
                            .profile
                            .additionalUserModel
                            .lookingFor!,
                      ),
                    ),
                    SocialLinksList(
                      instagramUsername: context
                          .read<ProfileContentManager>()
                          .profile
                          .privateInfoUserModel
                          .instagramUsername,
                      telegramUsername: context
                          .read<ProfileContentManager>()
                          .profile
                          .privateInfoUserModel
                          .telegramUsername,
                    ),
                    Container(height: 600,)
                  ],
                );
        });
  }
}

class _SettingsButtonData {
  final String text;
  final Widget leadingIcon;
  final void Function(BuildContext) onTap;

  _SettingsButtonData({
    required this.text,
    required this.leadingIcon,
    required this.onTap,
  });
}

class SettingsSelector extends StatelessWidget {
  final void Function(void Function(BuildContext) argFunction)
      _functionToCloseModalBottomSheetAndDoSomething;
  const SettingsSelector(this._functionToCloseModalBottomSheetAndDoSomething,
      {Key? key})
      : super(key: key);

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
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
            (BuildContext ctx) => ctx.router.push(ProfileEditingRoute())),
      ),
      _SettingsButtonData(
        text: 'Write to support',
        leadingIcon: Icon(
          Ionicons.chatbox_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext _) => OpenLinkService.openTelegram('jkjkjkjkjjkjkk'),
        ),
      ),
      _SettingsButtonData(
        text: 'Sign out',
        leadingIcon: Icon(
          Ionicons.log_out_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext ctx) => ctx.read<AuthRepo>().signOut(),
        ),
      ),
      _SettingsButtonData(
        text: 'Delete profile',
        leadingIcon: Icon(
          Ionicons.close_circle_outline,
          color: colorOfIcons,
          size: 18,
        ),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext ctx) => showDialog(
            context: ctx,
            builder: (_) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('You are going to delete your profile'),
              actions: [
                TextButton(
                  child: Text(Strings.ui.cancel),
                  onPressed: () {
                    getIt<AppRouter>()
                        .navigatorKey
                        .currentContext!
                        .router
                        .pop();
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
      onTap: () => data.onTap(context),
      child: Padding(
        padding: CEdgeInsets.horizontalStandart,
        child: ButtonContent(
          leading: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: data.leadingIcon,
          ),
          distanceBetweenLeadingAndText: 13,
          text: data.text,
          textStyle: context.theme.textTheme.titleSmall!,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}

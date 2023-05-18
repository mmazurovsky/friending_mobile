import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/data/models/user_models.dart';
import '../../../common/navigation/navigation_tab.dart';
import '../../widgets/canvas/profile_canvas.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/social_links_list.dart';
import '../../widgets/texts/entity_subtitle.dart';
import '../../widgets/texts/expandable_text_section.dart';

class ThisUserProfilePage extends StatefulWidget {
  final FullReadUserModel profile;
  const ThisUserProfilePage({
    Key? key,
    required this.profile,
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
      data: widget.profile.shortUserModel,
      loadableContent: Container(),
      scrollController: _scrollController,
      isBackButtonOn: false,
    );
  }
}

class _ProfileContent extends StatefulWidget {
  final FullReadUserModel userProfile;
  const _ProfileContent({
    Key? key,
    required this.userProfile,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Padding(
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
        Padding(
          padding: CEdgeInsets.horizontalStandart,
          child: ExpandableTextSection(
            widget.userProfile.additionalUserModel.description!,
          ),
        ),
        Padding(
          padding: CEdgeInsets.horizontalStandart,
          child: ExpandableTextSection(
            widget.userProfile.additionalUserModel.lookingFor!,
          ),
        ),
        SocialLinksList(
          instagramUsername:
              widget.userProfile.privateInfoUserModel.instagramUsername,
          telegramUsername:
              widget.userProfile.privateInfoUserModel.telegramUsername,
        ),
      ],
    );
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

  List<_SettingsButtonData> _getSettingsList() {
    return [
      _SettingsButtonData(
        text: 'modifyProfile'.tr(),
        leadingIcon: const Icon(Ionicons.clipboard_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
            (BuildContext ctx) => NavigatorFunctions.pushModifyUser(ctx)),
      ),
      _SettingsButtonData(
        text: 'writeToUs'.tr(),
        leadingIcon: const Icon(Ionicons.chatbox_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext _) => OpenLinkService.openTelegramOrEmail(
            MyConstants.telegramSupportAccount,
            MyConstants.emailSupportAccount,
          ),
        ),
      ),
      _SettingsButtonData(
        text: 'signOut'.tr(),
        leadingIcon: const Icon(Ionicons.log_out_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext ctx) =>
              BlocProvider.of<AuthenticationCubit>(ctx).signOut(),
        ),
      ),
      _SettingsButtonData(
        text: 'deleteProfile'.tr(),
        leadingIcon: const Icon(Ionicons.close_circle_outline,
            color: MyColors.main, size: 18),
        onTap: (_) => _functionToCloseModalBottomSheetAndDoSomething(
          (BuildContext ctx) => showDialog(
            context: ctx,
            builder: (_) => const AccountDeletionConfirmationDialog(),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsList = _getSettingsList();
    return ModalBottomSheetContent(
      height: ScreenSize.height * 0.4,
      iconData: Ionicons.settings_outline,
      title: 'settings'.tr(),
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
      child: MyHorizontalPadding(
        child: ButtonContent(
          leading: Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            child: data.leadingIcon,
          ),
          distanceBetweenLeadingAndText: 13,
          text: data.text,
          textStyle: MyTextStyles.modalBottomSheetItem,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/animations/wrappers.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../profile/ui/widgets/tags_displayer.dart';
import '../../widgets/buttons/button_with_states.dart';
import '../../widgets/canvas/profile_canvas.dart';
import '../../widgets/custom_edge_insets.dart';
import '../../widgets/social_links_list.dart';
import '../../widgets/texts/expandable_text_section.dart';
import '../../widgets/texts/section_title.dart';
import '../repo/connect_repo.dart';
import '../state/button_with_states_manager.dart';
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
  final _otherUserProfileManager = OtherUserManager();
  late final ButtonWithStatesManager _buttonStatesManager;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _buttonStatesManager = ButtonWithStatesManager(
      getIt<ConnectRepo>(),
      _otherUserProfileManager,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _buttonStatesManager),
        ChangeNotifierProvider(
          create: (context) => _otherUserProfileManager..loadOtherUserProfile(widget.shortProfile.id),
        ),
      ],
      builder: (context, child) => Scaffold(
        body: EntityPageCanvas(
          data: widget.shortProfile,
          loadableContent: const _OtherProfileContent(),
          scrollController: _scrollController,
          isBackButtonOn: false,
          button: ButtonWithStatesWidget(widget.shortProfile.id),
        ),
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
        ? const SizedBox()
        : SlideAnimationWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SectionTitle('Tags'),
                const SizedBox(height: 10),
                TagsDisplayer(
                  tagsToDisplay: context.read<OtherUserManager>().fullProfile.shortUserModel.tagsEntities,
                  displayIfTagsEmpty: Container(),
                ),
                const SizedBox(height: 44),
                const SectionTitle('About'),
                Padding(
                  padding: CEdgeInsets.horizontalStandart,
                  child: ExpandableTextSection(
                    context.read<OtherUserManager>().fullProfile.shortUserModel.about,
                  ),
                ),
                const SizedBox(height: 44),
                const SectionTitle('Looking for'),
                Padding(
                  padding: CEdgeInsets.horizontalStandart,
                  child: ExpandableTextSection(
                    context.read<OtherUserManager>().fullProfile.shortUserModel.lookingFor,
                  ),
                ),
                if (context.read<OtherUserManager>().fullProfile.secureUserInfoModel.fields.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 44),
                      const SectionTitle('Social links'),
                      const SizedBox(height: 5),
                      //TODO: only display if there is access
                      SocialLinksList(
                        fields: context.read<OtherUserManager>().fullProfile.secureUserInfoModel.fields,
                      ),
                    ],
                  ),
              ],
            ),
          );
  }
}

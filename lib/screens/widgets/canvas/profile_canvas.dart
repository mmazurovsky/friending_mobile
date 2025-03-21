import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/data/models/user_models.dart';
import '../app_bar/app_bar_button.dart';
import '../image/image_carousel.dart';
import '../spacers/screen_ending.dart';
import '../texts/entity_title.dart';

class EntityPageCanvas extends StatefulWidget {
  final ShortReadUserModel preloadedData;
  final bool isBackButtonOn;
  final Widget loadableContent;
  final ScrollController? scrollController;
  final Widget mainActionWidget;

  const EntityPageCanvas({
    Key? key,
    required this.preloadedData,
    required this.loadableContent,
    required this.mainActionWidget,
    this.isBackButtonOn = true,
    this.scrollController,
  }) : super(key: key);

  @override
  _EntityPageCanvasState createState() => _EntityPageCanvasState();
}

class _EntityPageCanvasState extends State<EntityPageCanvas> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
  }

  //* disposing this scroll controller causes crash when city is changed in user profile
  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: context.colors.appBarColor,
            pinned: true,
            leading: widget.isBackButtonOn
                ? AppBarButton(
                    iconWidget: Icon(
                      Ionicons.chevron_back_outline,
                      color: context.colors.staticIconsColor,
                    ),
                    onTap: Navigator.of(context).pop,
                  )
                : null,
            title: Column(
              crossAxisAlignment: Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  widget.preloadedData.username,
                  style: context.styles.appBarTitle,
                ),
                const SizedBox(height: 3),
                Text(
                  'User',
                  style: context.styles.appBarSubtitle,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: ImageCarousel(
              imagesUrls: widget.preloadedData.photos,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ProfileUsernameAndAge(
                  title: widget.preloadedData.username,
                  age: widget.preloadedData.age,
                ),
                // const SizedBox(height: 5),
                // EntitySubtitle(
                //   languages: const [],
                //   age: widget.data.age,
                // ),
                const SizedBox(height: 20),
                widget.mainActionWidget,
                widget.loadableContent,
                const ScreenEnding(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

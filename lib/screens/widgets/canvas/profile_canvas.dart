import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/data/models/user_models.dart';

import '../../../common/data/entities/user_entities.dart';
import '../app_bar/animated_sliver_app_bar_with_bottom.dart';
import '../spacers/screen_ending.dart';
import '../texts/entity_subtitle.dart';
import '../texts/entity_title.dart';

class EntityPageCanvas extends StatefulWidget {
  final ShortReadUserModel data;
  final bool isBackButtonOn;
  final Widget loadableContent;
  final ScrollController? scrollController;
  final Widget button;

  const EntityPageCanvas({
    Key? key,
    required this.data,
    required this.loadableContent,
    required this.button,
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
          AnimatedSliverAppBarWithBottom(
            scrollController: _scrollController,
            isBackButtonOn: widget.isBackButtonOn,
            data: widget.data,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ProfileUsernameAndAge(title: widget.data.username, age: widget.data.age,),
                // const SizedBox(height: 5),
                // EntitySubtitle(
                //   languages: const [],
                //   age: widget.data.age,
                // ),
                const SizedBox(height: 20),
                widget.button,
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

import 'package:flutter/material.dart';

import '../../../common/data/entities/user_entities.dart';
import '../app_bar/animated_sliver_app_bar_with_bottom.dart';
import '../spacers/screen_ending.dart';
import '../texts/entity_subtitle.dart';
import '../texts/entity_title.dart';

class EntityPageCanvas extends StatefulWidget {
  final ShortReadUserEntity data;
  final bool isBackButtonOn;
  final Widget loadableContent;
  final ScrollController? scrollController;

  const EntityPageCanvas({
    Key? key,
    required this.data,
    required this.loadableContent,
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
    return Scaffold(
      body: SafeArea(
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
                  EntityTitle(title: widget.data.username),
                  const SizedBox(height: 5),
                  EntitySubtitle(
                    languages: const [],
                    age: widget.data.age,
                  ),
                  widget.loadableContent,
                  const ScreenEnding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

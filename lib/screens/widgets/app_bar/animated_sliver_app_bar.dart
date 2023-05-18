import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../common/bag/stateful/theme.dart';
import '../../../common/data/entities/user_entities.dart';
import '../image/my_cached_network_image.dart';
import 'app_bar_button.dart';

class AnimatedSliverAppBar extends StatefulWidget {
  final ScrollController scrollController;
  final bool isBackButtonOn;
  final List<Widget> actions;
  final ShortReadUserEntity data;

  const AnimatedSliverAppBar({
    Key? key,
    required this.scrollController,
    required this.isBackButtonOn,
    required this.data,
    this.actions = const [],
  }) : super(key: key);

  @override
  _AnimatedSliverAppBarState createState() => _AnimatedSliverAppBarState();
}

class _AnimatedSliverAppBarState extends State<AnimatedSliverAppBar> {
  double _backArrowOpacity = 0.5;
  late double _scrollOffsetFromWhichAppBarDarkeningStarts;
  late double _scrollOffsetFromWhichAppBarDarkeningEnds;
  late double flexibleSpaceHeight;
  late CCachedNetworkImage _flexibleSpaceImage;
  late bool _showAppBarTitle;

  static const _heightOfFlexibleSpace = 500.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
    _flexibleSpaceImage = CCachedNetworkImage(widget.data.photos.first);
    _showAppBarTitle = false;
    flexibleSpaceHeight = _heightOfFlexibleSpace;
    _scrollOffsetFromWhichAppBarDarkeningEnds = flexibleSpaceHeight - 55;
    _scrollOffsetFromWhichAppBarDarkeningStarts =
        _scrollOffsetFromWhichAppBarDarkeningEnds - 40;
  }

  void _scrollListener() {
    double _calculatedBackArrowOpacity = 0.5;
    bool _calculatedShowAppBarTitle = false;

    if (widget.scrollController.offset <=
        _scrollOffsetFromWhichAppBarDarkeningStarts) {
      _calculatedBackArrowOpacity = 0.5;
      _calculatedShowAppBarTitle = false;
    } else if (widget.scrollController.offset >
            _scrollOffsetFromWhichAppBarDarkeningStarts &&
        widget.scrollController.offset <
            _scrollOffsetFromWhichAppBarDarkeningEnds) {
      _calculatedBackArrowOpacity = (_scrollOffsetFromWhichAppBarDarkeningEnds -
              widget.scrollController.offset) /
          (_scrollOffsetFromWhichAppBarDarkeningEnds -
              _scrollOffsetFromWhichAppBarDarkeningStarts) *
          0.5;
      _calculatedShowAppBarTitle = false;
    } else if (widget.scrollController.offset >=
        _scrollOffsetFromWhichAppBarDarkeningEnds) {
      _calculatedBackArrowOpacity = 0.0;
      _calculatedShowAppBarTitle = true;
    }

    if (_backArrowOpacity != _calculatedBackArrowOpacity) {
      if (mounted) {
        setState(() {
          _backArrowOpacity = _calculatedBackArrowOpacity;
        });
      }
    }

    if (_showAppBarTitle != _calculatedShowAppBarTitle) {
      if (mounted) {
        setState(() {
          _showAppBarTitle = _calculatedShowAppBarTitle;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: widget.isBackButtonOn
          ? AppBarButton(
              containerOpacity: _backArrowOpacity,
              iconWidget: Icon(
                Ionicons.chevron_back_outline,
                color: context.theme.appBarTheme.actionsIconTheme?.color,
              ),
              onTap: Navigator.of(context).pop,
            )
          : null,
      actions: widget.actions,
      centerTitle: true,
      title: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _showAppBarTitle ? 1.0 : 0.0,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.data.username,
                style: context.theme.appBarTheme.titleTextStyle,
                overflow: TextOverflow.fade,
              ),
              Text(
                'User',
                style: context.theme.appBarTheme.toolbarTextStyle,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
      expandedHeight: flexibleSpaceHeight,
      //* Can't stretch inside nested scroll view with custom scroll view inside. The bug is opened on Github
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _flexibleSpaceImage,
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
      ),
    );
  }
}

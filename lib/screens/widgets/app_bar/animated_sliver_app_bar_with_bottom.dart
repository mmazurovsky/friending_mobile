import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/data/models/user_models.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/bag/stateful/theme.dart';
import '../../../common/data/entities/user_entities.dart';
import '../image/my_cached_network_image.dart';
import 'app_bar_button.dart';

class AnimatedSliverAppBarWithBottom extends StatefulWidget {
  final ScrollController scrollController;
  final bool isBackButtonOn;
  final List<Widget> actions;
  final ShortReadUserModel data;

  const AnimatedSliverAppBarWithBottom({
    Key? key,
    required this.scrollController,
    required this.isBackButtonOn,
    required this.data,
    this.actions = const [],
  }) : super(key: key);

  @override
  AnimatedSliverAppBarWithBottomState createState() =>
      AnimatedSliverAppBarWithBottomState();
}

class AnimatedSliverAppBarWithBottomState
    extends State<AnimatedSliverAppBarWithBottom> {
  double _backArrowOpacity = 0.5;
  late double _scrollOffsetFromWhichAppBarDarkeningStarts;
  late double _scrollOffsetFromWhichAppBarDarkeningEnds;
  late double flexibleSpaceHeight;
  late Widget _flexibleSpaceImage;
  late bool _showAppBarTitle;
  late final PageController _pageController;

  static const _heightOfFlexibleSpace = 500.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
    _showAppBarTitle = false;
    flexibleSpaceHeight = _heightOfFlexibleSpace;
    _scrollOffsetFromWhichAppBarDarkeningEnds = flexibleSpaceHeight - 55;
    _scrollOffsetFromWhichAppBarDarkeningStarts =
        _scrollOffsetFromWhichAppBarDarkeningEnds - 40;
    _pageController = PageController(
      initialPage: 0,
    );
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
    _flexibleSpaceImage = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.photos.length,
          itemBuilder: (context, i) {
            return CCachedNetworkImage(widget.data.photos[i]);
          },
        ),
        Positioned(
          bottom: 15,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(14),
            ),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.data.photos.length,
              effect: SlideEffect(
                type: SlideType.normal,
                dotColor: context.theme.colorScheme.background,
                activeDotColor: context.theme.colorScheme.primary,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 6,
              ),
            ),
          ),
        ),
      ],
    );

    return SliverAppBar(
      backgroundColor: context.theme.colorScheme.background,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      floating: false,
      snap: false,
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
                style: context.theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.fade,
              ),
              Text(
                'User',
                style: context.theme.textTheme.bodyMedium,
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

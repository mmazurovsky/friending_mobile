import 'package:flutter/material.dart';

import '../custom_edge_insets.dart';
import 'my_cached_network_image.dart';

const int _spaceBetweenItems = 20;
const double _itemWidth = 350;
const double _horizontalPadding = 15;

class ImageCarousel extends StatelessWidget {
  final List<String> imagesUrls;
  const ImageCarousel({
    super.key,
    required this.imagesUrls,
  });

  @override
  Widget build(BuildContext context) {
    if (imagesUrls.length == 1) {
      return Hero(
        tag: imagesUrls[0],
        child: Padding(
          padding: CEdgeInsets.horizontalStandart,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AspectRatio(
              aspectRatio: 1,
              child: CCachedNetworkImage(
                imagesUrls[0],
              ),
            ),
          ),
        ),
      );
    } else {
      return NotificationListener(
        onNotification: (notification) => true,
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
            ),
            physics: const HorizontalScrollViewSnapPhysics(
              elementWidth: _itemWidth,
              spaceBetweenItems: 3,
            ),
            scrollDirection: Axis.horizontal,
            cacheExtent: MediaQuery.of(context).size.width,
            addRepaintBoundaries: false,
            addAutomaticKeepAlives: false,
            itemCount: imagesUrls.length,
            itemBuilder: (context, i) {
              Widget imageWidget = ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                  height: _itemWidth,
                  width: _itemWidth,
                  child: CCachedNetworkImage(
                    imagesUrls[i],
                  ),
                ),
              );
              if (i == 0) {
                imageWidget = Hero(
                  tag: imagesUrls[0],
                  child: imageWidget,
                );
              }
              return Padding(
                padding: EdgeInsets.only(
                  left: i == 0 ? 0 : _spaceBetweenItems / 2,
                  right: (i == imagesUrls.length - 1) ? 0 : _spaceBetweenItems / 2,
                ),
                child: imageWidget,
              );
            },
          ),
        ),
      );
    }
  }
}

// class _ImageWrapper extends StatelessWidget {
//   final String imageUrl;
//   final bool wrapWithHero;
//   final Widget Function(Widget) sizeWrapper;
//   const _ImageWrapper({
//     super.key,
//     required this.imageUrl,
//     required this.wrapWithHero,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final image =
//     return wrapWithHero
//         ? Hero(
//             tag: imageUrl,
//             child: image,
//           )
//         : image;
//   }
// }

class HorizontalScrollViewSnapPhysics extends PageScrollPhysics {
  final double elementWidth;
  final int spaceBetweenItems;

  const HorizontalScrollViewSnapPhysics({
    required this.elementWidth,
    required this.spaceBetweenItems,
    super.parent,
  });

  @override
  PageScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      HorizontalScrollViewSnapPhysics(elementWidth: elementWidth, spaceBetweenItems: spaceBetweenItems, parent: buildParent(ancestor));

  double _getPage(ScrollMetrics position) => position.pixels / (elementWidth + spaceBetweenItems);

  double _getPixels(ScrollMetrics position, double page) => page * (elementWidth + spaceBetweenItems);

  double _getTargetPixels(ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) || (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);

    if (target != position.pixels) return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => true;
}

import 'package:flutter/material.dart';

import 'my_cached_network_image.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imagesUrls;
  const ImageCarousel({
    super.key,
    required this.imagesUrls,
  });

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 0.9);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.width *0.9),
      child: PageView.builder(

        controller: pageController,
        padEnds: false,
        scrollDirection: Axis.horizontal,
        itemCount: imagesUrls.length,
        itemBuilder: (context, i) {
          final image = ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AspectRatio(
              aspectRatio: 1,
              child: CCachedNetworkImage(
                imagesUrls[i],
              ),
            ),
          );
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: image,
          );
          // if (i == 0) {
          //   return Padding(
          //     padding: EdgeInsets.zero, //only(left: 15),
          //     child: image,
          //   );
          // } else if (i != imagesUrls.length - 1) {
          //   return Padding(
          //     padding: EdgeInsets.zero, //only(left: 15, right: 15),
          //     child: image,
          //   );
          // } else {
          //   return Padding(
          //     padding: EdgeInsets.zero, //only(right: 15),
          //     child: image,
          //   );
          // }
        },
      ),
    );
  }
}

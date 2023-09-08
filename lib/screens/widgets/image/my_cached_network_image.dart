import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../common/bag/stateful/theme.dart';
import '../loading.dart';

class CCachedNetworkImage extends StatelessWidget {
  final String? imageLink;
  CCachedNetworkImage(
    this.imageLink, {
    Key? key,
  }) :
        super(key: ValueKey(imageLink));


  @override
  Widget build(BuildContext context) {
    return imageLink == null || imageLink!.length < 3
        ? const EmptyImagePlaceholder()
        : CachedNetworkImage(
            imageUrl: imageLink!,
            imageBuilder: (context, provider) {

              final image = Image(
                image: provider,
                fit: BoxFit.cover,
              );

              return image;
            },
            placeholder: (context, url) => Container(
              color: context.colors.backgroundColor,
              child: const MyLoadingIndicator(),
            ),
            errorWidget: (context, url, smth) => const EmptyImagePlaceholder(),
          );
  }
}

class EmptyImagePlaceholder extends StatelessWidget {
  const EmptyImagePlaceholder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.backgroundColor,
      child: Icon(
        Ionicons.image_outline,
        color: context.colors.staticIconsColor,
        size: 25,
      ),
    );
  }
}

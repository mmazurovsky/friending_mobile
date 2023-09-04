import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../bag/stateful/theme.dart';
import '../loading.dart';

class CCachedNetworkImage extends StatelessWidget {
  final String? imageLink;
  final bool generatePaletteFromImage;
  // final Completer<ImageInfo> _imageCompleter;
  CCachedNetworkImage(
    this.imageLink, {
    Key? key,
    this.generatePaletteFromImage = false,
  }) :
        // : _imageCompleter = Completer<ImageInfo>(),
        super(key: ValueKey(imageLink));

  // Future<ImageDimensions?> getImageDimensions() async {
  //   if (imageLink == null || imageLink!.length < 3) {
  //     return null;
  //   } else {
  //     final imageInfo = await _imageCompleter.future;
  //     return ImageDimensions(height: imageInfo.image.height.toDouble(),
  //             width: imageInfo.image.width.toDouble());
  //   }
  // }

  final _completer = Completer<List<Color>>();
  Completer<List<Color>> get completer => _completer;

  @override
  Widget build(BuildContext context) {
    final containerColor = context.colors.containerColor;

    return imageLink == null || imageLink!.length < 3
        ? const EmptyImagePlaceholder()
        : CachedNetworkImage(
            imageUrl: imageLink!,
            imageBuilder: (context, provider) {
              // provider.resolve(const ImageConfiguration()).addListener(
              //       ImageStreamListener(
              //         (imageInfo, _) {
              //           if (!_imageCompleter.isCompleted) {
              //             _imageCompleter.complete(imageInfo);
              //           }
              //         },
              //         onError: (exception, stackTrace) => log('CachedNetworkImage exception: $exception, stacktrace: $stackTrace'), //TODO exception
              //       ),
              //     );
              if (generatePaletteFromImage) {
                if (!_completer.isCompleted) {
                  PaletteGenerator.fromImageProvider(provider).then(
                    (value) {
                      final color = value.dominantColor;
                      final color1 = color?.color.brighten(90) ?? containerColor;
                      final color2 = color?.color.brighten(50) ?? containerColor;
                      if (!_completer.isCompleted) {
                        _completer.complete([color1, color2]);
                      }
                    },
                  );
                }
              }

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

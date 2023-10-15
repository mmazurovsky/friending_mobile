import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../../../common/bag/spaces.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../widgets/custom_edge_insets.dart';
import '../../../widgets/image/my_cached_network_image.dart';
import '../../../widgets/loading.dart';
import '../../state/profile_images_manager.dart';
import '../../state/profile_texts_manager.dart';
import '../../state/single_profile_image_manager.dart';

class ProfileImagesGrid extends StatefulWidget {
  const ProfileImagesGrid({super.key});

  @override
  State<ProfileImagesGrid> createState() => _ProfileImagesGridState();
}

class _ProfileImagesGridState extends State<ProfileImagesGrid> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: context
          .watch<ProfileImagesManager>()
          .managers
          .map(
            (e) => ChangeNotifierProvider(
              create: (_) => e,
            ),
          )
          .toList(),
      builder: (context, _) {
        final images = context.watch<ProfileImagesManager>().managers.map(
          (e) {
            return ChangeNotifierProvider.value(
              key: ValueKey(e.uuid),
              value: e,
              child: const ImageContent(),
            );
          },
        ).toList();

        return ReorderableGridView.count(
          primary: false,
          padding: CEdgeInsets.horizontalStandart,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          onReorder: (oldIndex, newIndex) {
            context.read<ProfileImagesManager>().reorderManagers(oldIndex, newIndex);
          },
          dragStartDelay: const Duration(milliseconds: 200),
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          shrinkWrap: true,
          children: images,
        );
      },
    );
  }
}

class ImageContent extends StatelessWidget {
  const ImageContent({super.key});

  @override
  Widget build(BuildContext context) {
    Widget wrapperForDeletion(Widget child) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          child,
          Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                context.read<ProfileTextsAndTagsManager>().unfocusAllNodes();
                context.read<SingleProfileImageManager>().removePhoto();
              },
              child: Container(
                padding: const EdgeInsets.all(ConstSpaces.unit1),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colors.errorColor,
                  borderRadius: BorderRadius.circular(ConstSpaces.unit2),
                ),
                child: Icon(
                  Ionicons.close_outline,
                  color: context.colors.staticIconsColor,
                ),
              ),
            ),
          )
        ],
      );
    }

    final photo = context.watch<SingleProfileImageManager>().photo;

    late Widget contentImage;

    if (photo.url != null) {
      contentImage = wrapperForDeletion(CCachedNetworkImage(photo.url!));
    } else if (photo.file != null) {
      contentImage = wrapperForDeletion(Image.file(photo.file!));
    } else {
      contentImage = const Icon(
        Ionicons.add_circle_outline,
        size: 30,
      );
    }

    late Widget contentImageConsideringLoading;

    if (context.watch<SingleProfileImageManager>().isLoading) {
      contentImageConsideringLoading = Stack(
        alignment: Alignment.center,
        children: [
          contentImage,
          const LoadingContainer(),
        ],
      );
    } else {
      contentImageConsideringLoading = contentImage;
    }

    return GestureDetector(
      onTap: () {
        if (context.read<SingleProfileImageManager>().isLoading) {
        } else {
          context.read<ProfileTextsAndTagsManager>().unfocusAllNodes();
          context.read<SingleProfileImageManager>().addPhotoFile(
                backgroundColor: context.colorsStatic.backgroundColor,
                toolbarColor: context.colorsStatic.primary,
              );
        }
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ConstSpaces.unit3),
          //TODO no idea about this color
          color: context.colors.containerColor,
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: contentImageConsideringLoading,
      ),
    );
  }
}

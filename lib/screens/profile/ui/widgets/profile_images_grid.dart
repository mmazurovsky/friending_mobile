import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../../../common/bag/stateful/spaces.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/my_cached_network_image.dart';
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
    return context.watch<ProfileImagesManager>().isLoading
        ? const LoadingContainer()
        : MultiProvider(
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

              return SingleChildScrollView(
                child: Column(
                  children: [
                    ReorderableGridView.count(
                      onDragStart: (dragIndex) {
                        context.read<ProfileTextsManager>().unfocusAllNodes();
                      },
                      onReorder: (oldIndex, newIndex) {
                        context
                            .read<ProfileImagesManager>()
                            .reorderManagers(oldIndex, newIndex);
                      },
                      dragStartDelay: const Duration(milliseconds: 200),
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      shrinkWrap: true,
                      children: images,
                    ),
                    const SizedBox(
                      height: Spaces.unit2,
                    ),
                    PlatformElevatedButton(
                      onPressed: () => context
                          .read<ProfileImagesManager>()
                          .uploadNewPhotosAndUpdatePrifle(),
                      child: Text('Update profile photos'),
                    ),
                  ],
                ),
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
                context.read<ProfileTextsManager>().unfocusAllNodes();
                context.read<SingleProfileImageManager>().removePhoto();
              },
              child: Container(
                padding: EdgeInsets.all(Spaces.unit1),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      context.theme.colorScheme.errorContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(Spaces.unit2),
                ),
                child: Icon(
                  Ionicons.trash_outline,
                  color: context.theme.iconTheme.color,
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
      contentImage = wrapperForDeletion(MyCachedNetworkImage(photo.url!));
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
          context.read<ProfileTextsManager>().unfocusAllNodes();
          context.read<SingleProfileImageManager>().addPhotoFile(
                backgroundColor: context.theme.colorScheme.background,
                toolbarColor: context.theme.colorScheme.primary,
              );
        }
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spaces.unit3),
          color: context.theme.canvasColor.getShadeColor(shadeValue: 4),
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: contentImageConsideringLoading,
      ),
    );
  }
}

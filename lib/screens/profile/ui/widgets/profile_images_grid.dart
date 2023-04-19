import 'package:collection/collection.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:uuid/uuid.dart';

import '../../../../common/bag/stateful/spaces.dart';
import '../../../../common/bag/stateful/theme.dart';
import '../../../../common/dependency_injection/dependency_injection.dart';
import '../../state/profile_images_manager.dart';
import '../../state/single_profile_image_manager.dart';

class ProfileImagesGridPage extends StatelessWidget {
  const ProfileImagesGridPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final initialProfileImages = [
      ProfileImageData(
          url:
              'https://cdn.pixabay.com/photo/2016/03/21/23/25/link-1271843__480.png'),
      ProfileImageData(url: 'https://servmask.com/img/products/url.png'),
      ProfileImageData(),
      ProfileImageData(),
      ProfileImageData(),
      ProfileImageData(),
    ];
    final initialManagers = initialProfileImages
        .mapIndexed(
          (i, e) => SingleProfileImageManager(
            // i,
            getIt<Uuid>().v4(),
            e,
            getIt<ImagePicker>(),
            getIt<ImageCropper>(),
          ),
        )
        .toList();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileImagesManager(initialManagers),
        ),
        ...initialManagers.map(
          (e) => ChangeNotifierProvider(
            create: (_) => e,
          ),
        ),
      ],
      child: const ProfileImagesGridPageContent(),
    );
  }
}

class ProfileImagesGridPageContent extends StatefulWidget {
  const ProfileImagesGridPageContent({super.key});

  @override
  State<ProfileImagesGridPageContent> createState() =>
      _ProfileImagesGridPageContentState();
}

class _ProfileImagesGridPageContentState
    extends State<ProfileImagesGridPageContent> {
  @override
  Widget build(BuildContext context) {
    final images = context
        .watch<ProfileImagesManager>()
        .singleProfileImageManagers
        .mapIndexed(
      (i, e) {
        return ChangeNotifierProvider.value(
          key: ValueKey(e.uuid),
          value: e,
          child: const ImageContent(),
        );
      },
    ).toList();

    return Scaffold(
      body: ReorderableGridView.count(
        onReorder: (oldIndex, newIndex) => context
            .read<ProfileImagesManager>()
            .reorderManagers(oldIndex, newIndex),
        dragStartDelay: const Duration(milliseconds: 200),
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: images,
      ),
    );
  }
}

// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//   crossAxisCount: 3,
//   mainAxisSpacing: 10,
//   crossAxisSpacing: 10,
// ),

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
              onTap: () =>
                  context.read<SingleProfileImageManager>().removePhoto(),
              child: Container(
                padding: EdgeInsets.all(context.spacesRead.unit1),
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.errorContainer.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(context.spacesRead.unit2),
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
      contentImage = wrapperForDeletion(Image.network(photo.url!));
    } else if (photo.file != null) {
      contentImage = wrapperForDeletion(Image.file(photo.file!));
    } else {
      contentImage = const Icon(
        Ionicons.add_circle_outline,
        size: 30,
      );
    }

    return GestureDetector(
      onTap: () => context.read<SingleProfileImageManager>().addPhotoFile(
            backgroundColor: context.theme.colorScheme.background,
            toolbarColor: context.theme.colorScheme.primary,
          ),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.spacesRead.unit3),
          color: context.theme.canvasColor.getShadeColor(shadeValue: 4),
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: contentImage,
      ),
    );
  }
}

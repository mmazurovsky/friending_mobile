import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/bag/stateful/spaces.dart';
import '../../state/profile_images_manager.dart';

class ProfileImagesGridPage extends StatelessWidget {
  const ProfileImagesGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final initialProfileImages = [
      ProfileImageData(),
      ProfileImageData(),
      ProfileImageData(),
      ProfileImageData(),
      ProfileImageData(),
      ProfileImageData(),
    ];
    final managers = initialProfileImages
        .mapIndexed(
          (i, e) => ProfileImagesManager(i, e),
        )
        .toList();
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: initialProfileImages
            .mapIndexed(
              (i, e) => ChangeNotifierProvider(
                create: (_) => managers[i],
                builder: (_, __) => ClipRRect(
                  borderRadius: BorderRadius.circular(context.spacesRead.unit1),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: e.contentImage(
                      backgroundColor: Theme.of(context).unselectedWidgetColor,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

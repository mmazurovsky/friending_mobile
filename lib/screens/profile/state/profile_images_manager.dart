import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/image_handling/image_service.dart';
import 'single_profile_image_manager.dart';

class ProfileImagesManager with ChangeNotifier {
  final ImageService _imageService = getIt<ImageService>();
  final AuthRepo _authRepo = getIt<AuthRepo>();
  //TODO: what if managers get reordered?
  final List<SingleProfileImageManager> _managers;

  
  ProfileImagesManager(this._managers);

  List<SingleProfileImageManager> get singleProfileImageManagers => _managers;

  void reorderManagers(int oldIndex, int newIndex) {
      print('before' + _managers.map((e) => e.uuid).toList().toString());
      final temp = _managers[oldIndex];
      _managers.removeAt(oldIndex);
      _managers.insert(newIndex, temp);
      print('after' + _managers.map((e) => e.uuid).toList().toString());
      notifyListeners();
  }

  void uploadPhotosAndUpdateManagers() async {
    final List<Tuple2<int, Future<String>>> orderOfImageManagerToFuture = [];
    final folderName = _authRepo.currentUser.fold(
      (l) => throw Exception('User is not authenticated'),
      (r) => r.uid,
    );
    _managers.forEachIndexed(
      (i, manager) {
        if (manager.photo.file != null) {
          final tuple = Tuple2(
            i,
            _imageService.resizeAndUploadImageFileNonWeb(
                bucket: 'profile_photos',
                folderName: folderName,
                imageFile: manager.photo.file!),
          );
          orderOfImageManagerToFuture.add(tuple);
        }
      },
    );

    final List<Tuple2<int, String>> orderOfImageManagerToUrl = [];
    orderOfImageManagerToFuture.forEach(
      (element) async {
        late String photoUrl;
        try {
          photoUrl = await element.value2;
          orderOfImageManagerToUrl.add(
            Tuple2(
              element.value1,
              photoUrl,
            ),
          );
        } catch (e) {}
      },
    );

    orderOfImageManagerToUrl.sort((a, b) => a.value1.compareTo(b.value1));

    orderOfImageManagerToUrl.forEach(
      (element) {
        _managers[element.value1].updatePhotoUrl(element.value2);
      },
    );
  }
}

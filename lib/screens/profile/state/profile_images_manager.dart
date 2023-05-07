import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../common/auth/repo/auth_repo.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../../../common/image_handling/image_service.dart';
import '../repo/profile_repo.dart';
import 'single_profile_image_manager.dart';

@injectable
class ProfileImagesManager with ChangeNotifier {
  final ImageService _imageService = getIt<ImageService>();
  final AuthRepo _authRepo = getIt<AuthRepo>();
  final ProfileRepo _profileRepo = getIt<ProfileRepo>();
  final List<SingleProfileImageManager> _managers = [];

  ProfileImagesManager() {
    loadPhotosAndCreateManagers();
  }

  List<SingleProfileImageManager> get managers => _managers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void loadPhotosAndCreateManagers() async {
    _isLoading = true;
    final photosRaw = await _profileRepo.getProfilePhotos();

    List<String> photos = [];

    photosRaw.fold((l) => null, (r) => photos = r);

    final List<SingleProfileImageManager> managers = [];
    List.generate(6, (index) => null).forEachIndexed((i, _) {
      final photoUrl = (i + 1 > photos.length) ? null : photos[i];
      final manager = SingleProfileImageManager(
        getIt<Uuid>().v4(),
        ProfileImageData(
          url: photoUrl,
        ),
        getIt<ImagePicker>(),
        getIt<ImageCropper>(),
      );

      managers.add(manager);
    });

    // final managers = photos.map((e) {
    //   return SingleProfileImageManager(
    //     getIt<Uuid>().v4(),
    //     ProfileImageData(url: e),
    //     getIt<ImagePicker>(),
    //     getIt<ImageCropper>(),
    //   );
    // });

    _managers.clear();
    _managers.addAll(managers);
    _isLoading = false;
    notifyListeners();
  }

  void reorderManagers(int oldIndex, int newIndex) {
    print('before' + _managers.map((e) => e.uuid).toList().toString());
    final temp = _managers[oldIndex];
    _managers.removeAt(oldIndex);
    _managers.insert(newIndex, temp);
    print('after' + _managers.map((e) => e.uuid).toList().toString());
    notifyListeners();
  }

  Future<void> uploadNewPhotosAndUpdatePrifle() async {
    await _uploadPhotosToGetTheirUrlsAndUpdateManagers();
    _updateProfilePhotos();
  }

  Future<void> _uploadPhotosToGetTheirUrlsAndUpdateManagers() async {
    final List<Tuple2<int, Future<String>>> orderOfImageManagerToFuture = [];
    final folderName = _authRepo.currentUser.fold(
      (l) => throw Exception('User is not authenticated'),
      (r) => r.uid,
    );

    _managers.forEachIndexed(
      (i, manager) {
        if (manager.photo.file != null) {
          manager.switchProgressIndicator(true);
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
    for (var element in orderOfImageManagerToFuture) {
      late String photoUrl;
      try {
        photoUrl = await element.value2;
        orderOfImageManagerToUrl.add(
          Tuple2(
            element.value1,
            photoUrl,
          ),
        );
      } catch (e) {
        print(e);
      }
    }

    orderOfImageManagerToUrl.sort((a, b) => a.value1.compareTo(b.value1));

    orderOfImageManagerToUrl.forEach(
      (element) {
        _managers[element.value1].updatePhotoUrl(element.value2);
      },
    );
  }

  Future<void> _updateProfilePhotos() async {
    final photosWithTheRightOrder = _managers
        .map(
          (e) => e.photo.url,
        )
        .whereType<String>()
        .toList();
    _profileRepo.updateProfilePhotos(photosWithTheRightOrder);
  }
}

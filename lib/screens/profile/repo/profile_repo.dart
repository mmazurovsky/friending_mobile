import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../ds/profile_local_ds.dart';
import '../ds/profile_remote_ds.dart';

abstract class ProfileRepo {
  Future<Either<RequestFailure, void>> saveProfile({
    required ShortCreateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
  });
  Future<Either<RequestFailure, void>> updateProfile({
    required ShortUpdateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  });

  Future<Either<RequestFailure, void>> updateProfilePhotos(
      List<String> profilePhotoUrls);
  ShortUpdateUserModel? getShortProfileLocal();
  Future<void> fetchProfileFromRemoteAndSaveLocally();
  Future<void> deleteProfileLocal();
  Future<Either<RequestFailure, List<String>>> getProfilePhotos();
  Future<bool> isUsernameFree(String username);
}

@LazySingleton(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileLocalDS _profileLocalDS;
  final ProfileRemoteDS _profileRemoteDS;

  ProfileRepoImpl(
    this._profileLocalDS,
    this._profileRemoteDS,
  );

  // create function to get profile from local DS
  @override
  ShortUpdateUserModel? getShortProfileLocal() {
    return _profileLocalDS.getShortProfile();
  }

  // create function to save profile
  @override
  Future<Either<RequestFailure, void>> saveProfile({
    required ShortCreateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
  }) {
    _profileLocalDS.saveShortProfile(shortModel.toUpdateShortModel);
    return _profileRemoteDS.saveProfile(
      shortModel: shortModel,
      additionalModel: additionalModel,
      privateModel: privateModel,
    );
  }

  // create function to update profile in remote ds
  @override
  Future<Either<RequestFailure, void>> updateProfile({
    required ShortUpdateUserModel shortModel,
    required AdditionalUserModel additionalModel,
    required PrivateInfoUserModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  }) {
    _profileLocalDS.saveShortProfile(shortModel);
    return _profileRemoteDS.updateProfile(
      shortModel: shortModel,
      additionalModel: additionalModel,
      privateModel: privateModel,
      tagsToAdd: tagsToAdd,
      tagsToRemove: tagsToRemove,
    );
  }

  @override
  Future<void> deleteProfileLocal() {
    return _profileLocalDS.deleteProfile();
  }

  @override
  Future<void> fetchProfileFromRemoteAndSaveLocally() {
    return _profileRemoteDS.getFullProfile().then(
      (value) {
        value.fold(
          (l) {},
          (r) =>
              _profileLocalDS.saveShortProfile(r.shortUserModel.toUpdateModel),
        );
      },
    );
  }

  @override
  Future<Either<RequestFailure, void>> updateProfilePhotos(
      List<String> profilePhotoUrls) {
    return _profileRemoteDS.saveProfilePhotos(profilePhotoUrls);
  }

  @override
  Future<Either<RequestFailure, List<String>>> getProfilePhotos() {
    return _profileRemoteDS.getProfilePhotos();
  }

  @override
  Future<bool> isUsernameFree(String username) {
    return _profileRemoteDS.isUsernameFree(username);
  }
}

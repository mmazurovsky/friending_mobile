import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_models.dart';
import '../ds/profile_local_ds.dart';
import '../ds/profile_remote_ds.dart';

abstract class ProfileRepo {
  Future<void> saveProfile({
    required ShortCreateUserModel shortModel,
    required SecureUserInfoModel privateModel,
  });
  Future<void> updateProfile({
    required ShortUpdateUserModel shortModel,
    required SecureUserInfoModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  });

  Future<void> updateProfilePhotos(List<String> profilePhotoUrls);
  ShortUpdateUserModel? getShortProfileLocal();
  Future<FullReadUserModel?> fetchProfileFromRemoteAndSaveLocally();
  Future<void> deleteProfileLocal();
  Future<bool> isUsernameFree(String username);
  Stream<ShortReadUserModel?> getProfileStream();
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
  Future<void> saveProfile({
    required ShortCreateUserModel shortModel,
    required SecureUserInfoModel privateModel,
  }) {
    _profileLocalDS.saveShortProfile(shortModel.toUpdateShortModel);
    return _profileRemoteDS.saveProfile(
      shortModel: shortModel,
      privateModel: privateModel,
    );
  }

  // create function to update profile in remote ds
  @override
  Future<void> updateProfile({
    required ShortUpdateUserModel shortModel,
    required SecureUserInfoModel privateModel,
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  }) {
    _profileLocalDS.saveShortProfile(shortModel);
    return _profileRemoteDS.updateProfile(
      shortModel: shortModel,
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
  Future<FullReadUserModel?> fetchProfileFromRemoteAndSaveLocally() {
    return _profileRemoteDS.getFullProfile()
      ..then(
        (value) {
          final profileToSaveLocally =
              value?.shortUserModel.convertToUpdateModel;
          if (profileToSaveLocally != null) {
            _profileLocalDS.saveShortProfile(profileToSaveLocally);
          }
        },
      );
  }

  @override
  Future<void> updateProfilePhotos(List<String> profilePhotoUrls) {
    return _profileRemoteDS.saveProfilePhotos(profilePhotoUrls);
  }

  @override
  Future<bool> isUsernameFree(String username) {
    return _profileRemoteDS.isUsernameFree(username);
  }

  @override
  Stream<ShortReadUserModel?> getProfileStream() {
    return _profileRemoteDS.getProfileStream();
  }
}

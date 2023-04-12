import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/failures/failures.dart';
import '../../../common/data/models/user_models.dart';
import '../ds/profile_local_ds.dart';
import '../ds/profile_remote_ds.dart';

abstract class ProfileRepo {
  Future<Either<RequestFailure, void>> saveProfile(FullUserModel model);
  Future<Either<RequestFailure, void>> updateProfile(
    FullUserModel model, {
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  });
  FullUserModel? getProfileLocal();
  Future<void> fetchProfileFromRemoteAndSaveLocally();
  Future<void> deleteProfileLocal();
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
  FullUserModel? getProfileLocal() {
    return _profileLocalDS.getProfile();
  }

  // create function to save profile
  @override
  Future<Either<RequestFailure, void>> saveProfile(FullUserModel model) {
    _profileLocalDS.saveProfile(model);
    return _profileRemoteDS.saveProfile(model);
  }

  // create function to update profile in remote ds
  @override
  Future<Either<RequestFailure, void>> updateProfile(
    FullUserModel model, {
    required List<String> tagsToRemove,
    required List<String> tagsToAdd,
  }) {
    _profileLocalDS.saveProfile(model);
    return _profileRemoteDS.updateProfile(
      model,
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
    return _profileRemoteDS.getProfile().then(
      (value) {
        value.fold(
          (l) {},
          (r) => _profileLocalDS.saveProfile(r),
        );
      },
    );
  }
}

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/models/user_models.dart';

abstract class ProfileLocalDS {
  Future<void> saveProfile(FullUserModel model);

  Future<void> updateProfilePhotoUrls(List<String> photos);

  FullUserModel? getProfile();

  Future<void> deleteProfile();
}

@LazySingleton(as: ProfileLocalDS)
class ProfileLocalDSImpl implements ProfileLocalDS {
  @override
  Future<void> saveProfile(FullUserModel model) {
    final box = Hive.box(Strings.ids.profileBox);
    return box.put('my', model.toJson());
  }

  @override
  FullUserModel? getProfile() {
    final box = Hive.box(Strings.ids.profileBox);
    final profileRaw = box.get('my');
    if (profileRaw == null) {
      return null;
    } else {
      return FullUserModel.fromJson(profileRaw);
    }
  }

  @override
  Future<void> deleteProfile() {
    final box = Hive.box(Strings.ids.profileBox);
    return box.delete('my');
  }

  @override
  Future<void> updateProfilePhotoUrls(List<String> photos) {
    final box = Hive.box(Strings.ids.profileBox);
    final profileRaw = box.get('my');
    if (profileRaw == null) {
      return Future.value();
    } else {
      final profile = FullUserModel.fromJson(profileRaw);
      final newShortUserModel = profile.shortUserModel.copyWith(photos: photos);
      final newProfile = profile.copyWith(shortUserModel: newShortUserModel);
      return box.put('my', newProfile.toJson());
    }
  }
}

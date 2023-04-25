import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../common/bag/strings.dart';
import '../../../common/data/models/user_models.dart';

abstract class ProfileLocalDS {
  Future<void> saveShortProfile(ShortUpdateUserModel model);

  Future<void> updateProfilePhotoUrls(List<String> photos);

  ShortUpdateUserModel? getShortProfile();

  Future<void> deleteProfile();
}

@LazySingleton(as: ProfileLocalDS)
class ProfileLocalDSImpl implements ProfileLocalDS {
  @override
  Future<void> saveShortProfile(ShortUpdateUserModel model) {
    final box = Hive.box(Strings.ids.profileBox);
    return box.put('my', model.toJson());
  }

  @override
  ShortUpdateUserModel? getShortProfile() {
    final box = Hive.box(Strings.ids.profileBox);
    final profileRaw = box.get('my');
    if (profileRaw == null) {
      return null;
    } else {
      return ShortUpdateUserModel.fromJson(profileRaw);
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
      final profile = ShortUpdateUserModel.fromJson(profileRaw);
      final newShortUserModel = profile.copyWith(photos: photos);
      return box.put('my', newShortUserModel.toJson());
    }
  }
}

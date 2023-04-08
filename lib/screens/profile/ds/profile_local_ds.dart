import 'package:hive/hive.dart';

import '../../../common/data/models/user_models.dart';

abstract class ProfileLocalDS {
  Future<void> saveProfile(FullUserModel model);

  FullUserModel? getProfile();

  Future<void> deleteProfile();
}

class ProfileLocalDSImpl implements ProfileLocalDS {
  static const _profileBox = 'profile';

  @override
  Future<void> saveProfile(FullUserModel model) {
    final box = Hive.box(_profileBox);
    return box.put('my', model.toJson());
  }

  @override
  FullUserModel? getProfile() {
    final box = Hive.box(_profileBox);
    final profileRaw = box.get('my');
    if (profileRaw == null) {
      return null;
    } else {
      return FullUserModel.fromJson(profileRaw);
    }
  }

  @override
  Future<void> deleteProfile() {
    final box = Hive.box(_profileBox);
    return box.delete('my');
  }
}

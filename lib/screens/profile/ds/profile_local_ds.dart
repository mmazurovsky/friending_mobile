import 'package:hive/hive.dart';

import '../../../common/data/models/user_models.dart';

abstract class ProfileLocalDS {
  Future<void> saveProfile(FullUserWriteModel model);

  FullUserWriteModel? getProfile();
}

class ProfileLocalDSImpl implements ProfileLocalDS {
  static const _profileBox = 'profile';

  @override
  Future<void> saveProfile(FullUserWriteModel model) {
    final box = Hive.box(_profileBox);
    return box.put('my', model.toJson());
  }

  @override
  FullUserWriteModel? getProfile() {
    final box = Hive.box(_profileBox);
    final profileRaw = box.get('my');
    if (profileRaw == null) {
      return null;
    } else {
      return FullUserWriteModel.fromJson(profileRaw);
    }
  }
}

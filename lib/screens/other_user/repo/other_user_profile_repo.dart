import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_models.dart';
import '../ds/other_user_profile_ds.dart';

abstract class OtherUserProfileRepo {
  Future<OtherUserFullModel> getOtherUserProfile(String userId);
}

@LazySingleton(as: OtherUserProfileRepo)
class OtherUserProfileRepoImpl implements OtherUserProfileRepo {
  final OtherUserProfileDS _otherUserProfileDS;

  OtherUserProfileRepoImpl(this._otherUserProfileDS);

  @override
  Future<OtherUserFullModel> getOtherUserProfile(String userId) {
    return _otherUserProfileDS.getOtherUserFullProfile(userId);
  }
}

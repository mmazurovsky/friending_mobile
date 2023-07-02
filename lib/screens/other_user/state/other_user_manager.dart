import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../repo/other_user_profile_repo.dart';

@injectable
class OtherUserManager with ChangeNotifier {
  final OtherUserProfileRepo _otherUserProfileRepo =
      getIt<OtherUserProfileRepo>();
  final ShortReadUserModel _shortReadUserModel;

  OtherUserManager(this._shortReadUserModel);

  ShortReadUserModel get shortProfile => _shortReadUserModel;

  late OtherUserFullModel _otherUserFullModel;
  OtherUserFullModel get fullProfile => _otherUserFullModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadOtherUserProfile(String userId) async {
    _isLoading = true;
    _otherUserFullModel =
        await _otherUserProfileRepo.getOtherUserProfile(userId);
    _isLoading = false;
    notifyListeners();
  }
}

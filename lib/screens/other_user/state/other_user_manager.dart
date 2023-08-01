import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/enums.dart';
import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../repo/other_user_profile_repo.dart';
import 'button_with_states_manager.dart';

class OtherUserManager with ChangeNotifier {
  final OtherUserProfileRepo _otherUserProfileRepo = getIt<OtherUserProfileRepo>();
  // final ShortReadUserModel _shortReadUserModel;
  // final ButtonWithStatesManager _buttonWithStatesManager;

  OtherUserManager(
    // this._buttonWithStatesManager,
    // this._shortReadUserModel,
  );

  // ShortReadUserModel get shortProfile => _shortReadUserModel;

  late OtherUserFullModel _otherUserFullModel;
  OtherUserFullModel get fullProfile => _otherUserFullModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> loadOtherUserProfile(String id) async {
    _isLoading = true;
    // _buttonWithStatesManager.changeButtonState(
    //   LoadingButtonState(),
    // );
    _otherUserFullModel = await _otherUserProfileRepo.getOtherUserProfile(id);
    // if (_otherUserFullModel.userPairStatusEnum == UserPairStatusEnum.paired) {
      // _buttonWithStatesManager.changeButtonState(
      //   LoadedPairedButtonState(),
      // );
    // } else if (_otherUserFullModel.userPairStatusEnum == UserPairStatusEnum.unpaired) {
    //   //TODO: this can also be to be approved but should not process it on client
    //   _buttonWithStatesManager.changeButtonState(
    //     LoadedUnpairedButtonState(),
    //   );
    // } else if (_otherUserFullModel.userPairStatusEnum == UserPairStatusEnum.requested) {
    //   _buttonWithStatesManager.changeButtonState(
    //     LoadedRequestedButtonState(),
    //   );
    // }
    _isLoading = false;
    notifyListeners();
  }
}

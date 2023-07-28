import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_models.dart';
import '../../../common/dependency_injection/dependency_injection.dart';
import '../repo/other_user_profile_repo.dart';
import 'button_with_states_manager.dart';

@injectable
class OtherUserManager extends ButtonWithStatesManager {
  final OtherUserProfileRepo _otherUserProfileRepo = getIt<OtherUserProfileRepo>();
  final ShortReadUserModel _shortReadUserModel;

  OtherUserManager(this._shortReadUserModel);

  ShortReadUserModel get shortProfile => _shortReadUserModel;

  late OtherUserFullModel _otherUserFullModel;
  OtherUserFullModel get fullProfile => _otherUserFullModel;

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  Future<void> loadOtherUserProfile() async {
    _isLoading = true;
    _otherUserFullModel = await _otherUserProfileRepo.getOtherUserProfile(userId);
    _isLoading = false;
    notifyListeners();
  }

  Widget _buttonContent = Container();
  ButtonState _buttonState = LoadingButtonState();

  @override
  Widget get buttonContent => _buttonContent;

  @override
  ButtonState get buttonState => _buttonState;

  @override
  VoidCallback get onTap {
    switch (_buttonState) {
      case LoadingButtonState():
        return () {};
      case LoadedButtonState():
        //TODO: add code to follow or unfollow
        return () {};
      case ErrorButtonState():
        return () {};
      case SuccessButtonState():
        return () {};
      default:
        return () {};
    }
  }
}

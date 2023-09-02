import 'package:flutter/material.dart';

import '../../../common/data/enums.dart';
import '../../../common/widgets/loading.dart';
import '../repo/connect_repo.dart';
import 'other_user_manager.dart';

// @injectable
class ButtonWithStatesManager with ChangeNotifier {
  final ConnectRepo _connectRepo;
  final OtherUserManager _otherUserManager;

  ButtonWithStatesManager(
    this._connectRepo,
    this._otherUserManager,
  ) {
    _otherUserManager.addListener(
      () {
        late ButtonState newButtonState;
        if (_otherUserManager.isLoading) {
          newButtonState = LoadingButtonState();
        } else {
          if (_otherUserManager.fullProfile.userPairStatusEnum == UserPairStatusEnum.paired) {
            newButtonState = LoadedPairedButtonState();
          } else if (_otherUserManager.fullProfile.userPairStatusEnum == UserPairStatusEnum.unpaired) {
            newButtonState = LoadedUnpairedButtonState();
          } else if (_otherUserManager.fullProfile.userPairStatusEnum == UserPairStatusEnum.requested) {
            newButtonState = LoadedRequestedButtonState();
          } else {
            newButtonState = ErrorButtonState();
          }
        }
        if (_buttonState != newButtonState) {
          _buttonState = newButtonState;
          notifyListeners();
        }
      },
    );
  }

  ButtonState get buttonState => _buttonState;
  ButtonState _buttonState = LoadingButtonState();

  VoidCallback getOnTap(String otherUserId) {
    switch (buttonState) {
      case LoadingButtonState() || ErrorButtonState() || SuccessButtonState():
        return () {};
      case LoadedUnpairedButtonState():
        return () {
          _connectRepo.pair(otherUserId);
        };
      case LoadedRequestedButtonState():
        return () {
          _connectRepo.unpairOrRemoveRequest(otherUserId);
        };
      case LoadedPairedButtonState():
        return () {
          _connectRepo.unpairOrRemoveRequest(otherUserId);
        };
    }
  }

  Widget get buttonContent {
    switch (buttonState) {
      case LoadingButtonState():
        return const MyLoadingIndicator();
      case LoadedUnpairedButtonState():
        return const Text('Pair');
      case LoadedRequestedButtonState():
        return const Text('Requested');
      case LoadedPairedButtonState():
        return const Text('Unpair');
      case ErrorButtonState():
        return const Text('Error');
      case SuccessButtonState():
        return const Text('Success');
    }
  }

  void changeButtonState(ButtonState newButtonState) {
    if (_buttonState != newButtonState) {
      _buttonState = newButtonState;
      notifyListeners();
    }
  }
}

sealed class ButtonState {}

class LoadingButtonState extends ButtonState {}

class LoadedUnpairedButtonState extends ButtonState {}

class LoadedRequestedButtonState extends ButtonState {}

class LoadedPairedButtonState extends ButtonState {}

class ErrorButtonState extends ButtonState {}

class SuccessButtonState extends ButtonState {}

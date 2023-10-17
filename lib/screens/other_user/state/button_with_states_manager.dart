import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/bag/stateful/styles.dart';
import '../../../common/bag/stateful/theme.dart';
import '../../../common/data/enums.dart';
import '../../widgets/loading.dart';
import '../repo/connect_repo.dart';
import 'other_user_manager.dart';

// @injectable
class ButtonWithStatesManager with ChangeNotifier {
  final ConnectRepo _connectRepo;
  final OtherUserManager _otherUserManager;
  final StylesStateManager _stylesStateManager;
  final ColorsStateManager _colorsStateManager;

  ButtonWithStatesManager(
    this._connectRepo,
    this._otherUserManager,
    this._stylesStateManager,
    this._colorsStateManager,
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

  final _streamController = StreamController<ErrorDataToShowInUI>.broadcast();
  Stream<ErrorDataToShowInUI> get errorStream => _streamController.stream;

  ButtonState get buttonState => _buttonState;
  ButtonState _buttonState = LoadingButtonState();

  VoidCallback getOnTap(String otherUserId) {
    switch (buttonState) {
      case LoadingButtonState() || ErrorButtonState():
        return () {};
      case LoadedUnpairedButtonState():
        return () async {
          final response = await _connectRepo.pair(otherUserId);

          final newButtonState = switch (response) {
            ConnectRequestSend() => LoadedRequestedButtonState(),
            ConnectRequestPaired() => LoadedPairedButtonState(),
            ConnectRequestNotEnoughPoints() => LoadedUnpairedButtonState(),
            ConnectRequestNotAuthenticated() => LoadedUnpairedButtonState(),
          };

          if (response is ConnectRequestNotEnoughPoints) {
            _streamController.add(
              //TODO work on text
              ErrorDataToShowInDialog(message: 'Not enough points'),
            );
          } else if (response is ConnectRequestNotAuthenticated) {
            _streamController.add(
              //TODO work on text
              ErrorDataToShowInDialog(message: 'Not authenticated'),
            );
          }

          _buttonState = newButtonState;
          notifyListeners();
        };
      case LoadedRequestedButtonState():
        return () {
          _connectRepo.unpairOrRemoveRequest(otherUserId);
          _buttonState = LoadedUnpairedButtonState();
          notifyListeners();
        };
      case LoadedPairedButtonState():
        return () {
          _connectRepo.unpairOrRemoveRequest(otherUserId);
          _buttonState = LoadedUnpairedButtonState();
          notifyListeners();
        };
    }
  }

  Color get buttonColor {
    final color = switch (buttonState) {
      LoadingButtonState() => _colorsStateManager.colors.backgroundColor,
      LoadedUnpairedButtonState() => _colorsStateManager.colors.mainActionButtonActive,
      LoadedRequestedButtonState() => _colorsStateManager.colors.mainActionButtonInactive,
      LoadedPairedButtonState() => _colorsStateManager.colors.mainActionButtonInactive,
      ErrorButtonState() => _colorsStateManager.colors.errorColor,
    };
    return color;
  }

  Widget get buttonContent {
    switch (buttonState) {
      case LoadingButtonState():
        return const MyLoadingIndicator();
      case LoadedUnpairedButtonState():
        return Text(
          'Pair',
          style: _stylesStateManager.activeButtonText,
        );
      case LoadedRequestedButtonState():
        return Text(
          'Requested to lock',
          style: _stylesStateManager.inactiveButtonText,
        );
      case LoadedPairedButtonState():
        return Text(
          'Unpair',
          style: _stylesStateManager.inactiveButtonText,
        );
      case ErrorButtonState():
        return Text(
          'Error',
          style: _stylesStateManager.inactiveButtonText,
        );
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

sealed class ErrorDataToShowInUI {
  String get message;
}

class ErrorDataToShowInSnackBar extends ErrorDataToShowInUI {
  ErrorDataToShowInSnackBar({
    required this.message,
  });

  @override
  final String message;
}

class ErrorDataToShowInDialog extends ErrorDataToShowInUI {
  ErrorDataToShowInDialog({
    required this.message,
  });

  @override
  final String message;
}

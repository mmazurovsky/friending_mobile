import 'package:flutter/material.dart';

abstract class ButtonWithStatesManager with ChangeNotifier {
  ButtonState get buttonState;
  VoidCallback get onTap;
  Widget get buttonContent;
}

sealed class ButtonState {}

class LoadingButtonState extends ButtonState {}

class LoadedButtonState extends ButtonState {}

class ErrorButtonState extends ButtonState {}

class SuccessButtonState extends ButtonState {}

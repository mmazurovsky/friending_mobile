import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

extension StylesExtension on BuildContext {
  StylesStateManager get styles => this.watch<StylesStateManager>();
}

class StylesStateManager with ChangeNotifier {
  final ThemeStateManager _themeStateManager;
  // late TextTheme _textTheme;

  static final StylesStateManager _singleton = StylesStateManager._internal(
    ThemeStateManager.singleton(),
  );

  StylesStateManager._internal(this._themeStateManager);

  factory StylesStateManager() {
    return _singleton;
  }

  TextStyle get genericLargeHeader => TextStyle(
        color: _themeStateManager.themeData.headerColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      );

  TextStyle get genericHeader => TextStyle(
        color: _themeStateManager.themeData.headerColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  TextStyle get genericTitle => TextStyle(
        color: _themeStateManager.themeData.headerColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  TextStyle get userCardUsername => TextStyle(
        color: _themeStateManager.themeData.userCardUsernameColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get userCardAge => TextStyle(
        color: _themeStateManager.themeData.userCardAgeColor,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  TextStyle get bodyText => TextStyle(
        color: _themeStateManager.themeData.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get titleText => TextStyle(
        color: _themeStateManager.themeData.secondaryTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitleText => TextStyle(
        color: _themeStateManager.themeData.secondaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get highlightedText => TextStyle(
        color: _themeStateManager.themeData.highlightedTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get switchTitle => TextStyle(
        color: _themeStateManager.themeData.mainTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get activeButtonText => TextStyle(
        color: _themeStateManager.themeData.mainTextColor,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      );

  TextStyle get inactiveButtonText => TextStyle(
        color: _themeStateManager.themeData.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get appBarTitle => TextStyle(
        color: _themeStateManager.themeData.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get appBarSubtitle => TextStyle(
        color: _themeStateManager.themeData.secondaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
}

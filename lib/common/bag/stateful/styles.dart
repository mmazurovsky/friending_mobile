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
        color: _themeStateManager.themeData.generalHeaderColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      );

  TextStyle get genericHeader => TextStyle(
        color: _themeStateManager.themeData.generalHeaderColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      );

  TextStyle get genericTitle => TextStyle(
        color: _themeStateManager.themeData.generalHeaderColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  TextStyle get userCardUsername => TextStyle(
        color: _themeStateManager.themeData.userCardUsernameColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get userCardAge => TextStyle(
        color: _themeStateManager.themeData.userCardAgeColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  TextStyle get bodyText => TextStyle(
        color: _themeStateManager.themeData.generalTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get highlightedText => TextStyle(
        color: _themeStateManager.themeData.highlightedTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get switchTitle => TextStyle(
        color: _themeStateManager.themeData.generalTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get activeButtonText => TextStyle(
        color: _themeStateManager.themeData.generalTextColor,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      );

  TextStyle get inactiveButtonText => TextStyle(
        color: _themeStateManager.themeData.generalTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
}

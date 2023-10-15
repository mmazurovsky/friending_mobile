import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

extension StylesExtension on BuildContext {
  StylesStateManager get styles => this.watch<StylesStateManager>();
}

class StylesStateManager with ChangeNotifier {
  final ColorsStateManager _themeStateManager;
  // late TextTheme _textTheme;

  static final StylesStateManager _singleton = StylesStateManager._internal(
    ColorsStateManager.singleton(),
  );

  StylesStateManager._internal(this._themeStateManager);

  CustomThemeData get _colors => _themeStateManager.colors;

  factory StylesStateManager.singleton() {
    return _singleton;
  }

  TextStyle get genericLargeHeader => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      );

  TextStyle get genericHeader => TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get userScreenNickname => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get userScreenAge => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  TextStyle get genericSubheader => TextStyle(
        color: _colors.secondaryTextColor,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      );

  TextStyle get genericTitle => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  TextStyle get userCardUsername => TextStyle(
        color: _colors.onContainerTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get userCardAge => TextStyle(
        color: _colors.userCardAgeColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  TextStyle get bodyText => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get bodyBold => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  TextStyle get activeChip => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  TextStyle get activeChipOnContainer => activeChip.copyWith(color: _colors.onContainerTextColor);

  TextStyle get inactiveChip => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  TextStyle get inactiveChipOnContainer => inactiveChip.copyWith(color: _colors.onContainerTextColor);

  TextStyle get titleText => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitleText => TextStyle(
        color: _colors.secondaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get highlightedText => TextStyle(
        color: _colors.highlightedTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get switchTitle => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get activeButtonText => TextStyle(
        color: _colors.thirdTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get socialMediaTitle => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      );

  TextStyle get inactiveButtonText => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  TextStyle get appBarTitle => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get largeAppBarTitle => TextStyle(
        color: _colors.mainTextColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );

  TextStyle get appBarSubtitle => TextStyle(
        color: _colors.secondaryTextColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
}

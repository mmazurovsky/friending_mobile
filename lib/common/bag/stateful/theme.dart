import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
}

class ThemeStateManager with ChangeNotifier {
  static ThemeStateManager? _singleton;

  ThemeStateManager._internal(this._currentBrightness);

  factory ThemeStateManager.singleton([Brightness? brightness]) {
    _singleton ??= ThemeStateManager._internal(brightness!);
    return _singleton!;
  }

  Brightness _currentBrightness;

  Brightness get currentBrightness => _currentBrightness;

  void changeBrightness(Brightness brightness) {
    if (_currentBrightness != brightness) {
      _currentBrightness = brightness;
      notifyListeners();
    }
  }
}

extension BrightnessExt on ThemeStateManager {
  ThemeData get themeData {
    switch (currentBrightness) {
      case Brightness.light:
        return Themes.light;
      case Brightness.dark:
        return Themes.dark;
    }
  }
}

class Themes {
  static ThemeData get light {
    return FlexThemeData.light(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scheme: FlexScheme.material,
    ).copyWith(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static ThemeData get dark {
    return FlexThemeData.dark(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scheme: FlexScheme.material,
    ).copyWith(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

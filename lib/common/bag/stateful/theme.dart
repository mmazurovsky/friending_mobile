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
      scheme: FlexScheme.materialBaseline,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    ).copyWith(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return FlexThemeData.dark(
      scheme: FlexScheme.materialBaseline,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
      // To use the Playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    ).copyWith(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

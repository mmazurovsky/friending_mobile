import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ThemeExt on BuildContext {
  Brightness get brightness => this.watch<ColorsStateManager>().currentBrightness;
  CustomThemeData get colors => this.watch<ColorsStateManager>().colors;
  CustomThemeData get colorsStatic => this.read<ColorsStateManager>().colors;
}

class ColorsStateManager with ChangeNotifier {
  static ColorsStateManager? _singleton;

  ColorsStateManager._internal(this._currentBrightness);

  factory ColorsStateManager.singleton([Brightness? brightness]) {
    _singleton ??= ColorsStateManager._internal(brightness!);
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

extension BrightnessExt on ColorsStateManager {
  CustomThemeData get colors {
    switch (currentBrightness) {
      case Brightness.light:
        return MainCustomThemeData();
      case Brightness.dark:
        return MainCustomThemeData();
    }
  }
}

abstract class CustomThemeData {
  Color get primary;
  Color get backgroundColor;
  Color get accentToBackgroundColor;
  Color get headerColor;
  Color get mainTextColor;
  Color get secondaryTextColor;
  Color get thirdTextColor;
  Color get containerColor;
  Color get onContainerTextColor;
  Color get userCardUsernameColor;
  Color get userCardAgeColor;
  Color get highlightedTextColor;
  Color get snackBarContainerColor;
  Color get snackBarTextColor;
  Color get loadingIndicatorColor;
  Color get appBarColor;
  Color get activeIndicatorColor;
  Color get inactiveIndicatorColor;
  Color get activeSwitchColor;
  Color get inactiveSwitchColor;
  Color get staticIconsColor;
  Color get errorColor;
  Color get divider;
  Color get shadow;
  Color get border;
  Color get mainActionButtonActive;
  Color get mainActionButtonInactive;
  Color get appBarAction;
  Color get textButton;
}

class MainCustomThemeData implements CustomThemeData {
  static const _white = Colors.white;
  static const _black = Colors.black;
  static const _blue = Colors.blue;
  static const _paleRed = Color(0xFFE57373);
  static const _lightSilver = Color(0xFFD8D8D8);
  static const _silver = Color.fromARGB(255, 168, 171, 178);
  // final _whiteWithOpacity = _white.withOpacity(0.9);
  static const _accent = Color.fromARGB(255, 244, 185, 255);

  @override
  Color get backgroundColor => _black;

  @override
  Color get accentToBackgroundColor => _white;

  @override
  Color get containerColor => _white;

  @override
  Color get onContainerTextColor => _black;

  @override
  Color get headerColor => _black;

  @override
  Color get mainTextColor => _white;

  @override
  Color get highlightedTextColor => _blue;

  @override
  Color get snackBarContainerColor => _black;

  @override
  Color get snackBarTextColor => _white;

  @override
  Color get loadingIndicatorColor => accentToBackgroundColor;

  @override
  Color get activeIndicatorColor => _accent;

  @override
  Color get inactiveIndicatorColor => _silver;

  @override
  Color get userCardUsernameColor => _black;

  @override
  Color get userCardAgeColor => _lightSilver;

  @override
  Color get activeSwitchColor => _black;

  @override
  Color get inactiveSwitchColor => _white;

  @override
  Color get staticIconsColor => accentToBackgroundColor;

  @override
  Color get errorColor => _paleRed;

  @override
  Color get primary => _silver;

  @override
  Color get secondaryTextColor => _silver;

  @override
  Color get divider => _black;

  @override
  Color get shadow => _black;

  @override
  Color get border => divider;

  @override
  Color get mainActionButtonActive => _white;

  @override
  Color get textButton => _accent;

  @override
  Color get thirdTextColor => backgroundColor;

  @override
  Color get mainActionButtonInactive => _silver;

  @override
  Color get appBarColor => backgroundColor;

  @override
  Color get appBarAction => _lightSilver;
}

// class Themes {
//   static ThemeData get light {
//     return FlexThemeData.light(
//       scheme: FlexScheme.materialBaseline,
//       surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
//       blendLevel: 7,
//       subThemesData: const FlexSubThemesData(
//         blendOnLevel: 10,
//         blendOnColors: false,
//         useTextTheme: true,
//       ),
//       visualDensity: FlexColorScheme.comfortablePlatformDensity,
//       useMaterial3: true,
//       swapLegacyOnMaterial3: true,
//       // To use the Playground font, add GoogleFonts package and uncomment
//       // fontFamily: GoogleFonts.notoSans().fontFamily,
//     ).copyWith(
//       splashColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       focusColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       inputDecorationTheme: const InputDecorationTheme(
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }

//   static ThemeData get dark {
//     return FlexThemeData.dark(
//       scheme: FlexScheme.materialBaseline,
//       surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
//       blendLevel: 13,
//       subThemesData: const FlexSubThemesData(
//         blendOnLevel: 20,
//         useTextTheme: true,
//       ),
//       visualDensity: FlexColorScheme.comfortablePlatformDensity,
//       useMaterial3: true,
//       swapLegacyOnMaterial3: true,
//       // To use the Playground font, add GoogleFonts package and uncomment
//       // fontFamily: GoogleFonts.notoSans().fontFamily,
//     ).copyWith(
//       splashColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       focusColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       inputDecorationTheme: const InputDecorationTheme(
//         border: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

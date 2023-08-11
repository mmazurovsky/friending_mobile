import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension ThemeExt on BuildContext {
  CustomThemeData get colors => this.watch<ThemeStateManager>().themeData;
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
  CustomThemeData get themeData {
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
  Color get dialogBackgroundColor;
  Color get headerColor;
  Color get mainTextColor;
  Color get secondaryTextColor;
  Color get containerColor;
  Color get userCardUsernameColor;
  Color get userCardAgeColor;
  Color get highlightedTextColor;
  Color get snackBarContainerColor;
  Color get snackBarTextColor;
  Color get loadingIndicatorColor;
  Color get bottomNavigationBarColor;
  Color get activeIndicatorColor;
  Color get inactiveIndicatorColor;
  Color get activeSwitchColor;
  Color get inactiveSwitchColor;
  Color get staticIconsColor;
  Color get errorColor;
  Color get divider;
  Color get shadow;
  Color get border;
}

class MainCustomThemeData implements CustomThemeData {
  // General colors
  static const _white = Colors.white;
  static const _slightlyBeige = Color.fromARGB(255, 246, 243, 251);
  static const _black = Colors.black;
  static const _grey = Colors.grey;
  static const _blue = Colors.blue;
  static const _paleRed = Color(0xFFE57373);

  @override
  Color get backgroundColor => _white;

  @override
  Color get containerColor => _slightlyBeige;

  @override
  Color get headerColor => _black;

  @override
  Color get mainTextColor => _black;

  @override
  Color get highlightedTextColor => _blue;

  @override
  Color get snackBarContainerColor => _grey;

  @override
  Color get snackBarTextColor => _white;

  @override
  Color get loadingIndicatorColor => _grey;

  @override
  Color get bottomNavigationBarColor => backgroundColor;

  @override
  Color get activeIndicatorColor => _black;

  @override
  Color get inactiveIndicatorColor => _grey;

  @override
  Color get userCardUsernameColor => _black;

  @override
  Color get userCardAgeColor => _grey.shade600;

  @override
  Color get activeSwitchColor => _black;

  @override
  Color get inactiveSwitchColor => _white;

  @override
  Color get staticIconsColor => _black;

  @override
  Color get errorColor => _paleRed;

  @override
  Color get primary => _grey;

  @override
  Color get secondaryTextColor => _grey;

  @override
  Color get dialogBackgroundColor => _grey.shade700;

  @override
  Color get divider => _grey.shade400;

  @override
  Color get shadow => _grey.shade300;
  
  @override
  Color get border => _black;
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

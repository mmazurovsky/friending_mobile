import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// extension Theme on ThemeMode {
//   ThemeData get themeData {
//     switch (this) {
//       case ThemeMode.light:
//         return Themes.light;
//       case ThemeMode.dark:
//         return Themes.dark;
//       case ThemeMode.system:
//         return Themes.light;
//     }
//   }
// }

class Themes {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      canvasColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        //TODO
        cursorColor: Colors.black,
        //TODO
        selectionColor: Colors.blue,
        //TODO
        selectionHandleColor: Colors.blue,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
        //TODO
        primaryColor: Colors.blue,
      ),
      primarySwatch: Colors.blue,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      canvasColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        //TODO
        cursorColor: Colors.black,
        //TODO
        selectionColor: Colors.blue,
        //TODO
        selectionHandleColor: Colors.blue,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
        //TODO
        primaryColor: Colors.blue,
      ),
      primarySwatch: Colors.blue,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

extension PaletteExtension on BuildContext {
  PaletteStateManager get palette => this.watch<PaletteStateManager>();
}

class PaletteStateManager with ChangeNotifier {
  static PaletteStateManager? _singleton;

  PaletteStateManager._internal(this.themeStateManager);

  factory PaletteStateManager.singleton() {
    _singleton ??= PaletteStateManager._internal(ThemeStateManager.singleton());
    return _singleton!;
  }

  final ThemeStateManager themeStateManager;

  // Colors that are used in widgets
  Color get background =>
      themeStateManager.currentBrightness.themeData.colorScheme.background;

  Color get inactiveIcon =>
      themeStateManager.currentBrightness.themeData.disabledColor;

  Color get activeIcon =>
      themeStateManager.currentBrightness.themeData.indicatorColor;

  Color get primary => Colors.white;

  // Color get accent => Colors.white;

  // Color get divider => Colors.white;
}

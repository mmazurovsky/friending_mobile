import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

extension PaletteExtension on BuildContext {
  PaletteStateManager get palette => this.watch<PaletteStateManager>();
}

@lazySingleton
class PaletteStateManager with ChangeNotifier {
  PaletteStateManager._();

  late ThemeData _themeData;

  void initOrChangeThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Colors that are used in widgets
  Color get background => _themeData.colorScheme.background;

  Color get inactiveIcon => Colors.white;
  Color get activeIcon => Colors.white;

  Color get primary => Colors.white;

  Color get accent => Colors.white;

  Color get divider => Colors.white;
}

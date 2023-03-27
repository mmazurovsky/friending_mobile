import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeStateManager with ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentMode => _currentThemeMode;

  void changeThemeMode(ThemeMode themeMode) {
    assert(themeMode != ThemeMode.system);
    if (_currentThemeMode != themeMode) {
      _currentThemeMode = themeMode;
      notifyListeners();
    }
  }
}

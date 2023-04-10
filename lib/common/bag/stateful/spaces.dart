import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension SpacesExtension on BuildContext {
  SpacesStateManager get spacesWatch => watch<SpacesStateManager>();
  SpacesStateManager get spacesRead => read<SpacesStateManager>();
}

class SpacesStateManager with ChangeNotifier {
  static SpacesStateManager? _singleton;

  SpacesStateManager._internal(this._width);

  factory SpacesStateManager.singleton(double width) {
    _singleton ??= SpacesStateManager._internal(width);
    return _singleton!;
  }

  double _width;

  void initOrChangeWidth(double screenWidth) {
    if (_width != screenWidth) {
      _width = screenWidth;
      notifyListeners();
    }
  }

  double get dynamicUnit1 => _width / 100;

  double get dynamicUnit0_25 => dynamicUnit1 * 0.25;

  double get dynamicUnit0_5 => dynamicUnit1 * 0.5;

  double get dynamicUnit1_5 => dynamicUnit1 * 1.5;

  double get dynamicUnit2 => dynamicUnit1 * 2;

  double get dynamicUnit3 => dynamicUnit1 * 3;

  double get dynamicUnit4 => dynamicUnit1 * 4;

  double get dynamicUnit5 => dynamicUnit1 * 5;

  double get dynamicUnit6 => dynamicUnit1 * 6;

  double get dynamicUnit7 => dynamicUnit1 * 7;

  double get dynamicUnit8 => dynamicUnit1 * 8;

  double get dynamicUnit9 => dynamicUnit1 * 9;

  double get dynamicUnit10 => dynamicUnit1 * 10;

  double get unit1 => 5;
  double get unit2 => unit1 * 2;
  double get unit3 => unit1 * 3;
  double get unit4 => unit1 * 4;
  double get unit5 => unit1 * 5;
}

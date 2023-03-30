import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension SpacesExtension on BuildContext {
  SpacesStateManager get spaces => this.watch<SpacesStateManager>();
}

class SpacesStateManager with ChangeNotifier {
  static final SpacesStateManager _singleton = SpacesStateManager._internal();

  SpacesStateManager._internal();

  factory SpacesStateManager.singleton() {
    return _singleton;
  }

  double? _width;

  void initOrChangeWidth(double screenWidth) {
    if (_width != screenWidth) {
      _width = screenWidth;
      notifyListeners();
    }
  }

  double get unit1 => _width! / 100;

  double get unit0_25 => unit1 * 0.25;

  double get unit0_5 => unit1 * 0.5;

  double get unit1_5 => unit1 * 1.5;

  double get unit2 => unit1 * 2;

  double get unit3 => unit1 * 3;

  double get unit4 => unit1 * 4;

  double get unit5 => unit1 * 5;

  double get unit6 => unit1 * 6;

  double get unit7 => unit1 * 7;

  double get unit8 => unit1 * 8;

  double get unit9 => unit1 * 9;

  double get unit10 => unit1 * 10;
}

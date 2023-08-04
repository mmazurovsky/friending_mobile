import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

extension StylesExtension on BuildContext {
  StylesStateManager get styles => this.watch<StylesStateManager>();
}

class StylesStateManager with ChangeNotifier {
  final ThemeStateManager _themeStateManager;
  // late TextTheme _textTheme;

  static final StylesStateManager _singleton = StylesStateManager._internal(
    ThemeStateManager.singleton(),
  );

  StylesStateManager._internal(this._themeStateManager);

  factory StylesStateManager() {
    return _singleton;
  }

  TextStyle get generalScreenHeader => TextStyle(
        color: _themeStateManager.themeData.generalHeaderColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      );
}

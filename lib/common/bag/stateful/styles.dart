import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

extension StylesExtension on BuildContext {
  StylesStateManager get styles => this.watch<StylesStateManager>();
}

class StylesStateManager with ChangeNotifier {
  final ThemeStateManager _theme;
  // late TextTheme _textTheme;

  static final StylesStateManager _singleton = StylesStateManager._internal(
    ThemeStateManager.singleton(),
  );

  StylesStateManager._internal(this._theme);

  factory StylesStateManager() {
    return _singleton;
  }

  //new text styles Bookshrink
  TextStyle get custom => TextStyle(
        color: _theme.themeData.canvasColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      );
}

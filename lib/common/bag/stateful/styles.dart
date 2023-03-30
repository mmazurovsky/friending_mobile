import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'palette.dart';

extension StylesExtension on BuildContext {
  StylesStateManager get styles => this.watch<StylesStateManager>();
}

class StylesStateManager with ChangeNotifier {
  final PaletteStateManager _palette;
  // late TextTheme _textTheme;

  static final StylesStateManager _singleton = StylesStateManager._internal(
    PaletteStateManager.singleton(),
  );

  StylesStateManager._internal(this._palette);

  factory StylesStateManager() {
    return _singleton;
  }

  //new text styles Bookshrink
  TextStyle get custom => TextStyle(
        color: _palette.primary,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      );
}

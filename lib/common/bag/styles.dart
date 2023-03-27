import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'palette.dart';

extension StylesExtension on BuildContext {
  StylesStateManager get styles => this.watch<StylesStateManager>();
}

@lazySingleton
class StylesStateManager with ChangeNotifier {
  final PaletteStateManager _palette;
  late TextTheme _textTheme;

  StylesStateManager._(
    this._palette,
  );

  void initOrChangeTextTheme(TextTheme textTheme) {
    _textTheme = textTheme;
    notifyListeners();
  }

  //new text styles Bookshrink
  TextStyle get custom => TextStyle(
        color: _palette.primary,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      );
}

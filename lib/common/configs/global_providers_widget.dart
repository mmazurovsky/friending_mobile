import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/bag/stateful/palette.dart';
import 'package:provider/provider.dart';

import '../bag/stateful/spaces.dart';
import '../bag/stateful/styles.dart';
import '../bag/stateful/theme.dart';

class GlobalProviders extends StatelessWidget {
  final Widget child;
  const GlobalProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window).platformBrightness;
    final theme = ThemeStateManager.singleton(brightness);
    final spaces = SpacesStateManager.singleton();
    final styles = StylesStateManager();
    final palette = PaletteStateManager.singleton();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => theme,
        ),
        ChangeNotifierProvider(
          create: (context) => spaces,
        ),
        ChangeNotifierProvider(
          create: (context) => styles,
        ),
        ChangeNotifierProvider(
          create: (context) => palette,
        ),
      ],
      child: child,
    );
  }
}

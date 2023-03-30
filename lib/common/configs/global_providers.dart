import 'package:flutter/material.dart';
import '../bag/stateful/spaces.dart';
import 'package:provider/provider.dart';

import '../bag/stateful/palette.dart';
import '../bag/stateful/styles.dart';
import '../dependency_injection/dependency_injection.dart';
import '../navigation/my_bottom_nav_bar.dart';
import '../theme/theme_state_manager.dart';

class GlobalProviders extends StatelessWidget {
  final Widget child;
  const GlobalProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => getIt<ThemeStateManager>(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaletteStateManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => StylesStateManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => SpacesStateManager(),
        ),
      ],
      child: child,
    );
  }
}

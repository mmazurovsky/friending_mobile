import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          create: (context) => getIt<TabsStateManager>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<ThemeStateManager>(),
        ),
      ],
      child: child,
    );
  }
}

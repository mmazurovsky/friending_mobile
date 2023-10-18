import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../screens/explore/state/geo_permissions_manager.dart';
import '../../screens/profile/state/points_change_notifier.dart';
import '../../screens/profile/state/profile_content_manager.dart';
import '../bag/stateful/styles.dart';
import '../bag/stateful/theme.dart';
import '../dependency_injection/dependency_injection.dart';

class GlobalProviders extends StatelessWidget {
  final Widget child;
  const GlobalProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQueryData.fromWindow(WidgetsBinding.instance.window).platformBrightness;
    final theme = ColorsStateManager.singleton(brightness);
    final styles = StylesStateManager.singleton();
    final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    if (!getIt.isRegistered<GlobalKey<ScaffoldMessengerState>>()) {
      getIt.registerLazySingleton(() => scaffoldMessengerKey);
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => theme,
        ),
        ChangeNotifierProvider(
          create: (context) => styles,
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<GeoPermissionsManager>(),
        ),
        Provider(
          create: (context) => getIt<Connectivity>(),
        ),
        Provider(
          create: (context) => getIt<InternetConnectionChecker>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<PointsChangeNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<ProfileContentManager>(),
        ),
      ],
      child: child,
    );
  }
}

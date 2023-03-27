import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/configs/global_providers.dart';
import 'common/dependency_injection/dependency_injection.dart';
import 'common/navigation/auto_router/app_router.dart';
import 'common/theme/theme_state_manager.dart';
import 'common/theme/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseUIAuth.configureProviders(
    [
      AppleProvider(),
      GoogleProvider(
        iOSPreferPlist: true,
        clientId: 'ignored',
      ),
    ],
  );

  runApp(
    GlobalProviders(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = getIt<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // TODO
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      themeMode: context.watch<ThemeStateManager>().currentMode,
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'common/bag/stateful/theme.dart';
import 'common/configs/global_config_widget.dart';
import 'common/configs/global_providers_widget.dart';
import 'common/configs/hive_initializer.dart';
import 'common/dependency_injection/dependency_injection.dart';
import 'common/navigation/auto_router/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await HiveInitializer.initialize();

  configureDependencies();

  FirebaseUIAuth.configureProviders(
    [
      EmailAuthProvider(),
      AppleProvider(),
      GoogleProvider(
        iOSPreferPlist: true,
        clientId: 'ignored',
      ),
    ],
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    GlobalProviders(
      child: MyApp(
        getIt<AppRouter>(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  const MyApp(
    this._appRouter, {
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final scaffoldMessengerKey = getIt<GlobalKey<ScaffoldMessengerState>>();
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      themeMode: context.watch<ColorsStateManager>().currentBrightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // inputDecorationTheme: const InputDecorationTheme(
        //   border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.grey,
        //     ),
        //   ),
        // ),
      ),
      builder: (context, child) => GlobalConfigWidget(
        child: child!,
      ),
    );
  }
}

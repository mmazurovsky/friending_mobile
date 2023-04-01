import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../screens/widgets/snack_bar.dart';
import '../bag/stateful/spaces.dart';
import '../bag/stateful/theme.dart';
import '../dependency_injection/dependency_injection.dart';
import '../navigation/auto_router/app_router.dart';

class AppStateListenerWidget extends StatefulWidget {
  final Widget child;
  const AppStateListenerWidget({
    super.key,
    required this.child,
  });

  @override
  State<AppStateListenerWidget> createState() => _AppStateListenerWidgetState();
}

class _AppStateListenerWidgetState extends State<AppStateListenerWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _connectionListener();
        _locationPermissionChecker();
      },
    );

    super.initState();
  }

  void _locationPermissionChecker() async {
    final navigatorKey = getIt<AppRouter>().navigatorKey;

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      final enableButton = TextButton(
        child: const Text("Enable location services"),
        onPressed: () async {
          final result = await Geolocator.openLocationSettings();
          if (result) navigatorKey.currentContext!.router.pop();
          //TODO reload people near you
        },
      );

      final cancelButton = TextButton(
        child: const Text("Cancel"),
        onPressed: () {
          navigatorKey.currentContext!.router.pop();
        },
      );

      // set up the AlertDialog
      final alert = AlertDialog(
        title: const Text("Your location services are disabled"),
        content: const Text(
            "You won't be able to see people near you until you enable your location services."),
        actions: [
          cancelButton,
          enableButton,
        ],
      );
      showDialog(
        context: navigatorKey.currentContext!,
        builder: (_) => alert,
      );
    } else {
      final geoPermission = await Geolocator.checkPermission();
      if (geoPermission == LocationPermission.denied) {
        // Show a dialog asking the user to grant permission
        final enableButton = TextButton(
          child: const Text("Give permission"),
          onPressed: () async {
            final result = await Geolocator.requestPermission();
            if (result != LocationPermission.denied &&
                result != LocationPermission.deniedForever) {
              //TODO reload people near you
            }
            navigatorKey.currentContext!.router.pop();
          },
        );

        final cancelButton = TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            getIt<AppRouter>().navigatorKey.currentContext!.router.pop();
          },
        );

        // set up the AlertDialog
        final alert = AlertDialog(
          title: const Text("We need permissions to show people near you"),
          content: const Text(
              "You won't be able to see people near you until you give permissions to get your location."),
          actions: [
            cancelButton,
            enableButton,
          ],
        );

        showDialog(
          context: getIt<AppRouter>().navigatorKey.currentContext!,
          builder: (_) => alert,
        );
      } else if (geoPermission == LocationPermission.deniedForever) {
        // Show a dialog asking the user to grant permission
        final openSettingsButton = TextButton(
          child: const Text("Open settings"),
          onPressed: () async {
            final result = await Geolocator.openAppSettings();
            if (result) {
              navigatorKey.currentContext!.router.pop();
              _locationPermissionChecker();
            } else {
              navigatorKey.currentContext!.router.pop();
            }
          },
        );

        final cancelButton = TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            navigatorKey.currentContext!.router.pop();
          },
        );

        // set up the AlertDialog
        final alert = AlertDialog(
          title: const Text("We need permissions to show people near you"),
          content: const Text(
              "You won't be able to see people near you until you give permissions to get your location."),
          actions: [
            cancelButton,
            openSettingsButton,
          ],
        );

        showDialog(
          context: navigatorKey.currentContext!,
          builder: (_) => alert,
        );
      }
    }
  }

  void _connectionListener() {
    final scaffoldMessengerKey =
        context.read<GlobalKey<ScaffoldMessengerState>>();
    Provider.of<Connectivity>(context, listen: false)
        .onConnectivityChanged
        .listen(
      (event) async {
        final hasConnection =
            await context.read<InternetConnectionChecker>().hasConnection;

        if (!hasConnection && context.mounted) {
          scaffoldMessengerKey.currentState
            ?..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    context.spacesRead.radius1,
                  ),
                ),
                backgroundColor: context.theme.snackBarTheme.backgroundColor,
                content: const CustomSnackBarContent(
                  'No internet connection',
                ),
                duration: const Duration(milliseconds: 1400),
              ),
            );
        }
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _changeBrightnessInChangeNotifier();
    super.didChangePlatformBrightness();
  }

  void _changeBrightnessInChangeNotifier() {
    final newBrightness =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .platformBrightness;
    Provider.of<ThemeStateManager>(context, listen: false).changeBrightness(
      newBrightness,
    );
  }

  @override
  void didChangeMetrics() {
    final screenWidth = MediaQuery.of(context).size.width;
    context.read<SpacesStateManager>().initOrChangeWidth(screenWidth);
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../bag/strings.dart';
import '../dependency_injection/dependency_injection.dart';
import '../navigation/auto_router/app_router.dart';

class LocationPermissionChecker {
  static void locationPermissionChecker() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services globally.
      _showAlertDialogWhenLocationServicesDisabled();
    } else {
      final geoPermission = await Geolocator.checkPermission();
      if (geoPermission == LocationPermission.denied) {
        _showAlertDialogWhenLocationPermissionDenied();
      } else if (geoPermission == LocationPermission.deniedForever) {
        // Show a dialog asking the user to open this app settings
        _showAlertDialogWhenLocationPermissionDeniedForever();
      }
    }
  }
}

Future<T?> _showAlertDialogWhenLocationServicesDisabled<T>() {
  final navigatorKey = getIt<AppRouter>().navigatorKey;

  final enableButton = TextButton(
    child: Text(Strings.ui.enableLocationServices),
    onPressed: () async {
      final result = await Geolocator.openLocationSettings();
      if (result) {
        LocationPermissionChecker.locationPermissionChecker();
      }
    },
  );

  final cancelButton = TextButton(
    child: Text(Strings.ui.cancel),
    onPressed: () {
      navigatorKey.currentContext!.router.pop();
    },
  );

  // set up the AlertDialog
  final alert = AlertDialog(
    title: Text(Strings.ui.locationPermissionTitle),
    content: Text(Strings.ui.locationPermissionText1),
    actions: [
      cancelButton,
      enableButton,
    ],
  );
  return showDialog<T>(
    context: navigatorKey.currentContext!,
    builder: (_) => alert,
  );
}

Future<T?> _showAlertDialogWhenLocationPermissionDenied<T>() {
  final navigatorKey = getIt<AppRouter>().navigatorKey;

// Show a dialog asking the user to grant permission
  final enableButton = TextButton(
    child: Text(Strings.ui.givePermission),
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
    child: Text(Strings.ui.cancel),
    onPressed: () {
      getIt<AppRouter>().navigatorKey.currentContext!.router.pop();
    },
  );

  // set up the AlertDialog
  final alert = AlertDialog(
    title: Text(Strings.ui.locationPermissionTitle),
    content: Text(Strings.ui.locationPermissionText2),
    actions: [
      cancelButton,
      enableButton,
    ],
  );

  return showDialog(
    context: getIt<AppRouter>().navigatorKey.currentContext!,
    builder: (_) => alert,
  );
}

Future<T?> _showAlertDialogWhenLocationPermissionDeniedForever<T>() {
  final navigatorKey = getIt<AppRouter>().navigatorKey;
  final openSettingsButton = TextButton(
    child: Text(Strings.ui.openSettings),
    onPressed: () async {
      final result = await Geolocator.openAppSettings();
      if (result) {
        navigatorKey.currentContext!.router.pop();
        LocationPermissionChecker.locationPermissionChecker();
      } else {
        navigatorKey.currentContext!.router.pop();
      }
    },
  );

  final cancelButton = TextButton(
    child: Text(Strings.ui.cancel),
    onPressed: () {
      navigatorKey.currentContext!.router.pop();
    },
  );

  // set up the AlertDialog
  final alert = AlertDialog(
    title: Text(Strings.ui.locationPermissionTitle),
    content: Text(Strings.ui.locationPermissionText2),
    actions: [
      cancelButton,
      openSettingsButton,
    ],
  );

  return showDialog(
    context: navigatorKey.currentContext!,
    builder: (_) => alert,
  );
}

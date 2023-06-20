import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@singleton
class GeoPermissionsManager with ChangeNotifier {
  GeoPermissionsManager() {
    checkLocationPermissionAndStore();
  }

  LocationPermission? _locationPermission;

  LocationPermission get locationPermission => _locationPermission!;

  Future<void> checkLocationPermissionAndStore() {
    return Geolocator.checkPermission().then((locationPermission) {
      if (_locationPermission != locationPermission) {
        _locationPermission = locationPermission;
        notifyListeners();
      }
    });
  }
}

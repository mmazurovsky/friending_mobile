import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/entities/user_entities.dart';
import '../../../common/data/failures/failures.dart';
import '../repo/coordinates_repo.dart';
import '../repo/user_list_repo.dart';
import 'geo_permissions_manager.dart';

@lazySingleton
class ExploreStateManager with ChangeNotifier {
  final UserListRepo _userListRepo;
  final CoordinatesRepo _coordinatesRepo;
  final GeoPermissionsManager _geoPermissionsManager;

  ExploreStateManager(
    this._userListRepo,
    this._coordinatesRepo,
    this._geoPermissionsManager,
  );

  Failure? _failure;
  Failure? get failure => _failure;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _maxDistanceInKm = 100;
  int get maxDistanceInKm => _maxDistanceInKm;

  List<ShortReadUserEntity> _nearbyUsers = [];
  List<ShortReadUserEntity> get nearbyUsers => _nearbyUsers;

  List<ShortReadUserEntity> _usersWithMostCommonTags = [];
  List<ShortReadUserEntity> get usersWithMostCommonTags =>
      _usersWithMostCommonTags;

  void changeMaxDistanceInKm(int newMaxDistanceInKm) {
    _maxDistanceInKm = newMaxDistanceInKm;
    notifyListeners();
  }

  void fetchUsers() async {
    _isLoading = true;

    final usersWithCommonTagsFuture =
        _userListRepo.getUsersWithMostCommonTags();

    final userGeoPermission = _geoPermissionsManager.locationPermission;
    if (userGeoPermission != LocationPermission.denied &&
        userGeoPermission != LocationPermission.deniedForever) {
      final nearbyUsersFuture = _userListRepo.getUsersNearby(
        maxDistanceInKm: _maxDistanceInKm,
      );

      _nearbyUsers = await nearbyUsersFuture;
    }

    _usersWithMostCommonTags = await usersWithCommonTagsFuture;

    _isLoading = false;
    notifyListeners();
    _failure = null;
  }
}

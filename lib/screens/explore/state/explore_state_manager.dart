import 'package:flutter/material.dart';
import 'package:flutter_mobile_starter/common/data/models/user_models.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

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

  List<ShortReadUserModel> _nearbyUsers = [];
  List<ShortReadUserModel> get nearbyUsers => _nearbyUsers;

  List<ShortReadUserModel> _usersWithMostCommonTags = [];
  List<ShortReadUserModel> get usersWithMostCommonTags => _usersWithMostCommonTags;

  void changeMaxDistanceInKm(int newMaxDistanceInKm) {
    _maxDistanceInKm = newMaxDistanceInKm;
    notifyListeners();
  }

  void refreshUsers() async {
    await _fetchAndAssignUsers();
    _refreshController.refreshCompleted();
    notifyListeners();
  }

  void fetchUsers() async {
    _isLoading = true;
    await _fetchAndAssignUsers();
    _isLoading = false;
    notifyListeners();
    _failure = null;
  }

  Future<void> _fetchAndAssignUsers() async {
    final usersWithCommonTagsFuture = _userListRepo.getRelevantUsers();

    final userGeoPermission = _geoPermissionsManager.locationPermission;
    if (userGeoPermission != LocationPermission.denied && userGeoPermission != LocationPermission.deniedForever) {
      final nearbyUsersFuture = _userListRepo.getUsersNearby(
        maxDistanceInKm: _maxDistanceInKm,
      );

      _nearbyUsers = await nearbyUsersFuture;
    }

    _usersWithMostCommonTags = await usersWithCommonTagsFuture;
  }
}
